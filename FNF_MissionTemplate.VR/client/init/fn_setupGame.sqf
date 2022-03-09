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

if !(fnf_gameMode == "sustainedAssault") then {

    // add map draw for polygon boundary, clientside

  // [{!isNull (findDisplay 12)}, {
  //   if (isNil "fnf_zoneBoundary_boundaryPos") exitWith {};
  //   if !(count fnf_zoneBoundary_boundaryPos >= 3) exitWith {};

  //   fnf_zoneBoundaryDraw = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {
  //     params ["_control"];
  //     _control drawPolygon [fnf_zoneBoundary_boundaryPos, [0,0,1,1]];
  //   }];
  // }] call CBA_fnc_waitUntilAndExecute;

  // [{!isNull (findDisplay 12) && !isNil "fnf_zoneBoundary_boundaryPos"}, {
  //   {
  //     if (_forEachIndex + 1 < (count fnf_zoneBoundary_boundaryPos)) then {
  //       [_x, fnf_zoneBoundary_boundaryPos select (_forEachIndex + 1), [0,0,1,1], [2, 0.01, 1, 1], true] call BIS_fnc_drawArrow;
  //     } else {
  //       [_x, fnf_zoneBoundary_boundaryPos select 0, [0,0,1,1], [2, 0.01, 1, 1], true] call BIS_fnc_drawArrow;
  //     }
  //   } forEach fnf_zoneBoundary_boundaryPos;
  // }] call CBA_fnc_waitUntilAndExecute;

} else {
  if (playerSide == west) then {
    [[west], [east, independent, civilian, sideLogic]] call ace_spectator_fnc_updateSides;
  };
  if (playerSide == east) then {
    [[east], [west, independent, civilian, sideLogic]] call ace_spectator_fnc_updateSides;
  };
  [[1,2],[0]] call ace_spectator_fnc_updateCameraModes;

  ["init"] call fnf_ui_fnc_drawHelpers;
};
