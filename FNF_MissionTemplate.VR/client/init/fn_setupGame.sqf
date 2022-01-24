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
    execVM "modes\scavHunt\scavHunt_client.sqf";
  };
};

if (phx_gameMode == "sustainedAssault") then {
  if (playerSide == west) then {
    [[west], [east, independent, civilian, sideLogic]] call ace_spectator_fnc_updateSides;
  };
  if (playerSide == east) then {
    [[east], [west, independent, civilian, sideLogic]] call ace_spectator_fnc_updateSides;
  };
  [[1,2],[0]] call ace_spectator_fnc_updateCameraModes;

  ["init"] call phx_ui_fnc_drawHelpers;
};
