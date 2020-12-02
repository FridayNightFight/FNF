waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false]};

phx_bagOnChest = false;
phx_boc_bagClass = "";
phx_boc_dummyBag = objNull;
phx_bagFallSet = false;

_action = ["phx_boc_onChest","Put backpack on chest","",{
  phx_boc_bagClass = backpack player;
  player addBackpack "B_AssaultPack_khk";
  removeBackpack player;

  phx_boc_dummyBag = createSimpleObject [phx_boc_bagClass, getposasl player];
  phx_boc_dummyBag attachTo [player, [0,-0.05,-0.43], "pelvis"];
  phx_boc_dummyBag setDir 180;

  player forceWalk true;

  [] spawn {
    waitUntil {phx_boc_bagHolder = nearestObject [player, "GroundWeaponHolder"]; !isNull phx_boc_bagHolder};

    phx_boc_bagHolder hideObjectGlobal true;
    phx_boc_bagHolder setPos [0,0,0];

    while {phx_bagOnChest} do {
      /*if (vehicle player == player) then {
        player action ["SwitchWeapon", player, player, -1];
      };*/

      /*if (!(stance player isEqualTo "STAND") && vehicle player == player) then {
        player playAction "PlayerStand";
      };*/

      if (stance player == "UNDEFINED" && !phx_bagFallSet) then {
        phx_boc_dummyBag setVectorUp [0,10,1];
        phx_boc_dummyBag attachTo [player, [0,-0.43,0], "pelvis"];
        phx_bagFallSet = true;
      } else {
        if (phx_bagFallSet && stance player != "UNDEFINED") then {
          phx_boc_dummyBag attachTo [player, [0,-0.05,-0.43], "pelvis"];
          phx_boc_dummyBag setVectorUp [0,0,1];
          phx_bagFallSet = false;
        };
      };
      uiSleep 1;
    };
  };

  phx_bagOnChest = true;
},{!phx_bagOnChest && backpack player != "" && !(stance player isEqualTo "UNDEFINED") && isTouchingGround player}] call ace_interact_menu_fnc_createAction;

_action1 = ["phx_boc_onBack","Put backpack on back","",{
  if (backpack player != "") then {
    player action ["PutBag"];
  };

  player action ["AddBag", phx_boc_bagHolder, phx_boc_bagClass];
  deleteVehicle phx_boc_dummyBag;

  phx_bagOnChest = false;
  player forceWalk false;
},{phx_bagOnChest && vehicle player == player && !(stance player isEqualTo "UNDEFINED") && isTouchingGround player}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _action1] call ace_interact_menu_fnc_addActionToClass;

phx_boc_getInEH = player addEventHandler ["GetInMan", {
  if (!isNull phx_boc_dummyBag) then {phx_boc_dummyBag hideObjectGlobal true;};
}];

phx_boc_getOutEH = player addEventHandler ["GetOutMan", {
  if (!isNull phx_boc_dummyBag) then {phx_boc_dummyBag hideObjectGlobal false;};
}];

phx_boc_killedEH = player addEventHandler ["Killed", {
  phx_boc_bagHolder setposasl getposasl player;
  phx_boc_bagHolder hideObjectGlobal false;
  deleteVehicle phx_boc_dummyBag;

  if ((position phx_boc_bagHolder) select 2 > 2) then {
    deleteVehicle phx_boc_bagHolder;
  };

  phx_bagOnChest = false;
}];
