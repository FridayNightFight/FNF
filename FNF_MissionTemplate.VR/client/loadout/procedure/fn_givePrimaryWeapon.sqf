/*
* Author: IndigoFox
*
* Description:
* Give primary weapon & associated magazines from like config array.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The array of weapon choices for current role <ARRAY>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, _cfgWeaponChoices] call fnf_loadout_fnc_givePrimaryWeapon
*
* Public: No
*/

// Primary weapon and appropriate magazines
params [
  ["_unit", objNull],
  ["_cfgChoices", []]
];

if (isNull _unit) exitWith {nil};
if (count _cfgChoices == 0) exitWith {nil};
private _category = _cfgChoices # 0;
if (isNil "_category") exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process primary weapon settings.</t>", "error", 20] call fnf_ui_fnc_notify;
    diag_log text "[FNF] (loadout) ERROR: Failed to process primary weapon settings.";
    diag_log text format["[FNF] (loadout) DEBUG: Choices: %1", _cfgChoices];
  }] call CBA_fnc_waitUntilAndExecute;
  nil
};

_category params ["_weapons","_mags"];
fnf_loadout_weapon = _weapons # 0;
fnf_loadout_weaponMagazines = [_mags, fnf_loadout_weapon] call fnf_loadout_fnc_getWeaponMagazines;


if !(fnf_loadout_weapon isEqualTo "" || (count fnf_loadout_weaponMagazines) isEqualTo 0) then {
  _unit addWeapon fnf_loadout_weapon;
  {[_x, "vest", _unit] call fnf_loadout_fnc_addGear} forEach fnf_loadout_weaponMagazines;
  diag_log text format["[FNF] (loadout) INFO: Equipped primary weapon ""%1""", fnf_loadout_weapon];
  diag_log text format["[FNF] (loadout) INFO: Equipped primary weapon magazines"];
  diag_log text format["[FNF] (loadout) DEBUG: %1", fnf_loadout_weaponMagazines];
  true
} else {
  nil
};
