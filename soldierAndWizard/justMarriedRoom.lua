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
		if not seen('liveBride', 'justMarriedRoom') and not seen('liveGroom', 'justMarriedRoom') then
			p 'Рано еще возвращатся к родичам. Что я им скажу?'
		else
			justMarriedIsLive = true;
			weddingHouse.obj:add(doorFromWeddingHouseToWillage);
			walk('weddingHouse');
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

