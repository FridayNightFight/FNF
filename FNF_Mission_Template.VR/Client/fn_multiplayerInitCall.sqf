/*
	Author: Mallen

	Description:
		Syncs objects from passed object to player, also starts init when this is done

	Parameter(s):
		0: ARRAY - Sync Host objects to sync player to

	Returns:
		None
*/

diag_log "FNF_DEBUG: Recieved objects from server, starting init";

if (not isNil "fnf_playerLoadout") then
{
  diag_log "FNF_DEBUG: Recieved objects when not asked for it, THIS IS AN ISSUE";
};

if (not isNil "fnf_playerLoadout") exitWith {};

if (isServer) exitWith {};

params["_hostObjects"];

player synchronizeObjectsAdd _hostObjects;

{
  _x synchronizeObjectsAdd [player];
} forEach _hostObjects;

call FNF_ClientSide_fnc_init;
