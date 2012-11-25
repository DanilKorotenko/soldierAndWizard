wizardGrave = obj
{
	nam = 'Могила колдуна',
	dsc = '{Могила} колдуна разрыта и вокруг нее много следов.',
	act = function()
		p 'Вы заглянули в могилу - Колдун лежит в ней и не двигается';
		return wizardGrave.obj:add('wizardInGrave');
	end,
};

