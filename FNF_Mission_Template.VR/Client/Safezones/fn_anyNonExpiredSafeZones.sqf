/*
	Author: Mallen

	Description:
		tests if any safe zones valid to the player are on-going, for JIP stopping

	Parameter(s):
		0: ARRAY -  An array of all safezone modules

	Returns:
		Boolean
*/

params ["_modules"];

_maxTimeZoneIsDeleted = -1;

{
  _syncedObjects = synchronizedObjects _x;
  _timeZoneIsDeleted = _x getVariable "fnf_timeZoneIsDeleted";

  _forPlayer = false;
  {
    //check if safezone is for player
    if (_x == player) then
    {
      _forPlayer = true;
      break;
    };
  } forEach _syncedObjects;

  if (_forPlayer) then
  {
    if (_timeZoneIsDeleted > _maxTimeZoneIsDeleted) then
    {
      _maxTimeZoneIsDeleted = _timeZoneIsDeleted;
    };
  };

} forEach _modules;

if (_maxTimeZoneIsDeleted == -1) exitWith {true;};

_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];

_result = objNull;
if (isServer and hasInterface) then
{
  _result = time < (_maxTimeZoneIsDeleted * 60);
} else {
  _result = (serverTime - _timeServerStarted) < (_maxTimeZoneIsDeleted * 60);
};

_result;
