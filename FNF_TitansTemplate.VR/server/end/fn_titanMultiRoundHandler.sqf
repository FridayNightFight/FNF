_sideWon = _this;
//set the hacking side of terminal to empty
missionNamespace setVariable ["phx_term1HackingSide", sideEmpty, true];
phx_term1HackingSide = sideEmpty;

//if there is a ticket PFH active delete it (what if this is called multiple times? may cause bug in future)
//maybe add check like on ticket PFH for multi calls?
[{!isNil "phx_ticketPFH"}, {[phx_ticketPFH] call CBA_fnc_removePerFrameHandler}] call CBA_fnc_waitUntilAndExecute;

//reset tickets per side
_bluScore = [west] call BIS_fnc_respawnTickets;
_opScore = [east] call BIS_fnc_respawnTickets;

_bluScore = _bluScore - (_bluScore * 2);
_opScore = _opScore - (_opScore * 2);

[west, _bluScore] call BIS_fnc_respawnTickets;
[east, _opScore] call BIS_fnc_respawnTickets;

//wait for 5 seconds after round end for player comfort
[{
	//increase score of winning side
	switch (_this select 0) do {
		case west: {phx_blueTeamScore = phx_blueTeamScore + 1};
		case east: {phx_redTeamScore = phx_redTeamScore + 1};
		default {};
	};

	//tell all players the score
	[format ["Blue Team: %1\nRed Team: %2", phx_blueTeamScore, phx_redTeamScore]] remoteExec ["hint"];

	//delete all dead bodys
	{
		deleteVehicle _x;
	} forEach allDeadMen;

	//delete all items on floor
	{
		deleteVehicle _x; 
	} forEach nearestObjects [getpos term1,["WeaponHolder","GroundWeaponHolder"],500];

	//switch safe start colours
	if (markerColor "bluforSafeMarker" == "colorBLUFOR") then {
		"bluforSafeMarker" setMarkerColor "colorOPFOR";
		"opforSafeMarker" setMarkerColor "colorBLUFOR";
	} else {
		"bluforSafeMarker" setMarkerColor "colorBLUFOR";
		"opforSafeMarker" setMarkerColor "colorOPFOR";
	};

	//call further inits
	missionNamespace setVariable ["newRound", true, true];
	call PHX_fnc_serverMidInit;

}, [_sideWon], 5] call CBA_fnc_waitAndExecute;