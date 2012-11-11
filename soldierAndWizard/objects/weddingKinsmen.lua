weddingKinsmen = obj
{
	nam = 'Родичи молодых',
	dsc = function(s)
		if justMarriedIsLive then
			return 'Теперь родичи молодых радуются.'
		else
			return 'По комнатам сидят {родные} молодых и плачут.'
		end
	end,
	act = function(s)
		if seen('justMarriedPlace', 'weddingHouse') then
			p 'Хватит ворошить чужое горе. Раз уж взялся выручать жаниха и невесту так надо делать.'
		else
			walk(weddingKinsmenDialog)
		end
	end,
};

