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

