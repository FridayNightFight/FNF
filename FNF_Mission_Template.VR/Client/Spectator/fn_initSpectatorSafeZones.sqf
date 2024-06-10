/*
	Author: Mallen

	Description:
		Sets up the required safe zones specified by modules for spectators

	Parameter(s):
		0: ARRAY -	An array of all safezone modules

	Returns:
		None
*/

params ["_modules"];

_maxTimeZoneIsDeleted = 0;

["safeZoneGroup", true, true, true] call FNF_ClientSide_fnc_addRestrictionGroup;

{
	_syncedObjects = synchronizedObjects _x;
	_zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];
	_timeZoneIsDeleted = _x getVariable ["fnf_timeZoneIsDeleted", 15];

	if (_zonePrefix isEqualTo "FAILED") then
	{
		if (fnf_debug) then
		{
			systemChat "DANGER: Safe zone does not have marker prefix set, safe zone will NOT function"
		};
		continue;
	};


	if (_timeZoneIsDeleted > _maxTimeZoneIsDeleted) then
	{
		_maxTimeZoneIsDeleted = _timeZoneIsDeleted;
	};

	_result = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
	if (_result) then
	{
		["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
		[_zonePrefix, _timeZoneIsDeleted] call FNF_ClientSide_fnc_startSafeZoneTimer;
	} else {
		if (fnf_debug) then
		{
			systemChat "DANGER: Safe zone failed to be initialised, safe zone will NOT function"
		};
	};

} forEach _modules;

//if safe zones have a time limit to them
if (_maxTimeZoneIsDeleted isNotEqualTo 0) then
{
	fnf_timerMessage = "Safe Start Remaining: %1";
	fnf_timerEndTime = _maxTimeZoneIsDeleted * 60;

	_timeToNotify = (_maxTimeZoneIsDeleted * 60) - 300;

	//if time to notify player of 5 minutes remaining has yet to come
	if (_timeToNotify > 0) then
	{
		//set timer to notify when time is reached
		[{
			params["_timeToNotify"];
			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
			_result = objNull;
			if (isServer and hasInterface) then
			{
				_result = time > _timeToNotify;
			} else {
				_result = (serverTime - _timeServerStarted) > _timeToNotify;
			};
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
			_result;
		},{
			true call FNF_ClientSide_fnc_showTimerInHUD;
			["<t size='1.5' align='center'>Safe Zones Drop in 5 Minutes</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
		}, _timeToNotify] call CBA_fnc_waitUntilAndExecute;

	} else {
		//otherwise just keep the timer showing in HUD
		true call FNF_ClientSide_fnc_showTimerInHUD;
	};
};
