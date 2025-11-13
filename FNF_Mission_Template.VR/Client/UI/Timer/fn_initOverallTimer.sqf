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

//set up overall timer
[{
	(_this select 0) params["_defaultEndTime"];

	_timeToEnd = _defaultEndTime;

	if !(isNil "fnf_timerEndTime") then
	{
		_timeToEnd = fnf_timerEndTime;
	};

	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];

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
		_setText ctrlSetStructuredText parseText ([(_timeToEnd - _time), "MM:SS"] call BIS_fnc_secondsToString);
	} else {
		_setText ctrlSetStructuredText parseText ("+" + ([(_timeToEnd - _time), "MM:SS"] call BIS_fnc_secondsToString));
	};

	_opforScoreText = _display displayCtrl 1004;
	_bluforScoreText = _display displayCtrl 1005;

	_opforScore = missionNamespace getVariable ["fnf_opforScore", "???"];
	_bluforScore = missionNamespace getVariable ["fnf_bluforScore", "???"];

	_opforScoreText ctrlSetStructuredText parseText str (_opforScore);
	_bluforScoreText ctrlSetStructuredText parseText str (_bluforScore);
}, 1, [_defaultEndTime]] call CBA_fnc_addPerFrameHandler;

true call FNF_ClientSide_fnc_showTimerInHUD;
