soldierAndWizard = room 
{
	nam = 'Солдат и колдун',
	dsc = 'Отпустили одного солдата в побывку на родину. Вот он шел, шел, долго ли, коротко ли, и стал к своему селу приближаться.',
	obj = { vway("Далее", "{Далее}", 'nearMiller') },
};

nearMiller = room {
	nam = 'Возле мельника',
	dsc = 'Вы стоите недалеко от мельницы. Вечереет. ^^В былое время Вы водили с мельником большое знакомство; отчего не зайти к приятелю?',
	obj = { willage, mill },
};

willage = obj
{
	nam = 'Деревня',
	dsc = '{Деревня} просматривается где-то на горизонте.',
	act = function()
		p 'Нет. Надо домой идти. Там родные уже заждались. Вы решили тихонько пройти мимо мельницы. Стоило вам немного отойти, как за спиной вас окрикнули: ^^ - Эй! Давненько мы с тобой не виделись!^^ "Прийдется все-таки зайти к мельнику", подумали Вы.';
		return walk('inTheMill');
	end,
};

mill = obj
{
	nam = 'Мельница',
	dsc = '{Мельница} стоит и поскрипывает.',
	act = function()
		p 'Вы решаетесь зайти к мельнику.';
		return walk('inTheMill');
	end,
};

millerDialog = dlg {
	nam = 'Разговор с мельником',
	dsc = 'Собирается солдат идти на село;',
	obj = {
	[1] = phr('Пойду ка я на село.', 'Служивый, ночуй ка у меня; теперь уж поздно!', [[pon(2)]]),
	[2] = _phr('А что так?', 'Бог наказал! Помер у нас страшный колдун; по ночам встает из могилы, бродит поселу и то творит, что на самых смелых страх нагоняет! Как бы он и тебя не потревожил!', [[pon(3)]]),
	[3] = _phr('Ничего! Солдат — казенный человек, а казенное в воде не тонет, ни в огне не горит; пойду, больно хочется с родными поскорей увидаться.', 'Ну бывай.', [[walk(wayNearCemetery)]]),
	},
};

miller = obj
{
	nam = 'Мельник',
	dsc = '{Мельник} смотрит на вам слегка мутным взглядом.',
	act = function()
		return walk('millerDialog');
	end,
};

inTheMill = room {
	nam = 'Мельница',
	dsc = 'Внутри мельницы уютно и пахнет мукой. Мельник встретил Вас ласково, сейчас винца принес, стали распивать да просвое житье-бытье толковать. Дело было к вечеру, а как погостили у мельника так и вовсе смерклось.',
	obj = { miller },
};

wizardOnCemeteryDialog = dlg {
	nam = 'Разговор с Колдуном на кладбище',
	obj = {
	[1] = phr('Здорово, брат! -- крикнул ему служивый.', 'Колдун взглянул и спрашивает:^^ - Ты сюда зачем?', [[pon(2)]]),
	[2] = _phr('Да захотел посмотреть, что ты тут делаешь.', 'Колдун бросил свою работу и зовет солдата на свадьбу: "Пойдем, брат, погуляем — в селе нынче свадьба!"', [[pon(3)]]),
	[3] = _phr('Пойдем!', '', [[walk(wedding)]]),
	},
};

wizardOnCemetery = obj
{
	nam = 'Колдун на кладбище',
	dsc = 'Возле огня {колдун} сидит да сапоги тачает.',
	act = function()
		return walk('wizardOnCemeteryDialog');
	end,

};

cemetery = room {
	nam = 'Кладбище',
	dsc = 'Подходит.',
	obj = { 'wizardOnCemetery' },
};

doorFromWeddingHouseToWillage = obj
{
	nam = 'Дверь из дома где была свадьба в деревню',
	dsc = 'Ну что ж, дело сделано. Пора уходить {от сюда}.',
	act = function(s)
		walk('willage');
	end,
};

