_sideWon = _this;

phx_opforGroup = createGroup [east, false];
phx_bluforGroup = createGroup [west, false];
publicVariable "phx_opforGroup";
publicVariable "phx_bluforGroup";

switch (_sideWon) do {
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