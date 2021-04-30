if (pRole == ROLE_MK) exitWith {}; //don't want marksman to change optic

//Add magnified optics if enabled
if (phx_magnifiedOptics) then {
  phx_selector_optics append phx_selector_magOptics;
};

//optics actions
{
  _action = ["Optic_Selector",getText (configFile >> "cfgWeapons" >> _x >> "displayName"),"",{
    _optic = _this select 2;
    player addPrimaryWeaponItem _optic;
  },{(_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems)}, {}, _x] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_optics;
