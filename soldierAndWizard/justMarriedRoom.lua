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

