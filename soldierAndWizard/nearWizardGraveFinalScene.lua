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

