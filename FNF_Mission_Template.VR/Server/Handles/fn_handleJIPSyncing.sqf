/*
	Author: Mallen

	Description:
		Starts handing over synced objects to the player as they join

	Parameter(s):
		0: OBJECT -  The player object that has joined
    1: OBJECT -  The host sync object

	Returns:
		None
*/

if (not isServer) exitWith {};

params["_playerObject", "_hostObject"];

_syncedObjects = synchronizedObjects _hostObject;
_playerObject synchronizeObjectsAdd _syncedObjects;

{
  _x synchronizeObjectsAdd [_playerObject];
} forEach _syncedObjects;

//use units to loop through problem children and check if player owns any of them

[{
  _result = true;
  if (owner (_this select 0) isEqualTo clientOwner) then
  {
    _result = false;
  };
  if (owner (_this select 0) isEqualTo 0) then
  {
    _result = false;
  };
  _unitsInGroup = units (_this select 0);
  {
    if (_x isEqualTo (_this select 0)) then
    {
      continue;
    };
    if (owner (_this select 0) isEqualTo owner _x) then
    {
      _result = false;
      break;
    };
  } forEach _unitsInGroup;
  _result;
},{
  [[(_this select 1)], FNF_ClientSide_fnc_multiplayerInitCall] remoteExec ['call', owner (_this select 0)];
}, [_playerObject, _syncedObjects], 5,{
  diag_log ['FNF_DEBUG: Player was not JIP synced correctly after 5 seconds', leader (_this select 0), (_this select 0)];
}] call CBA_fnc_waitUntilAndExecute
