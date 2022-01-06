/*
 * Author: tanaKa and Indigo
 * Adds patches on admins for FNF
 *
 * Params:
 * N/A
 *
 * Return value:
 * N/A
 *
 * Usage:
 * call phx_admin_fnc_setAdminPatch
 *
 * Public: no
 */

_staffIDs = missionNamespace getVariable ["fnf_staffInfo",[]];

if ((getPlayerUID player) in _staffIDs) then {
	[player, "FNFPatchAdmin"] call BIS_fnc_setUnitInsignia;
};
