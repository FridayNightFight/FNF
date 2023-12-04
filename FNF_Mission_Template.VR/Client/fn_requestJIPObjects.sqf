/*
	Author: Mallen

	Description:
		Asks the server what synced objects are synced to the sent object

	Parameter(s):
		0: OBJECT - Object to ask the server about

	Returns:
		None
*/

if (not isNil "fnf_playerLoadout") exitWith {};

if (isServer) exitWith {};

params["_hostObject", "_playerObject"];

[{
  params["_hostObject", "_playerObject"];
  _result = false;
  if (not isNull player) then
  {
	  _result = _playerObject isEqualTo player;
  };
  _result;
},{
  params["_hostObject", "_playerObject"];

  [_hostObject] remoteExec ["FNF_ServerSide_fnc_handleJIPSyncing", 2, false];

},[_hostObject, _playerObject],1,{
  params["_hostObject", "_playerObject"];
  if (isNull player) then
  {
    [_hostObject, _playerObject] call FNF_ClientSide_fnc_requestJIPObjects;
  };
}] call CBA_fnc_waitUntilAndExecute;
