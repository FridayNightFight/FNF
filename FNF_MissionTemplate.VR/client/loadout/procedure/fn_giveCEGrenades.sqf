/*
* Author: IndigoFox
*
* Description:
* Set up the array variable used by the ACE self-interact grenades picker.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Array of available grenade choices <ARRAY>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, _cfgGrenadeChoices] call fnf_loadout_fnc_giveCEGrenades
*
* Public: No
*/

// CE Grenades
params [
  ["_unit", objNull],
  ["_cfgGrenadeChoices", (missionConfigFile >> "CfgFNFLoadouts" >> "GEAR" >> mySideGearSelection >> (player getVariable "fnfLoadout") >> "grenadeChoices") call BIS_fnc_getCfgDataArray]
];

if (isNull _unit) exitWith {nil};

if (count _cfgGrenadeChoices > 0) then {
  fnf_selector_currentGrenades = _cfgGrenadeChoices # 0;
  // "debug_console" callExtension str(fnf_loadout_explosives);
  {
    [_x, "vest", _unit] call fnf_loadout_fnc_addGear;
  } forEach (fnf_selector_currentGrenades select [1, 2]);
  diag_log text format["[FNF] (loadout) INFO: Equipped CE grenade %1", fnf_selector_currentGrenades # 0];
  fnf_selector_grenades = _cfgGrenadeChoices;
} else {fnf_selector_grenades = []};
true
