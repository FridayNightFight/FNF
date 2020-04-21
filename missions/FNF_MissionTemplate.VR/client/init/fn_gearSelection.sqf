_optics = [];
_weapons = [];
_weaponsGL = [];

switch (playerSide) do {
  case east: {
    _optics = ["rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas"];
    if (phx_opticMagnification) then {
      _optics = _optics + ["rhs_acc_1p29", "rhs_acc_1p78", "rhs_acc_nita", "rhs_acc_pso1m2_ak"];
    };
  };
  case west: {
    _optics = ["optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high"];
    _weapons = ["rhs_weap_m16a4_carryhandle"];
    _weaponsGL = ["rhs_weap_m16a4_carryhandle_M203"];
    if (phx_opticMagnification) then {
      _optics = _optics + ["rhsusf_acc_g33_T1", "rhsusf_acc_g33_xps3", "rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230a", "rhsusf_acc_ELCAN"];
    };
  };
};

_action = ["Gear_Selector","Gear Selector","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Optic_Selector","Optic","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Weapon_Selector","Weapon","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

waitUntil {!isNil "phx_loadoutAssigned"};

sleep 2.25;

_compatibleOptics = [primaryWeapon player, "optic"] call CBA_fnc_compatibleItems;

if (pRole == 4 || pRole == 9 || pRole == 14 || pRole == 16) then {
  _weapons = [];
  if (pRole == 16) then {
    _optics pushBack (primaryWeaponItems player select 2);
  };
};

if ((count _optics > 0) && (count _compatibleOptics > 0)) then {
  {
    if (_x in _compatibleOptics) then {
      _action = ["Optic_Selector",getText (configFile >> "cfgWeapons" >> _x >> "displayName"),"",{
        player addPrimaryWeaponItem (_this select 2);
      },{true}, {}, _x] call ace_interact_menu_fnc_createAction;
      [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
    };
  } forEach _optics;
  _action = ["Optic_Selector","None","",{
    player removePrimaryWeaponItem (primaryWeaponItems player select 2);
  },{true}] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
};

if (count _weapons > 0) then {
  if (!isNil "phx_loadout_rifle_gl_he") then {
    _weapons = _weaponsGL;
  };

  _weapons pushBack primaryWeapon player;

  {
    _action = ["Weapon_Selector",getText (configFile >> "cfgWeapons" >> _x >> "displayName"),"",{
      if ((_this select 2) == primaryWeapon player) exitWith {};
      _mag = (primaryWeaponMagazine player) select 0;
      _glMag = (primaryWeaponMagazine player) select 1;
      player addWeapon (_this select 2);
      player addMagazine _mag;
      if (!isNil "_glMag") then {
        player addMagazine _glMag;
      };
    },{true}, {}, _x] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
  } forEach _weapons;
};
