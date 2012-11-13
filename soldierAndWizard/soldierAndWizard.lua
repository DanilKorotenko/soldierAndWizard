-- Dialogs --
dofile('soldierAndWizard/dialogs/elderDialog.lua');
dofile('soldierAndWizard/dialogs/kinsmenInEveningDialog.lua');
dofile('soldierAndWizard/dialogs/kinsmenInMorningDialog.lua');
dofile('soldierAndWizard/dialogs/millerDialog.lua');
dofile('soldierAndWizard/dialogs/weddingKinsmenDialog.lua');
dofile('soldierAndWizard/dialogs/wizardOnCemeteryDialog.lua');
dofile('soldierAndWizard/dialogs/wizardOnWayDialog.lua');

-- Objects --
dofile('soldierAndWizard/objects/brideBlood.lua');
dofile('soldierAndWizard/objects/deadBride.lua');
dofile('soldierAndWizard/objects/deadGroom.lua');
dofile('soldierAndWizard/objects/deadWizard.lua');
dofile('soldierAndWizard/objects/doorFromJustMarriedRoomToWeddingHouse.lua');
dofile('soldierAndWizard/objects/doorFromWeddingHouseToWillage.lua');
dofile('soldierAndWizard/objects/elderPlace.lua');
dofile('soldierAndWizard/objects/groomBlood.lua');
dofile('soldierAndWizard/objects/justMarriedPlace.lua');
dofile('soldierAndWizard/objects/kinsmen.lua');
dofile('soldierAndWizard/objects/liveBride.lua');
dofile('soldierAndWizard/objects/liveGroom.lua');
dofile('soldierAndWizard/objects/wayToWillage.lua');
dofile('soldierAndWizard/objects/weddingKinsmen.lua');
dofile('soldierAndWizard/objects/weddingPlace.lua');
dofile('soldierAndWizard/objects/wizardOnCemetery.lua');

-- Rooms --
dofile('soldierAndWizard/rooms/cemetery.lua');
dofile('soldierAndWizard/rooms/justMarriedRoom.lua');
dofile('soldierAndWizard/rooms/nearWizardGrave.lua');
dofile('soldierAndWizard/rooms/nearWizardGraveFinalScene.lua');
dofile('soldierAndWizard/rooms/wayNearCemetery.lua');
dofile('soldierAndWizard/rooms/wedding.lua');
dofile('soldierAndWizard/rooms/weddingHouse.lua');
dofile('soldierAndWizard/rooms/willage.lua');

global
{
	justMarriedIsLive = false,
	prepareToFire = false,
	guyInAHelp = false,
}

soldierAndWizard = room {
	nam = 'Солдат и колдун',
	dsc = 'Отпустили одного солдата в побывку на родину. Вот он шел, шел, долго ли, коротко ли, и стал к своему селу приближаться. Недалеко от села жил мельник на мельнице; в былое время солдат водил с ним большое знакомство; отчего не зайти к приятелю? Зашел; мельник встретил его ласково, сейчас винца принес, стали распивать да просвое житье-бытье толковать. Дело было к вечеру, а как погостил солдат у мельника так и вовсе смерклось.',
	obj = { vway("Пора идти на село", "Пора идти на {село}", 'millerDialog') },
};

