/*
* Author: IndigoFox
*
* Description:
* Set up the array variable used by the ACE self-interact explosives picker.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Array of available explosives choices <ARRAY>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, _cfgExplosiveChoices] call fnf_loadout_fnc_giveCECharges
*
* Public: No
*/

// CE Explosives
params [
  ["_unit", objNull],
  ["_cfgExplosiveChoices", (missionConfigFile >> "CfgFNFLoadouts" >> "GEAR" >> mySideGearSelection >> (player getVariable "fnfLoadout") >> "explosiveChoices") call BIS_fnc_getCfgDataArray]
];

if (isNull _unit) exitWith {nil};

if (count _cfgExplosiveChoices > 0) then {
  fnf_selector_currentExplosives = selectRandom(_cfgExplosiveChoices);
  // "debug_console" callExtension str(fnf_loadout_explosives);
  {
    [_x, "backpack", _unit] call fnf_loadout_fnc_addGear;
  } forEach (fnf_selector_currentExplosives select [1, 2]);
  diag_log text format["[FNF] (loadout) INFO: Equipped CE explosive %1", fnf_selector_currentExplosives # 0];
  fnf_selector_explosives = _cfgExplosiveChoices;
} else {fnf_selector_explosives = []};
true
