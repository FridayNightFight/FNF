/*
	Author: Mallen

	Description:
		starts periodically syncing servertime to ensure accurate timimg

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
