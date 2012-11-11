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

