-- $Name:Солдат и колдун$
-- $Version:1.0.0$
-- $Author:Данил Коротенко$

game.dsc = [[По мотивам народной сказки.]];

instead_version '1.6.0';

game.codepage = 'UTF-8';
game.forcedsc = true;

dofile('soldierAndWizard/soldierAndWizard.lua');

main = room {
	nam = 'Солдат и колдун',
	dsc = "По мотивам народной сказки."..[[^^
	Реализация: (С) Ноябрь 2012. Данил Коротенко (danil.korotenko@gmail.com).]],
	obj = { vway("Начать игру", "{Начать игру}", 'soldierAndWizard') },
};

