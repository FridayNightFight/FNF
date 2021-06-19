_sideWon = _this;

if !(isNil "phx_ticketPFH") then {
	[phx_ticketPFH] call CBA_fnc_removePerFrameHandler;
};

_bluScore = [west] call BIS_fnc_respawnTickets;
_opScore = [east] call BIS_fnc_respawnTickets;

_bluScore = _bluScore - (_bluScore * 2);
_opScore = _opScore - (_opScore * 2);

[west, _bluScore] call BIS_fnc_respawnTickets;
[east, _opScore] call BIS_fnc_respawnTickets;

if (missionNamespace getVariable ["teamsSwitched", false]) then	{
	missionNamespace setVariable ["teamsSwitched", true, true];
} else {
	missionNamespace setVariable ["teamsSwitched", false, true];
};

[{

	switch (_this select 0) do {
		case west: {phx_blueTeamScore = phx_blueTeamScore + 1};
		case east: {phx_redTeamScore = phx_redTeamScore + 1};
		default {};
	};

	[format ["Blue Team: %1\nRed Team: %2", phx_blueTeamScore, phx_redTeamScore]] remoteExec ["hint"];

	{
		deleteVehicle _x;
	} forEach allDeadMen;

	missionNamespace setVariable ["newRound", true, true];
	call PHX_fnc_serverMidInit;

}, [_sideWon], 5] call CBA_fnc_waitAndExecute;