if !(playerSide == west) exitWith {};

_action1 = ["Weapon_Selector","Weapon Selector","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action1] call ace_interact_menu_fnc_addActionToClass;

_action2 = ["Weapon_Selector","M16A4","",{
  _mag = (primaryWeaponMagazine player) select 0;
  player addWeapon "rhs_weap_m16a4_carryhandle";
  player addMagazine _mag;
  [(typeOf player), 1, ["ACE_SelfActions","Weapon_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  },{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Weapon_Selector"], _action2] call ace_interact_menu_fnc_addActionToClass;

waitUntil {!phx_safetyEnabled};

[(typeOf player), 1, ["ACE_SelfActions","Weapon_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
