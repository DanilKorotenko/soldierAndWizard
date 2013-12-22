dofile('soldierAndWizard/nearMiller.lua');
dofile('soldierAndWizard/inTheMill.lua');
dofile('soldierAndWizard/cemetery.lua');
dofile('soldierAndWizard/justMarriedRoom.lua');
dofile('soldierAndWizard/nearWizardGrave.lua');
dofile('soldierAndWizard/nearWizardGraveFinalScene.lua');
dofile('soldierAndWizard/wayNearCemetery.lua');
dofile('soldierAndWizard/wedding.lua');
dofile('soldierAndWizard/weddingHouse.lua');
dofile('soldierAndWizard/willage.lua');

global
{
	justMarriedIsLive = false,
	prepareToFire = false,
	gayHelp = false,
	wizardOnFire = false,
	wizardBurn = false,
}

soldierAndWizard = room {
	nam = 'Солдат и колдун',
	dsc = 'Отпустили одного солдата в побывку на родину. Вот он шел, шел, долго ли, коротко ли, и стал к своему селу приближаться.',
	obj = { vway("Далее", "{Далее}", 'nearMiller') },
};
