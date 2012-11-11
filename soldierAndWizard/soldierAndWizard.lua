dofile('soldierAndWizard/millerDialog.lua');
dofile('soldierAndWizard/wayNearCemetery.lua');
dofile('soldierAndWizard/cemetery.lua');
dofile('soldierAndWizard/wizardOnCemetery.lua');
dofile('soldierAndWizard/wizardOnCemeteryDialog.lua');
dofile('soldierAndWizard/wedding.lua');
dofile('soldierAndWizard/wizardOnWayDialog.lua');
dofile('soldierAndWizard/nearWizardGrave.lua');
dofile('soldierAndWizard/deadWizard.lua');
dofile('soldierAndWizard/brideBlood.lua');
dofile('soldierAndWizard/groomBlood.lua');
dofile('soldierAndWizard/wayToWillage.lua');
dofile('soldierAndWizard/willage.lua');
dofile('soldierAndWizard/kinsmen.lua');
dofile('soldierAndWizard/kinsmenInEveningDialog.lua');
dofile('soldierAndWizard/kinsmenInMorningDialog.lua');
dofile('soldierAndWizard/weddingPlace.lua');
dofile('soldierAndWizard/weddingHouse.lua');
dofile('soldierAndWizard/weddingKinsmen.lua');
dofile('soldierAndWizard/weddingKinsmenDialog.lua');
dofile('soldierAndWizard/justMarriedPlace.lua');
dofile('soldierAndWizard/justMarriedRoom.lua');
dofile('soldierAndWizard/deadGroom.lua');
dofile('soldierAndWizard/deadBride.lua');
dofile('soldierAndWizard/liveBride.lua');
dofile('soldierAndWizard/liveGroom.lua');
dofile('soldierAndWizard/doorFromJustMarriedRoomToWeddingHouse.lua');
dofile('soldierAndWizard/doorFromWeddingHouseToWillage.lua');
dofile('soldierAndWizard/elderPlace.lua');
dofile('soldierAndWizard/elderDialog.lua');

global
{
	justMarriedIsLive = flase,
}

soldierAndWizard = room {
	nam = 'Солдат и колдун',
	dsc = 'Отпустили одного солдата в побывку на родину. Вот он шел, шел, долго ли, коротко ли, и стал к своему селу приближаться. Недалеко от села жил мельник на мельнице; в былое время солдат водил с ним большое знакомство; отчего не зайти к приятелю? Зашел; мельник встретил его ласково, сейчас винца принес, стали распивать да просвое житье-бытье толковать. Дело было к вечеру, а как погостил солдат у мельника так и вовсе смерклось.',
	obj = { vway("Пора идти на село", "Пора идти на {село}", 'millerDialog') },
};

