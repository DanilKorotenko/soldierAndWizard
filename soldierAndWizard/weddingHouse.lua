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

