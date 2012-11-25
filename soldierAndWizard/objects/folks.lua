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
					p '"Поджигай!" - крикнули вы селянам.';
				end
			end
		end
	end,
};

