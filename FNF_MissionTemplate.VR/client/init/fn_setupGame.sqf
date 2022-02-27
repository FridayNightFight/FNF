/*
Calls the client-portion of the game modes
*/

if (!hasInterface) exitWith {};

switch (fnf_gameMode) do {
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
      {!isNil "fnf_missionTimeLimit"},
      {fnf_missionTimeLimit = 40}
    ] call CBA_fnc_waitUntilAndExecute;
    execVM "modes\scavHunt\scavHunt_client.sqf";
  };
};

if (fnf_gameMode == "sustainedAssault") then {
  if (playerSide == west) then {
    [[west], [east, independent, civilian, sideLogic]] call ace_spectator_fnc_updateSides;
  };
  if (playerSide == east) then {
    [[east], [west, independent, civilian, sideLogic]] call ace_spectator_fnc_updateSides;
  };
  [[1,2],[0]] call ace_spectator_fnc_updateCameraModes;

  ["init"] call fnf_ui_fnc_drawHelpers;
};