doorFromJustMarriedRoomToWeddingHouse = obj
{
	nam = 'Дверь из кмнаты молодых в дом',
	dsc = '{Дверь} которая ведет в дом.',
	act = function(s)
		if seen('liveBride', 'justMarriedRoom') and seen('liveGroom', 'justMarriedRoom') then
			weddingHouse.obj:add(weddingKinsmenHappy);
			weddingHouse.obj:del(weddingKinsmen);
			weddingHouse.obj:add(doorFromWeddingHouseToWillage);

			willage.obj:add('elderPlace');

			willage.obj:add('weddingPlaceHappy');
			willage.obj:del('weddingPlace');

			walk('weddingHouse');
		else
			p 'Рано еще возвращатся к родичам. Что я им скажу?'
		end
	end,
};

deadGroom = obj
{
	nam = 'Мертвый жених.',
	dsc = 'На кровати лежит {жених}. Тело его бездыханно.'
};

deadBride = obj
{
	nam = 'Мертвая невеста',
	dsc = 'Рядом с женихом лежит мертвая {невеста}.'
};

justMarriedRoom = room {
	nam = 'Комната молодых.',
	dsc = 'Это комната молодых.',
	obj = { 'deadGroom', 'deadBride', 'doorFromJustMarriedRoomToWeddingHouse' },
};

groomBlood = obj
{
	nam = 'Пузырек с кровью жениха',
	use = function(s, w)
		if w ~= deadGroom then
			p 'Тут надо действовать как говорил колдун, а не тыкать предметами куда-попало.'
			return false
		else
			p 'Только вы влили жениху его кровь, тот час же он открыл глаза, сделал глубокий вдох и сел на краю кровати.';
			justMarriedRoom.obj:del('deadGroom');
			justMarriedRoom.obj:add('liveGroom');
			inv():del(groomBlood);
		end
	end
};

brideBlood = obj
{
	nam = 'Пузырек с кровью невесты',
	use = function(s, w)
		if w ~= deadBride then
			p 'Тут надо действовать как говорил колдун, а не тыкать предметами куда-попало.'
			return false
		else
			p 'После того как вы произвели операцию над невестой, она еще некоторое время лежала нешелохнувшись. Вы уже начали было думать что что-то пошло не так. Но как только вы так подумали, невеста подскочила на кровати как ужаленная, улеглась обратно и затихла, лишь поглядывала на вас время от времени.';
			justMarriedRoom.obj:del('deadBride');
			justMarriedRoom.obj:add('liveBride');
			inv():del(brideBlood);
		end
	end
};

wayToWillage = obj {
	nam = 'Дорога в деревню',
	dsc = 'Невдалеке проходит {дорога} в деревню.',
	act = function(s)
		if have('groomBlood') and have('brideBlood') then
			p 'Пора идти к родичам в деревню.'
			return walk(willage);
		else
			return 'Сперва надо обыскать колдуна, авось что то интресное найду.'
		end
	end,
};

deadWizard = obj
{
	nam = 'Мертвый колдун',
	dsc = '{Колдун} упал бездыханен.',
	act = function()
		p 'Из левого кармана колдуна вы достали пузырек с кровью невесты, а из правого с кровью жениха.';
		inv():add(brideBlood);
		inv():add(groomBlood)
	end,

};

nearWizardGrave = room {
	nam = 'Возле могилы колдуна',
	dsc = 'Дрались-дрались, солдат почти из сил выбился; эх, думает, ни за грош пропал! Запели петухи.',
	obj = { 'deadWizard', 'wayToWillage' },
};

wizardInGrave = obj
{
	nam = 'Колдун в могиле.',
	dsc = function()
		if wizardBurn then
			return 'Колдун горит! Тело его раздулось, того и гляди лопнет.'
		else
			if wizardOnFire then
				return 'Колдун привязан к столбу на костре.';
			else
				return '{Колдун} лежит в могиле.';
			end;
		end;
	end,
	act = function()
		if gayHelp then
			p '"Берем колдуна и привязываем цепями к столбу в середине костра." - говорите вы парню.';
			p 'Вы привязали колдуна к столбу.';
			nearWizardGrave.obj:del('wizardInGrave');
			wizardOnFire = true;
		else
			p '"Сам я колдуна не подниму" - подумали вы. Надо позвать кого-нибудь из селян на помощь.';
		end;
	end,
};

