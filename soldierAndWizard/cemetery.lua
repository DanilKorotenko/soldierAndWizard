wizardOnCemeteryDialog = dlg {
	nam = 'Разговор с Колдуном на кладбище',
	obj = {
	[1] = phr('Здорово, брат! -- крикнул ему служивый.', 'Колдун взглянул и спрашивает:^^ - Ты сюда зачем?', [[pon(2)]]),
	[2] = _phr('Да захотел посмотреть, что ты тут делаешь.', 'Колдун бросил свою работу и зовет солдата на свадьбу: "Пойдем, брат, погуляем — в селе нынче свадьба!"', [[pon(3)]]),
	[3] = _phr('Пойдем!', '', [[walk(wedding)]]),
	},
};

wizardOnCemetery = obj
{
	nam = 'Колдун на кладбище',
	dsc = 'Возле огня {колдун} сидит да сапоги тачает.',
	act = function()
		return walk('wizardOnCemeteryDialog');
	end,

};

cemetery = room {
	nam = 'Кладбище',
	dsc = 'Подходит.',
	obj = { 'wizardOnCemetery' },
};
