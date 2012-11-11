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

