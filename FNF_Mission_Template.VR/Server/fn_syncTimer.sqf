/*
	Author: Mallen

	Description:
		starts periodically syncing servertime and displaying ServerFPS to ensure accurate timimg

	Parameter(s):
		0: MODULE -	The FNF init module

	Returns:
		None
*/

if (!isDedicated) exitWith {};

params["_module"];

_MinutesToEnd = _module getVariable ["fnf_gameTime", 65];

_defaultEndTime = _MinutesToEnd * 60;

[{
	_fps = diag_fps;
	_oldFPS = missionNamespace getVariable ["fnf_serverFPS", 0];
	if (_fps < 25 or _oldFPS < 25) then {
		missionNamespace setVariable ["fnf_serverFPS", _fps, true]
	};
}, 1] call CBA_fnc_addPerFrameHandler;

[{
	time > 0;
}, {
	params["_defaultEndTime"];
	missionNamespace setVariable ["fnf_startTime", serverTime, true];
	_defaultEndTime = _defaultEndTime + serverTime;
	[{
		params["_defaultEndTime"];
		estimatedTimeLeft (_defaultEndTime - serverTime);
	}, 15, _defaultEndTime] call CBA_fnc_addPerFrameHandler;
}, _defaultEndTime] call CBA_fnc_waitUntilAndExecute;
