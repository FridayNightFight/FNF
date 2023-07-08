params["_syncHostObjects"];

player synchronizeObjectsAdd _syncHostObjects;
{
  _x synchronizeObjectsAdd [player];
} forEach _syncHostObjects;

call FNF_ClientSide_fnc_init;