wizardGrave = obj
{
	nam = 'Могила колдуна',
	dsc = '{Могила} колдуна разрыта и вокруг нее много следов.',
	act = function()
		p 'Вы заглянули в могилу - Колдун лежит в ней и не двигается';
		return wizardGrave.obj:add('wizardInGrave');
	end,
};

folks = obj
{
  	prepareToFire = false,
	nam = 'Селяне',
	dsc = function(s)
		if not prepareToFire then
			return '{Селяне} свозят дрова.';
		else
			return '{Селяне} свозят дрова и готовят костер.';
		end
	end,
	act = function()
		if not prepareToFire then
			p '"Готовьте костер!" - крикнули вы селянам.';
			prepareToFire = true;
		else 
			if not gayHelp then
				if seen('wizardInGrave', 'wizardGrave') then
					p '"Эй, кто нибудь! Помогите мне посадить колдуна в костер!" - кричите вы. К Вам подошел здоровый парень. "Ну давай, командуй" - сказал он.';
					gayHelp = true;
				end
			else
				if wizardOnFire then
					p '"Поджигай!" - крикнули вы селянам. Селяне подсуетились и подожгли костер. Костер быстро разгорелся, и через пару мгновений колдун был полностью охвачен пламенем.';
					wizardBurn = true;
					wizardOnFire = false;
				else
					if wizardBurn then
						p '"Теперь хватайте вилы, дубины и смотрите в оба! Сейчас из колдуна всякие твари да гады полезут! Ни одного нельзя пропустить. Всех ловите и бросайте в костер." Как только вы это сказали так тело колдуна вздулось словно пузырь, лопнуло и от туда в рассыпную полезли змеи, червяки, запрыгали жабы, полетели летучие мыши. Селяне их всех ловили, били палками, сбивали камнями и бросали обратно в костер. Вскоре это все закончилось и костер со временем угас, оставив после себя лишь пепел.'
					end;
				end
			end
		end
	end,
};

nearWizardGraveFinalScene = room {
	nam = 'Возле могилы колдуна',
	dsc = 'Вы находитесь на кладбище. Солнце в зените.',
	obj = { 'wizardGrave', 'folks' },
};

wayNearCemetery = room {
	nam = 'Дорога мимо кладбища',
	dsc = 'Отправился; дорога шла мимо кладбища. Видит — на могиле огонек светится.',
	obj = { vway("Идти на кладбище", "Что такое? Дай {посмотрю}", 'cemetery') },
};

wizardOnWayDialog = dlg {
	nam = 'Разговор с Колдуном по дороге',
	dsc = 'Вот и пошли. На дороге солдат спрашивает:',
	obj = {
	[1] = phr('Скажи, для чего набрал ты в пузырьки крови?', 'Для того, чтоб жених с невестою померли; завтра никто их не добудится! Только один я знаю, как их оживить.', [[pon(2)]]),
	[2] = _phr('А как?', 'Надо разрезать у жениха и невесты пяты и в те раны влить опять кровь — каждому свою естественно: в правом кармане спрятана у меня кровь жениха, а в левом невестина.', [[pon(3)]]),
	[3] = _phr('[Промолчать]', 'Я, — говорит, — что захочу, то и сделаю!', [[pon(4)]]),
	[4] = _phr('Будто с тобой и сладить нельзя, так что ли?', 'Как нельзя? Вот если б кто набрал костер осиновых дров во сто возов да сжег меня на этом костре, так, может, и сладил бы со мною! Только жечь меня надо умеючи; в то время полезут из моей утробы змеи, черви и разные гады, полетят галки, сороки и вороны; их надо ловить да в костер бросать: если хоть один червяк уйдет, тогда ничто не поможет! В том червяке я ускользну!', [[pon(5)]]),
	[5] = _phr('[Промолчать и запомнить]', 'Говорили, говорили, и дошли, наконец, до могилы, "Ну, брат, — сказал колдун, — теперь я тебя разорву; а то ты все расскажешь"', [[pon(6)]]),
	[6] = _phr('Да ты что задумал! Как меня рвать? Я богу и государю служу.', 'Колдун заскрипел зубами, завыл и бросился на солдата, а тот выхватил саблю и стал наотмашь бить.', [[walk(nearWizardGrave)]]),
	},
};

