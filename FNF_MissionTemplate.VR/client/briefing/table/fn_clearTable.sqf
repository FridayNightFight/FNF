/*
 * Author: Seb
 *
 * This function creates a minified representation of a marker area on a table, both given as arguments. It
 *
 * Arguments:
 * 0: Table with objects attached to it
 *
 * Return Value:
 * NONE
 *
 * Example:
 *   Multiplayer & Join in progress COMPATIBLE:
 *      [table] remoteExec ["fnf_briefing_fnc_clearTable", 0, table];
 *
 * Public: No
 */

params ["_table", "_tableObjects", ["_replacing", false, [false]]];

if (isNil "_tableObjects") then {
  _tableObjects = _table getVariable ["sebs_briefing_table_tableObjects", []];
};


// if safe start active, use loading screen to hasten the process
// if safe start ended, gradually delete objects w generous sleep value
_safetyOn = missionNamespace getVariable ["fnf_safetyEnabled", false];
if (_safetyOn) then {["ClearTable", ""] call BIS_fnc_startLoadingScreen};
{
  deleteVehicle _x;
  if !(_safetyOn) then {sleep 0.01};
} forEach _tableObjects;
_table setVariable ["sebs_briefing_table_tableObjects", []];
if (_safetyOn) then {"ClearTable" call BIS_fnc_endLoadingScreen};
