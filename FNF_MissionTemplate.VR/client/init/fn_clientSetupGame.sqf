/*
Calls the client-portion of the game modes
*/

if (!hasInterface) exitWith {};

switch (phx_gameMode) do {
  case "destroy": {
    execVM "modes\destroy\destroy_client.sqf";
  };
  case "uplink": {
    execVM "modes\uplink\uplink_client.sqf";
  };
  case "rush": {
    execVM "modes\rush\rush_client.sqf";
  };
  case "connection": {
    execVM "modes\connection\connection_client.sqf";
  };
  case "captureTheFlag": {
    execVM "modes\ctf\ctf_client.sqf";
  };
  case "scavHunt": {
    [
      {!isNil "phx_missionTimeLimit"},
      {phx_missionTimeLimit = 40}
    ] call CBA_fnc_waitUntilAndExecute;
  };
};
