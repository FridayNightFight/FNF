/*
	Author: Mallen

	Description:
		starts periodically syncing servertime to ensure accurate timimg

	Parameter(s):
		None

	Returns:
		None
*/

if (!isDedicated) exitWith {};

[{
  time > 0;
}, {
  missionNamespace setVariable ["fnf_startTime", serverTime, true];
  [{
    estimatedTimeLeft 30000;
  }, 15] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
