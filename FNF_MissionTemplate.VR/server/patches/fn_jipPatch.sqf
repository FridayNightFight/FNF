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
 * call phx_admin_fnc_jipPatch
 *
 * Public: no
 */

_staffIDs = missionNamespace getVariable "fnf_staffInfo";

if ((getPlayerUID player) in _staffIDs) then {
  [player, "FNFPatchAdmin"] call bis_fnc_setUnitInsignia;
  "[FNF Patches] Assigned admin patch" remoteExec ["systemChat", player];
};