wedding = room {
	nam = 'Свадьба',
	dsc = 'Пришли на свадьбу, начали их поить, угощать всячески. Колдун пил-пил, гулял-гулял и осердился; прогнал из избы всех гостей и семейных, усыпил повенчанных, вынул два пузырька и шильце, ранил шильцем руки жениха и невесты и набрал их крови. Сделал это и говорит солдату:',
	obj = { vway("Пора идти с свадьбы", "{Теперь пойдем отсюда}", 'wizardOnWayDialog') },
};

liveGroom = obj
{
	nam = 'Живой жених',
	dsc = 'Жених сидит и смотрит вокруг, будто и понимает что с ним произошло.'
};

liveBride = obj
{
	nam = 'Живая невеста',
	dsc = 'Рядом с женихом лежит живая невеста.'
};

justMarriedPlace = obj
{
	nam = 'Комната с молодыми',
	dsc = 'В доме есть {комната} где лежат молодые.',
	act = function()
		return walk('justMarriedRoom');
	end,
};

weddingKinsmenDialog = dlg {
	nam = 'Разговор с родичами молодых',
	dsc = 'все семейство в слезах.',
	obj = {
	[1] = phr('О чем горюете?', 'Так и так, служивый!', [[pon(2)]]),
	[2] = _phr('Я могу оживить ваших молодых; что дадите?', 'Да хоть половину именья забирай!', [[weddingHouse.obj:add('justMarriedPlace')]]),
	[3] = _phr('[Поговорить еще с родичами о том, о сем. Да и отправится спать, а то ночь не спавши, усталость с ног валит.]', '', [[walk(kinsmenInMorningDialog)]]),
	},
};

weddingKinsmen = obj
{
	nam = 'Родичи молодых',
	dsc = function(s)
			return 'По комнатам сидят {родные} молодых и плачут.'
	end,
	act = function(s)
		if seen('justMarriedPlace', 'weddingHouse') then
			p 'Хватит ворошить чужое горе. Раз уж взялся выручать жаниха и невесту так надо делать.'
		else
			walk(weddingKinsmenDialog)
		end
	end,
};

weddingKinsmenHappy = obj
{
	nam = 'Родичи молодых',
	dsc = function(s)
		return 'Теперь родичи молодых радуются.'
	end,
	act = function(s)
		if seen('justMarriedPlace', 'weddingHouse') then
			p 'Хватит ворошить чужое горе. Раз уж взялся выручать жаниха и невесту так надо делать.'
		else
			walk(weddingKinsmenDialog)
		end
	end,
};

weddingHouse = room {
	nam = 'Дом где справлялась свадьба.',
	dsc = 'Это дом где справлялась свадьба. Вы вспоминаете как бывали здесь ночью с колдуном.',
	obj = { 'weddingKinsmen' },
	enter = function(s, f)
		if f == justMarriedRoom then
			weddingHouse.obj:del('justMarriedPlace');
			return 'Только вы вышли из комнаты молодых, за вами вышли и сами жених с невестой. Родственники сразу же обрадовались стали вас горячо благодарить.';
		else
			return 'Вы вошли в дом где была свадьба. Все вокруг заняты своим горем. Никто на вас и внимания не обратил.'
		end
	end,
};

