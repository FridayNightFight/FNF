waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false]};
uiSleep 1;

_action = ["phx_boc","Put backpack on chest","",{
  phx_boc_bagClass = backpack player;
  bag = createVehicle ["GroundWeaponHolder", position player, [], 0, "CAN_COLLIDE"];
  player action ["DropBag", bag, phx_boc_bagClass];

  [] spawn {
    waitUntil {!((getBackpackCargo bag) select {phx_boc_bagClass in _x} isEqualTo [])};
    bag attachTo [player, [-0.1,0.7,-0.4], "pelvis"];
    bag setVectorDirAndUp [[0,0,-1], [0,1,0]];

    player forceWalk true;
  };
},{backpack player != ""}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
