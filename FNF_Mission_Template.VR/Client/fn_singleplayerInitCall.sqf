/*
	Author: Mallen

	Description:
		Used to make spectator and local testing work correctly

	Parameter(s):
		None

	Returns:
		None
*/

if (isDedicated) exitWith {};

if (typeOf player isEqualTo "ace_spectator_virtual") exitWith {call FNF_ClientSide_fnc_init;};

if (hasInterface and isServer) exitwith
{
	call FNF_ClientSide_fnc_init;

	//on export markers are auto set to 0 alpha to hide stuff from players, this imitates that for sequential Sectors
	_markers = allMapMarkers;
	{
		_alpha = markerAlpha _x;
		if (_alpha isEqualTo 0.99) then
		{
			_x setMarkerAlphaLocal 0;
		};
	} forEach _markers;
};

if ((count allPlayers) > 80) then
{
	player enableSimulation false;
	["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>Your simulation has been disabled to allow the server to catch up, please standby</t>", "deep-purple", 10] call FNF_ClientSide_fnc_notificationSystem;
	[{
		(time > 1) and (missionNamespace getVariable ["fnf_serverFPS", 0] > 20);
	}, {
		_timeToUnfreeze = random [3,6,9];
		["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>Server has caught up, you will be un-frozen in " + str(_timeToUnfreeze) + " seconds...</t>", "deep-purple", 10] call FNF_ClientSide_fnc_notificationSystem;
		[{player enableSimulation true;}, [], _timeToUnfreeze] call CBA_fnc_waitAndExecute;
	}] call CBA_fnc_waitUntilAndExecute
};
