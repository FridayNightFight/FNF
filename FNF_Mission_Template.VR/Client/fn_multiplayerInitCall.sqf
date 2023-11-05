/*
	Author: Mallen

	Description:
		Syncs objects from passed object to current object, also starts init when this is done

	Parameter(s):
		0: OBJECT - Sync Host object to move syncs from

	Returns:
		None
*/

params["_syncHostObjects"];

player synchronizeObjectsAdd _syncHostObjects;
{
  _x synchronizeObjectsAdd [player];
} forEach _syncHostObjects;

call FNF_ClientSide_fnc_init;
