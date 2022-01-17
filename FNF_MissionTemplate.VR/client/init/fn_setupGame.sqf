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

  player addEventHandler ["FiredMan",{
    private _vehicle = param [7,objNull];
    _this spawn {
      private _unit = param [0,objNull];
      private _weapon = param [1,objNull];
      private _projectile = param [6,objNull];
      private _vehicle = param [7,objNull];
      private _badPos = false;
      while {alive _projectile} do {
        if (side _unit == east) then {
          if (_projectile inArea safeZone_BLUFOR || _projectile inArea "rally_west_marker") exitWith {
            _badPos = true;
          };
        };
        if (side _unit == west) then {
          if (_projectile inArea safeZone_OPFOR || _projectile inArea "rally_east_marker") exitWith {
            _badPos = true;
          };
        };
        uiSleep 0.5;
      };

      if (_badPos) then {
        deleteVehicle _projectile;
        if (_vehicle in [
          missionNamespace getVariable ["west_howitzer", objNull],
          missionNamespace getVariable ["east_howitzer", objNull]
        ]) then {
          [format[
            "<t align='center'>Deleted a round from a<br/>%1<br/> fired by<br/>%2 (%3)<br/><br/>Please do NOT fire at the enemy base!</t>",
            getText(configFile >> "CfgWeapons" >> _weapon >> "displayName"),
            name _unit,
            (side (group _unit)) call BIS_fnc_sideName
          ], "warning", 7] remoteExecCall ["phx_ui_fnc_notify",0];
        };
      };
    };
  }];
};
