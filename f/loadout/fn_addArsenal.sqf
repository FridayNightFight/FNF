_arsenalOptics = ["Optics","Optic Selector","",{""},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"],_arsenalOptics] call ace_interact_menu_fnc_addActionToClass;

switch (side player) do {
  case east: {
    _optics = ["rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_pkas"];

    _arsenalOptic_1 =  ["1p63","1p63","",{player addPrimaryWeaponItem "rhs_acc_1p63";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_1,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_2 =  ["ekp1","ekp1","",{player addPrimaryWeaponItem "rhs_acc_ekp1";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_2,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_3 =  ["ekp8_02","ekp8_02","",{player addPrimaryWeaponItem "rhs_acc_ekp8_02";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_3,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_4 =  ["pkas","pkas","",{player addPrimaryWeaponItem "rhs_acc_pkas";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_4,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_5 =  ["Irons","Irons","",{player removePrimaryWeaponItem (primaryWeaponItems player select 2);},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_5,true] call ace_interact_menu_fnc_addActionToClass;
    };
  case west: {
    _optics = ["optic_Holosight_blk_F","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_pkas"];

    _arsenalOptic_1 =  ["Holosight_blk","Holosight_blk","",{player addPrimaryWeaponItem "optic_Holosight_blk_F";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_1,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_2 =  ["eotech_552","eotech_552","",{player addPrimaryWeaponItem "rhsusf_acc_eotech_552";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_2,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_3 =  ["compm4","compm4","",{player addPrimaryWeaponItem "rhsusf_acc_compm4";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_3,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_4 =  ["T1_high","T1_high","",{player addPrimaryWeaponItem "rhsusf_acc_T1_high";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_4,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_5 =  ["Irons","Irons","",{player removePrimaryWeaponItem (primaryWeaponItems player select 2);},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_5,true] call ace_interact_menu_fnc_addActionToClass;
  };
  default {
    _arsenalOptic_1 =  ["Holosight_blk","Holosight_blk","",{player addPrimaryWeaponItem "optic_Holosight_blk_F";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_1,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_2 =  ["ACO_green","ACO_green","",{player addPrimaryWeaponItem "optic_ACO_grn";},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_2,true] call ace_interact_menu_fnc_addActionToClass;

    _arsenalOptic_3 =  ["Irons","Irons","",{player removePrimaryWeaponItem (primaryWeaponItems player select 2);},{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Optics"],_arsenalOptic_3,true] call ace_interact_menu_fnc_addActionToClass;
  };
};

_arsenalGrenades = ["Grenades","Grenade Selector","",{""},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"],_arsenalGrenades] call ace_interact_menu_fnc_addActionToClass;

_arsenalGrenade_1 =  ["+1 white smoke","+1 white smoke","",{player addItem "SmokeShell";},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Grenades"],_arsenalGrenade_1,true] call ace_interact_menu_fnc_addActionToClass;

_arsenalGrenade_2 =  ["+1 green smoke","+1 green smoke","",{player addItem "SmokeShellGreen";},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Grenades"],_arsenalGrenade_2,true] call ace_interact_menu_fnc_addActionToClass;

_arsenalGrenade_3 =  ["+1 red smoke","+1 red smoke","",{player addItem "SmokeShellRed";},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Grenades"],_arsenalGrenade_3,true] call ace_interact_menu_fnc_addActionToClass;

_arsenalGrenade_4 =  ["+1 blue smoke","+1 blue smoke","",{player addItem "SmokeShellBlue";},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","Grenades"],_arsenalGrenade_4,true] call ace_interact_menu_fnc_addActionToClass;



_arsenalReset = ["Arsenal Reset","Reset Loadout to Default","",{
  phx_loadoutAssigned = nil;
  call phx_fnc_loadout_set;
  _null = [] spawn {
    sleep 10;
    phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
  };
  },{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"],_arsenalReset] call ace_interact_menu_fnc_addActionToClass;
