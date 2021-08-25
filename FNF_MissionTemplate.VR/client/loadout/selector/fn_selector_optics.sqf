//Add magnified optics if enabled
if (phx_magnifiedOptics || pRole == ROLE_MK) then {
  phx_selector_optics append phx_selector_magOptics;
};
if (pRole == ROLE_SNP) then {
  phx_selector_optics = phx_loadout_sniper_optics;
};

//optics actions
{
  _action = ["Optic_Selector",
    getText (configFile >> "cfgWeapons" >> _x >> "displayName"),
    "",
    {
      _optic = _this select 2;
      player addPrimaryWeaponItem _optic;
    },
    {
      (_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) ||
      pRole == ROLE_SNP
    },
    {},
    _x
  ] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_optics;

_action = [
  "Optic_Selector",
  "None",
  "",
  {
    player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
  },
  {
    ((primaryWeaponItems player) select 2) != ""
  }
] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
