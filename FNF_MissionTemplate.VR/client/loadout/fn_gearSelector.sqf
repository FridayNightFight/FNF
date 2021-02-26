/*
Creates a gear selector for the player allowing switching of optic, weapon and charge loadout for CEs

Format for adding weapons to the selector within weapon set file:
phx_selector_weapons = [["WEAPON_CLASS"]]
or
phx_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num"]]
or
phx_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num", "MAG_CLASS:Num"]]

*Num = number of magazines to add
**phx_selector_weapons must be a 2 dimensional array**

If no magazine is specified, the selector will use the default of phx_loadout_rifle_mag and phx_loadout_rifle_mag_tracer for units that start with tracer mags
*/
#include "cfgLoadouts.hpp"

//Conditions
phx_selector_available = true;
if (
count (missionNamespace getVariable ["phx_selector_optics",[]]) == 0
&&
count (missionNamespace getVariable ["phx_selector_weapons",[]]) == 0
) then {
  phx_selector_available = false;
};
if (pRole == ROLE_MK) then {phx_selector_available = false};
if (pRole == ROLE_P || pROLE == ROLE_AR || pROLE == ROLE_MG) then {phx_selector_weapons = []};

//Create base actions
_action = ["Gear_Selector","Gear Selector","",{},{phx_selector_available && phx_safetyEnabled}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Optic_Selector","Optic","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Weapon_Selector","Weapon","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

//Optics
{
  _action = ["Optic_Selector",getText (configFile >> "cfgWeapons" >> _x >> "displayName"),"",{
    _optic = _this select 2;
    player addPrimaryWeaponItem _optic;
  },{(_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems)}, {}, _x] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_optics;

if !((phx_loadout_rifle_mag_tracer splitString ":" select 0) in magazines player) then {phx_loadout_rifle_mag_tracer = "0:0"};

phx_selector_weapons = [[primaryWeapon player]] + phx_selector_weapons;

//Weapons
{
  _action = ["Weapon_Selector",getText (configFile >> "cfgWeapons" >> _x select 0 >> "displayName"),"",{
    _this select 2 params ["_weapon","_mag","_tracer"];

    if (isNil "_mag") then {_mag = phx_loadout_rifle_mag};
    if (isNil "_tracer") then {_tracer = phx_loadout_rifle_mag_tracer};

    if (_weapon == primaryWeapon player) exitWith {};
    if (count primaryWeaponMagazine player > 0) exitWith {"Weapon must be unloaded before switching" call phx_fnc_hintThenClear};

    _oldMag = phx_loadout_rifle_mag splitString ":" select 0;
    _oldMagNum = parseNumber (phx_loadout_rifle_mag splitString ":" select 1);
    _oldTracer = phx_loadout_rifle_mag_tracer splitString ":" select 0;
    _oldTracerNum = parseNumber (phx_loadout_rifle_mag_tracer splitString ":" select 1);

    _oldMagCount = {_x == _oldMag} count magazines player;
    _oldTracerCount = {_x == _oldTracer} count magazines player;

    if !(_oldMagCount == _oldMagNum) exitWith {hint "Missing magazines"};
    if !(_oldTracerCount == _oldTracerNum) exitWith {hint "Missing tracers"};

    _weaponItems = primaryWeaponItems player;

    player removeMagazines _oldMag;
    player removeMagazines _oldTracer;

    _mag call phx_fnc_addGear;
    player addWeapon _weapon;
    _tracer call phx_fnc_addGear;

    phx_loadout_rifle_mag = _mag;
    phx_loadout_rifle_mag_tracer = _tracer;

    {
      player addPrimaryWeaponItem _x;
    } forEach _weaponItems;
  },{primaryWeapon player != "" && count phx_selector_weapons > 1}, {}, _x] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_weapons;

phx_selector_currentExplosives = phx_selector_explosives select 0;

if (pRole == ROLE_CE) then {
  _action = ["Explosives_Selector","Explosives","",{},{true}] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

  {
    _action = ["Explosives_Selector",_x select 0,"",{
      private _expArr = _this select 2;
      if (_expArr isEqualTo phx_selector_currentExplosives) exitWith {};

      private _missing = false;

      {
        if (_forEachIndex != 0) then {
          _expClass = _x splitString ":" select 0;
          _expCount = parseNumber (_x splitString ":" select 1);

          if ({_x == _expClass} count magazines player < _expCount) then {
            _missing = true;
          };
        };
      } forEach phx_selector_currentExplosives;

      if (!_missing) then {
        {
          player removeMagazines (_x splitString ":" select 0);
        } forEach phx_selector_currentExplosives;

        {
          if (_forEachIndex != 0) then {
            _x call phx_fnc_addGear;
          };
        } forEach _expArr;

        phx_selector_currentExplosives = _expArr;
      } else {
        "Missing items" call phx_fnc_hintThenClear;
      };
    },{true}, {}, _x] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Explosives_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
  } forEach phx_selector_explosives;
};

//Remove selector when safe start ends
[{!phx_safetyEnabled}, {
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Optic_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Weapon_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Explosives_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
}] call CBA_fnc_waitUntilAndExecute;
