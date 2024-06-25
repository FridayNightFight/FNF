/*
	Author: Mallen

	Description:
		Handle Vics being invincible for a set period of time

	Parameter(s):
		None

	Returns:
		None
*/

params["_assetModules"];

if (!isServer) exitWith {};

_vincibleList = [];

//for each breifing asset modules
{
	_syncedObjects = synchronizedObjects _x;
	_objectsToInvinciblise = [];
	_timeToBeVincible = _x getVariable ['fnf_timeToBeVincible', 15];

	{
		_objectType = typeOf _x;
		switch (_objectType) do
		{
			case "SideBLUFOR_F": {};
			case "SideOPFOR_F": {};
			case "SideResistance_F": {};
			default
			{
				[_x, false] remoteExec ["allowDamage", 0, true];
				_objectsToInvinciblise pushBack _x;
			};
		};
	} forEach _syncedObjects;

	_index = _vincibleList findIf {(_x select 0) isEqualTo _timeToBeVincible};
	if (_index isEqualTo -1) then
	{
		_vincibleList pushBack [_timeToBeVincible, _objectsToInvinciblise];
	} else {
		(_vincibleList select _index select 1) append _objectsToInvinciblise;
	};
} forEach _assetModules;

{
	[{
		params["_vics", "_timeToBeVincible"];
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > (_timeToBeVincible * 60);
		} else {
			_result = (serverTime - _timeServerStarted) > (_timeToBeVincible * 60);
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		params["_vics", "_timeToBeVincible"];
		{
			[_x, true] remoteExec ["allowDamage", 0, true];
		} forEach _vics;
	}, [(_x select 1), (_x select 0)]] call CBA_fnc_waitUntilAndExecute;
} forEach _vincibleList;
