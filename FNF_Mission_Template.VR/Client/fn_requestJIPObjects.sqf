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

params["_hostObject"];

[_hostObject] remoteExec ["FNF_ServerSide_fnc_handleJIPSyncing", 2, false];
