_option = _this;

switch (_option) do
{
	case 1: {phx_gameEnd = true;
	publicVariable "phx_gameEnd";
	west call PHX_fnc_titanMultiRoundHandler;};
	case 2: {phx_gameEnd = true;
	publicVariable "phx_gameEnd";
	east call PHX_fnc_titanMultiRoundHandler;};
	case 3: {phx_blueTeamScore = phx_blueTeamScore + 1;
	[format ["Blue Team: %1\nRed Team: %2", phx_blueTeamScore, phx_redTeamScore]] remoteExec ["hint"];};
	case 4: {phx_blueTeamScore = phx_blueTeamScore - 1;
	[format ["Blue Team: %1\nRed Team: %2", phx_blueTeamScore, phx_redTeamScore]] remoteExec ["hint"];};
	case 5: {phx_redTeamScore = phx_redTeamScore + 1;
	[format ["Blue Team: %1\nRed Team: %2", phx_blueTeamScore, phx_redTeamScore]] remoteExec ["hint"];};
	case 6: {phx_redTeamScore = phx_redTeamScore - 1;
	[format ["Blue Team: %1\nRed Team: %2", phx_blueTeamScore, phx_redTeamScore]] remoteExec ["hint"];};
	default {};
};