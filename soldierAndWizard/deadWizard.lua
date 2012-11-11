deadWizard = obj
{
	nam = 'Мертвый колдун',
	dsc = '{Колдун} упал бездыханен.',
	act = function()
		p 'Из левого кармана колдуна вы достали пузырек с кровью невесты, а из правого с кровью жениха.';
		inv():add(brideBlood);
		inv():add(groomBlood)
	end,

};

