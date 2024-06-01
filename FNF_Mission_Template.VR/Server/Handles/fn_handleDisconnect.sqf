/*
	Author: Mallen

	Description:
		Sets up disconnect handeler to delete bodys in safe start

	Parameter(s):
		None

	Returns:
		None
*/
params["_modules"];

_safeZones = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_thisArgs params ["_safeZones"];

	_longestSafeZoneTimer = 0;

	{
		_syncedObjects = synchronizedObjects _x;
		_forPlayer = false;
		{
			_objType = typeOf _x;
			_zoneSide = sideUnknown;
			switch (_objType) do {
				case "SideBLUFOR_F":
				{
					_zoneSide = west;
				};
				case "SideOPFOR_F":
				{
					_zoneSide = east;
				};
				case "SideResistance_F":
				{
					_zoneSide = independent;
				};
				default
				{
					if (_x isEqualTo _unit) then
					{
						_forPlayer = true;
						break;
					};
				};
			};

			if (_zoneSide isEqualTo ([_unit, false] call BIS_fnc_objectSide)) then
			{
				_forPlayer = true;
				break;
			};
		} forEach _syncedObjects;

		if (_forPlayer) then {
			_timeZoneIsDeleted = _x getVariable ["fnf_timeZoneIsDeleted", 15];
			if (_timeZoneIsDeleted > _longestSafeZoneTimer) then
			{
				_longestSafeZoneTimer = _timeZoneIsDeleted;
			};
		};
	} forEach _safeZones;

	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
	_timeToCheck = (_longestSafeZoneTimer * 60) + _timeServerStarted;

	if (serverTime < _timeToCheck) then
	{
		deleteVehicle _unit;
	};

	false;
}, [_safeZones]];
