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
