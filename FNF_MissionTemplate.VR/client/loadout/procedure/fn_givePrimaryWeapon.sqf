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
* [player, _cfgWeaponChoices] call phx_loadout_fnc_givePrimaryWeapon
*
* Public: No
*/

// Primary weapon and appropriate magazines
params [
  ["_unit", objNull],
  ["_cfgChoices", []]
];

if (isNull _unit) exitWith {nil};

private _category = selectRandom(_cfgChoices);
if (isNil "_category") exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process primary weapon settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text "[FNF] (loadout) ERROR: Failed to process primary weapon settings.";
    diag_log text format["[FNF] (loadout) DEBUG: Choices: %1", _cfgChoices];
  }] call CBA_fnc_waitUntilAndExecute;
  nil
};
_category params ["_weapons","_mags"];
phx_loadout_weapon = selectRandom(_weapons);
phx_loadout_weaponMagazines = [_mags, phx_loadout_weapon] call phx_loadout_fnc_getWeaponMagazines;

if !(phx_loadout_weapon isEqualTo "" || (count phx_loadout_weaponMagazines) isEqualTo 0) then {
  _unit addWeapon phx_loadout_weapon;
  {[_x, "vest", _unit] call phx_loadout_fnc_addGear} forEach phx_loadout_weaponMagazines;
  diag_log text format["[FNF] (loadout) INFO: Equipped primary weapon ""%1""", phx_loadout_weapon];
  diag_log text format["[FNF] (loadout) INFO: Equipped primary weapon magazines"];
  diag_log text format["[FNF] (loadout) DEBUG: %1", phx_loadout_weaponMagazines];
  true
} else {
  nil
};