elderDialog = dlg {
	nam = 'Разговор со старостой.',
	dsc = 'Приходит солдат к старосте, а тот ему и говорит: - Знаю я уже про то как ты молодых спас. Прям чудо сотворил. А может ты еще знаеш как нам от злого колдуна избавится?',
	obj = {
	[1] = phr('Так точно! Знаю.', 'Рассказывай.', [[pon(2)]]),
	[2] = _phr('Соберите всех крестьян, да прикажите им заготовить сто возов осиновых дров. И чтоб везли эти дрова на кладбище к могиле колдуна...', 'Неужто ты его сжигать собрался! А где гарантия что все получится? Это ведь колдун, а не кто-нибудь. А вдруг он ускользнет? Или того хуже мы его этим только разозлим, и тогда совсем бытия нам не будет.', [[pon(3)]]),
	[3] = _phr('Знаю я один метод. Если все зделать правильно, не ускользнет! Прикажите людям чтоб еще вооружились они кто чем может: лопатами, вилами, дубинками. Когда колдун гореть будет, из него твари разные начнут лезть, надо их собирать и в огонь обратно бросать. Если хоть одна тварь проскочит, в той твари колдун и спасется.', 'Ну что ж, план твой ясен. Сейчас так поступим: ты иди на кладбище, а я буду людей следом за тобой высылать. Ты уж там их организуй. Порешим колдуна!', [[pon(4)]]),
	[4] = _phr('Так точно!', 'Ступай.', [[walk(nearWizardGraveFinalScene)]]),
	},
};

elderPlace = obj
{
	nam = 'Переход в дом старосты',
	dsc = 'Пора кончать с этим колдуном, а то как бы он еще лиха не наделал. Самое время отправлятся к {старосте}.',
	act = function()
		return walk('elderDialog');
	end,
};

weddingPlace = obj
{
	nam = 'Дом где свадьба справлялась',
	dsc = function(s)
		return '{Дом} где свадьба справлялась.'
	end,
	act = function()
		return walk('weddingHouse');
	end,
};

weddingPlaceHappy = obj
{
	nam = 'Дом где свадьба справлялась',
	dsc = function(s)
		return 'Из дома где была свадьба теперь снова слышны веселые голоса, песни и музыка.'
	end,
};

kinsmenInMorningDialog = dlg {
	nam = 'Разговор с родичами в деревне утром',
	dsc = 'наутро проснулся солдат и начал спрашивать:',
	obj = {
	[1] = phr('Говорят, у вас свадьба где-то справляется?', 'Была свадьба у одного богатого мужика, только и жених и невеста нынешней ночью померли, а отчего — неизвестно', [[pon(2)]]),
	[2] = _phr('А где живет этот мужик?', '[Родичи показывают вам где дом.]', [[willage.obj:add(weddingPlace); walk(willage);]]),
	},
};

kinsmenInEveningDialog = dlg {
	nam = 'Разговор с родичами в деревне вечером',
	obj = {
	[1] = phr('Здравствуйте родичи дорогие.', 'Здоров будь, служивый. Не видал ли ты, служивый, какой тревоги?', [[pon(2)]]),
	[2] = _phr('Нет, не видал', 'То-то! А у нас на селе горе: колдун ходить повадился', [[pon(3)]]),
	[3] = _phr('[Поговорить еще с родичами о том, о сем. Да и отправится спать, а то ночь не спавши, усталость с ног валит.]', '', [[walk(kinsmenInMorningDialog)]]),
	},
};

kinsmen = obj
{
	nam = 'Родичи',
	dsc = 'В деревне живут {родичи}.',
	act = function(s)
		if seen('weddingPlace', 'willage') then
			p 'Нечего больше с родичами лясы точить. Пора идти выручать молодых.'
		else
			walk(kinsmenInEveningDialog)
		end
	end,
};

willage = room {
	nam = 'Деревня',
	dsc = 'Родная деревня.',
	obj = { 'kinsmen' },
};

game_constants
{
	gayHelp = false,
	wizardOnFire = false,
	wizardBurn = false,
}
