flagPoleAction = {
  [
      flagPole,                                                                           // Object the action is attached to
      "Take Flag",                                                                       // Title of the action
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca",                      // Idle icon shown on screen
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca",                      // Progress icon shown on screen
      "(_this distance _target < 5) && (playerSide isEqualTo phx_attackingSide)",                                                        // Condition for the action to be shown
      "_caller distance _target < 5",                                                      // Condition for the action to progress
      {},                       // Code executed when action starts
      {},                                                                                  // Code executed on every progress tick
      {
        call grabFlag; remoteExec ["removePoleAction",2,false]; "attackCapMarker" setMarkerAlpha 1; "capMarkerText" setMarkerAlpha 1
        },                             // Code executed on completion
      {},                                                                                  // Code executed on interrupted
      [],                                                                                  // Arguments passed to the scripts as _this select 3
      3,                                                                                  // Action duration [s]
      0,                                                                                   // Priority
      true,                                                                                // Remove on completion
      false                                                                               // Show in unconscious state
  ] call BIS_fnc_holdActionAdd;
};

flagAction = {
  [
      flagObj,                                                                           // Object the action is attached to
      "Take Flag",                                                                       // Title of the action
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca",                      // Idle icon shown on screen
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca",                      // Progress icon shown on screen
      "_this distance _target < 4",                                                        // Condition for the action to be shown
      "_caller distance _target < 4",                                                      // Condition for the action to progress
      {},                       // Code executed when action starts
      {},                                                                                  // Code executed on every progress tick
      {[] spawn grabFlag},                             // Code executed on completion
      {},                                                                                  // Code executed on interrupted
      [],                                                                                  // Arguments passed to the scripts as _this select 3
      1,                                                                                  // Action duration [s]
      0,                                                                                   // Priority
      true,                                                                                // Remove on completion
      false                                                                               // Show in unconscious state
  ] call BIS_fnc_holdActionAdd;
};

flagPlayerID = clientOwner;
playerDead = false;
flagInVic = false;
hasFlag = false;
call flagPoleAction;
player disableCollisionWith flagObj;

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
  if (!hasFlag) exitWith {};

  flagInVic = true;
  publicVariableServer "flagInVic";

  [_vehicle,player] remoteExec ["flagInVehicle",2,false];
}];

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
  if (!hasFlag) exitWith {};

  flagInVic = false;
  publicVariableServer "flagInVic";

  [player] remoteExec ["flagOutVehicle",2,false];
}];

player addEventHandler ["Killed", {
  params ["_unit", "_killer", "_instigator", "_useEffects"];

  if (hasFlag) then {
    [] remoteExec ["dropFlagServer",2,false];
  };
  playerDead = true;
  hasFlag = false;
}];

grabFlag = {
  if (!isNil "dropAction") then {
    player removeAction dropAction;
  };
  hasFlag = true;
  publicVariableServer "flagPlayerID";
  [playerSide,player] remoteExec ["flagControlled",2,false];
  [] spawn flagLoop;
  dropAction = player addAction ["Drop Flag", {[playerSide] remoteExec ["dropFlagServer",2,false]; call dropFlag},nil,1.5,false,true,"","player == _target"];
};

dropFlag = {
  player removeAction dropAction;
  hasFlag = false;
};

flagLoop = {
  while {hasFlag} do {
    if (player getVariable ["ACE_isUnconscious",false]) then {
      if (hasFlag) then {
        hasFlag = false;
        [] remoteExec ["dropFlagServer",2,false];
      };
    };
    sleep 0.25;
  };
};
