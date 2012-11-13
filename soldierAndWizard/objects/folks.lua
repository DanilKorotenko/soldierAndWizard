folks = obj
{
	nam = 'Селяне',
	dsc = function(s)
		if prepareToFire = false then
			return '{Селяне} свозят дрова.';
		else
			return '{Селяне} свозят дрова и готовят костер.';
		end
	end,
--	act = function()
--		p 'Вы заглянули в могилу - Колдун лежит в ней и не двигается';
--		return nearWizardGrave.obj:add('wizardInGrave');
--	end,
};

