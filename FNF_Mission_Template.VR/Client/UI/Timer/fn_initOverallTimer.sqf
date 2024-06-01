/*
	Author: Indigo (Edited by Mallen)

	Description:
		Sets up the overall timer letting players know when the game is finished

	Parameter(s):
		0: MODULE -	The FNF init module

	Returns:
		None
*/
params["_module"];

disableSerialization;

_MinutesToEnd = _module getVariable ["fnf_gameTime", 65];

_defaultEndTime = _MinutesToEnd * 60;
_defaultMessage = "Mission Time Remaining: %1";

//set up overall timer
[{
	(_this select 0) params["_defaultEndTime", "_defaultMessage"];

	_timeToEnd = _defaultEndTime;
	_message = _defaultMessage;

	if !(isNil "fnf_timerEndTime") then
	{
		_timeToEnd = fnf_timerEndTime;
	};
	if !(isNil "fnf_timerMessage") then
	{
		_message = fnf_timerMessage;
	};

	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];

	_timeToEnd = _timeToEnd + _timeServerStarted;

	_display = uiNameSpace getVariable ["timeleftStructText", "NOTFOUND"];
	if (_display isEqualTo "NOTFOUND") exitWith {};
	_setText = _display displayCtrl 1003;
	_time = 0;
	if (isServer and hasInterface) then
	{
		_time = time;
	} else {
		_time = serverTime;
	};
	if (_time <= _timeToEnd) then {
		_setText ctrlSetStructuredText parseText (format [_message, [(_timeToEnd - _time), "MM:SS"] call BIS_fnc_secondsToString]);
	} else {
		_setText ctrlSetStructuredText parseText (format [_message, "+" + ([(_time - _timeToEnd), "MM:SS"] call BIS_fnc_secondsToString)]);
	};
}, 1, [_defaultEndTime, _defaultMessage]] call CBA_fnc_addPerFrameHandler;

false call FNF_ClientSide_fnc_showTimerInHUD;

//give notification when 15 mins of game time left
[{
	params["_defaultEndTime"];
	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];;
	_result = objNull;
	if (isServer and hasInterface) then
	{
		_result = time > (_defaultEndTime - 900);
	} else {
		_result = (serverTime - _timeServerStarted) > (_defaultEndTime - 900);
	};
	if (time < 1) then
	{
		_result = false;
	};
	_result;
},{
	true call FNF_ClientSide_fnc_showTimerInHUD;
	["<t size='1.5' align='center'>Game Ends in 15 Minutes</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
}, _defaultEndTime] call CBA_fnc_waitUntilAndExecute;
