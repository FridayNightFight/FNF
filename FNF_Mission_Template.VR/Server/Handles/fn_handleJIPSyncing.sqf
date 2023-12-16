/*
	Author: Mallen

	Description:
		Send the remoteexec owner the synced objects of a sent object for JIP handeleing

	Parameter(s):
		0: OBJECT - The object to get the syynced objects from

	Returns:
		None
*/

if (not isServer) exitWith {};

if (not isRemoteExecuted) exitWith {};

params["_hostObject"];

_syncedObjects = synchronizedObjects _hostObject;

[_syncedObjects] remoteExec ["FNF_ClientSide_fnc_multiplayerInitCall", remoteExecutedOwner, false];

