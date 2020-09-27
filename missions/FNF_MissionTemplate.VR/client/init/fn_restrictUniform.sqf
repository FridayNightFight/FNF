phx_playerUniform = uniform player;
phx_playerHead = headgear player;
phx_playerVest = vest player;

//Handle player not having the right uniform, vest, or helmet on
[{
  if !(uniform player isEqualTo phx_playerUniform) then {
    player forceAddUniform phx_playerUniform;
  };

  if !(headgear player isEqualTo phx_playerHead) then {removeHeadgear player; player addHeadgear phx_playerHead};
  /*
  if !(vest player isEqualTo phx_playerVest) then {
    _items = vestItems player;
    removeVest player;
    player addVest phx_playerVest;
    {player addItemToVest _x} forEach _items;
  };
  */
} , 1] call CBA_fnc_addPerFrameHandler;

//Stop playing from being able to take off gear
player addEventHandler ["inventoryOpened",{
  params ["_unit", "_container"];
  [] spawn {
    waitUntil {!(isNull (findDisplay 602))};

    //Uniform
    ((findDisplay 602) displayCtrl 6331) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6331, false];"];
    ((findDisplay 602) displayCtrl 6331) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6331, false];"];

    //Vest
    //((findDisplay 602) displayCtrl 6381) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6381, false];"];
    //((findDisplay 602) displayCtrl 6381) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6381, false];"];

    //Headgear
    ((findDisplay 602) displayCtrl 6240) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6240, false];"];
    ((findDisplay 602) displayCtrl 6240) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6240, false];"];
  };
}];

/*
CA_ContainerBackground 1001, CA_PlayerBackground 1002, TitleBackground 1020, PlayersName 111, RankBackground 1014, RankPicture 1203, ButtonBack 2, BackgroundSlotPrimary 1242, BackgroundSlotPrimaryMuzzle 1243, BackgroundSlotPrimaryUnderBarrel 1200, BackgroundSlotPrimaryFlashlight 1244, BackgroundSlotPrimaryOptics 1245, BackgroundSlotPrimaryMagazineGL 1267, BackgroundSlotPrimaryMagazine 1246, BackgroundSlotSecondary 1247, BackgroundSlotSecondaryMuzzle 1248, BackgroundSlotSecondaryUnderBarrel 1266, BackgroundSlotSecondaryFlashlight 1249, BackgroundSlotSecondaryOptics 1250, BackgroundSlotSecondaryMagazine 1251, BackgroundSlotHandgun 1252, BackgroundSlotHandgunMuzzle 1253, BackgroundSlotHandgunUnderBarrel 1268, BackgroundSlotHandgunFlashlight 1254, BackgroundSlotHandgunOptics 1255, BackgroundSlotHandgunMagazine 1256, BackgroundSlotHeadgear 1257, BackgroundSlotGoggles 1258, BackgroundSlotHMD 1259, BackgroundSlotBinoculars 1260, BackgroundSlotMap 1261, BackgroundSlotGPS 1262, BackgroundSlotCompass 1263, BackgroundSlotRadio 1264, BackgroundSlotWatch 1265, ExternalContainerBackground 1240, PlayerContainerBackground 1241, GroundTab 6321, SoldierTab 6401, GroundContainer 632, SoldierContainer 640, GroundFilter 6554, GroundLoad 6307, SlotPrimary 610, SlotPrimaryMuzzle 620, SlotPrimaryUnderBarrel 641, SlotPrimaryFlashlight 622, SlotPrimaryOptics 621, SlotPrimaryMagazineGL 644, SlotPrimaryMagazine 623, SlotSecondary 611, SlotSecondaryMuzzle 624, SlotSecondaryUnderBarrel 642, SlotSecondaryFlashlight 626, SlotSecondaryOptics 625, SlotSecondaryMagazine 627, SlotHandgun 612, SlotHandgunMuzzle 628, SlotHandgunUnderBarrel 643, SlotHandgunFlashlight 630, SlotHandgunOptics 629, SlotHandgunMagazine 631, SlotHeadgear 6240, SlotGoggles 6216, SlotHMD 6217, SlotBinoculars 6238, SlotMap 6211, SlotGPS 6215, SlotCompass 6212, SlotRadio 6214, SlotWatch 6213, UniformTab 6332, UniformSlot 6331, UniformLoad 6304, UniformContainer 633, VestTab 6382, VestSlot 6381, VestLoad 6305, VestContainer 638, BackpackTab 6192, BackpackSlot 6191, BackpackLoad 6306, BackpackContainer 619, TotalLoad 6308, ContainerMarker 6325, GroundMarker 6385, SoldierMarker 6405, RscMapControl -1,
