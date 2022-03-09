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

params ["_table"];
private _tableObjects = _table getVariable ["sebs_briefing_table_tableObjects", []];
{deleteVehicle _x} forEach _tableObjects;
_table setVariable ["sebs_briefing_table_tableObjects", []];
