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
 * call phx_admin_fnc_adminPatch
 *
 * Public: no
 */

_staffIDs = missionNamespace getVariable "fnf_staffInfo";

if (isServer) then {
  {
    if ((getPlayerUID _x) in _staffIDs) then {
      [_x, "FNFPatchAdmin"] call bis_fnc_setUnitInsignia;
      "[FNF Patches] Assigned admin patch" remoteExec ["systemChat", _x];
    };
  } forEach AllPlayers;
};
