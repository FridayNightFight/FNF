/*
	Author: Mallen

	Description:
		Sets up disconnect handeler to delete bodys in safe start

	Parameter(s):
		None

	Returns:
		None
*/

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  _syncedObjects = synchronizedObjects _unit;

  _safeZones = [_syncedObjects, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;

  _longestSafeZoneTimer = 0;

  {
    _timeZoneIsDeleted = _x getVariable ["fnf_timeZoneIsDeleted", 15];
    if (_timeZoneIsDeleted > _longestSafeZoneTimer) then
    {
      _longestSafeZoneTimer = _timeZoneIsDeleted;
    };
  } forEach _safeZones;

  _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
  _timeToCheck = (_longestSafeZoneTimer * 60) + _timeServerStarted;

  if (serverTime < _timeToCheck) then
  {
    deleteVehicle _unit;
  };

  false;
}];
