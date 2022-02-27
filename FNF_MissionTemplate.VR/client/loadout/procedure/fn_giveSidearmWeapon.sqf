/*
* Author: IndigoFox
*
* Description:
* Give secondary weapon from config.
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
* [player, _cfgSidearms] call fnf_loadout_fnc_giveSidearmWeapon
*
* Public: No
*/

// Sidearm and appropriate magazines
params [
  ["_unit", objNull],
  ["_cfgChoices", []]
];

if (isNull _unit) exitWith {nil};
if (count _cfgChoices == 0) exitWith {nil};
private _category = _cfgChoices # 0;
if (isNil "_category") exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process sidearm weapon settings.</t>", "error", 20] call fnf_ui_fnc_notify;
    diag_log text "[FNF] (loadout) ERROR: Failed to process sidearm weapon settings.";
    diag_log text format["[FNF] (loadout) DEBUG: Choices %1", _cfgChoices];
  }] call CBA_fnc_waitUntilAndExecute;
};
_category params ["_sidearms","_mags"];
fnf_loadout_sidearm = _sidearms # 0;
fnf_loadout_sidearmMagazines = [_mags, fnf_loadout_sidearm] call fnf_loadout_fnc_getWeaponMagazines;

if !(fnf_loadout_sidearm isEqualTo "" || (count fnf_loadout_sidearmMagazines) isEqualTo 0) then {
  _unit addWeapon fnf_loadout_sidearm;
  {[_x, "uniform", _unit] call fnf_loadout_fnc_addGear} forEach fnf_loadout_sidearmMagazines;
  diag_log text format["[FNF] (loadout) INFO: Equipped secondary weapon ""%1""", fnf_loadout_sidearm];
  diag_log text format["[FNF] (loadout) INFO: Equipped secondary weapon magazines"];
  diag_log text format["[FNF] (loadout) DEBUG: %1", fnf_loadout_sidearmMagazines];
};
true
