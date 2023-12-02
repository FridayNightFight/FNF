/*
	Author: Mallen

	Description:
		Syncs objects from passed object to player, also starts init when this is done

	Parameter(s):
		0: ARRAY - Sync Host objects to sync player to

	Returns:
		None
*/

params["_hostObjects"];

if (isServer) exitWith {};

if (not isNil "fnf_playerLoadout") exitWith {};

[{
  params["_hostObjects"];
  not isNull player;
},{
  params["_hostObjects"];

  player synchronizeObjectsAdd _hostObjects;

  {
    _x synchronizeObjectsAdd [player];
  } forEach _hostObjects;

  call FNF_ClientSide_fnc_init;
},[_hostObjects],1,{
  params["_hostObjects"];

  if (isNil "fnf_playerLoadout") then
  {
    [_hostObjects] call FNF_ClientSide_fnc_multiplayerInitCall;
  };

}] call CBA_fnc_waitUntilAndExecute;
