/*
	Author: Mallen

	Description:
		starts handing over synced objects to the player as they join

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

[{
  _result = false;
  if (leader (_this select 0) == (_this select 0)) then
  {
    if (owner (_this select 0) != clientOwner and owner (_this select 0) != 0) then
    {
      _result = true;
    };
  } else {
    if (owner (_this select 0) != clientOwner and owner (_this select 0) != 0 and owner (_this select 0) != owner (leader (_this select 0))) then
    {
      _result = true;
    };
  };
  _result;
},{
  [[(_this select 1)], FNF_ClientSide_fnc_multiplayerInitCall] remoteExec ['call', owner (_this select 0)];
}, [_playerObject, _syncedObjects], 5,{
  diag_log ['DANGER: Player was not JIP synced correctly after 5 seconds', leader (_this select 0), (_this select 0)];
}] call CBA_fnc_waitUntilAndExecute
