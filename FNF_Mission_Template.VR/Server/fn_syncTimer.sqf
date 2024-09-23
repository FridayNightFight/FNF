/*
	Author: Mallen

	Description:
		starts periodically syncing servertime and displaying ServerFPS to ensure accurate timimg

	Parameter(s):
		0: MODULE -	The FNF init module

	Returns:
		None
*/

[{
	_fps = diag_fps;
	_oldFPS = missionNamespace getVariable ["fnf_serverFPS", 0];
	if (_fps < 75 or _oldFPS < 75) then {
		missionNamespace setVariable ["fnf_serverFPS", _fps, true];
	};

	_triggerFPS = missionNamespace getVariable ["fnf_serverFPSThreshold", 20];

	//Emergency FPS loss, freeze all players and vehicles to retain server stability if allowed
	if ((_fps < _triggerFPS) and (time > 5)) then
	{
		_performanceTweaks = ["PerformanceTweaks", 1] call BIS_fnc_getParamValue;
		if (_performanceTweaks isEqualTo 3) then
		{
			//Emergency Freezing allowed, freezing all players and vics
			_alreadyFrozen = true;

			{
				_isOnFoot = isNull (objectParent _x);
				if (simulationEnabled _x) then
				{
					_alreadyFrozen = false;
				};
				if (not _isOnFoot) then
				{
					(objectParent _x) enableSimulationGlobal false;
				};
				_x enableSimulationGlobal false;
			} forEach allPlayers;

			if (not _alreadyFrozen) then
			{
				[{
					["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>Emergency FPS loss triggered, all players and vehicles have been frozen, please wait for the admin to re-enable gameplay when server has caught up</t>", "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", 0, false];
				}, [], 1] call CBA_fnc_waitAndExecute;
			};
		};
	};
}, 0.25] call CBA_fnc_addPerFrameHandler;

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
