/*
	Author: Mallen

	Description:
		Syncs objects from passed object to player, also starts init when this is done

	Parameter(s):
		0: ARRAY - Sync Host objects to sync player to

	Returns:
		None
*/

if (not isNil "fnf_playerLoadout") exitWith {};

if (isServer) exitWith {};

params["_hostObjects"];

player synchronizeObjectsAdd _hostObjects;

{
  _x synchronizeObjectsAdd [player];
} forEach _hostObjects;

call FNF_ClientSide_fnc_init;
