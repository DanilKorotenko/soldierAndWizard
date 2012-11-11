weddingPlace = obj
{
	nam = 'Дом где свадьба справлялась',
	dsc = function(s)
		if justMarriedIsLive then
			return 'Из дома где была свадьба теперь снова слышны веселые голоса, песни и музыка.'
		else
			return '{Дом} где свадьба справлялась.'
		end
	end,
	act = function()
		return walk('weddingHouse');
	end,
};

