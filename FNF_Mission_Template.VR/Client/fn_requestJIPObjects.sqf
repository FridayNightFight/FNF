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

params["_hostObject", "_playerObject"];

diag_log ("FNF_DEBUG: Init triggered for object:" + str(_playerObject) + " With host Object: " + str(_hostObject));

if (isServer) then
{
	//have server sync the playerobject server side to pass along to other units via network on JIP
	_syncedObjects = synchronizedObjects _hostObject;
	_playerObject synchronizeObjectsAdd _syncedObjects;

	{
		_x synchronizeObjectsAdd [_playerObject];
	} forEach _syncedObjects;

} else {

	[{
		params["_hostObject", "_playerObject"];

		//wait until player is the playerObject
		_playerObject isEqualTo player;
	},{
		params["_hostObject", "_playerObject"];

		//when player is the playerobject ask server what objects to sync to the player

		diag_log "FNF_DEBUG: Player is correct object and asked server for objects";

		[_hostObject] remoteExec ["FNF_ServerSide_fnc_handleJIPSyncing", 2, false];

	},[_hostObject, _playerObject],1,{
		params["_hostObject", "_playerObject"];

		//check if timeout is due to player being null or the condition is actually true now (shouldn't be?) if so restart this function
		diag_log ("FNF_DEBUG: one second timeout for: " + str(_playerObject));

		if (_playerObject isEqualTo player) then
		{
			diag_log "FNF_DEBUG: player check evald correct, trying again";
			[_hostObject, _playerObject] call FNF_ClientSide_fnc_requestJIPObjects;
		};
		if (isNull player) then
		{
			diag_log "FNF_DEBUG: player is still null, trying again";
			[_hostObject, _playerObject] call FNF_ClientSide_fnc_requestJIPObjects;
		};

		//if neither is true let it timeout, player is not intended reciepient of this function call
	}] call CBA_fnc_waitUntilAndExecute;

};
