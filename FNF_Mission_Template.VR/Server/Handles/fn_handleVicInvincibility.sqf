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

["All", "InitPost", {
  _vic = (_this select 0);
  if (_vic isKindOf "Man" || typeOf _vic isEqualTo "WeaponHolderSimulated") exitWith {}; //Exit so the code below doesn't run for infantry units

	_magsToIgnore = [];
	_pylonHolding = getAllPylonsInfo _vic;
	if (_pylonHolding isNotEqualTo []) then
  {
		_customLoadout = [];
		{
			if ((_x select 3) isNotEqualTo "") then
			{
				_toAdd = [(_x select 0), (_x select 4), (_x select 3)];
				_customLoadout pushBack _toAdd;
				_magsToIgnore pushBack (_x select 3);
			};
		} forEach _pylonHolding;
		_vic setVariable ["fnf_vehicleCustomPylons", _customLoadout, true];
	};

  _magHolding = magazinesAllTurrets _vic;
  if (_magHolding isNotEqualTo []) then
  {
		_customLoadout = [];
    {
			if (not ((_x select 0) in _magsToIgnore)) then
			{
				_customLoadout pushBack [(_x select 0), (_x select 1), (_x select 2)];
			};
    } forEach _magHolding;
    _vic setVariable ["fnf_vehicleCustomLoadout", _customLoadout, true];
  };

  if (local _vic && {getAmmoCargo _vic > 0}) then {
    _vic setAmmoCargo 0;
  };

  [_vic] call ace_rearm_fnc_disable;
}, true, ["CAManBase", "Static"], true] call CBA_fnc_addClassEventHandler;
