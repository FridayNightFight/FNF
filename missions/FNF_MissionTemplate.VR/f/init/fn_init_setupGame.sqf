waitUntil {!isNil "serverVarsSetup"};

gameEnd = false;
publicVariable "gameEnd";

_zoneRestriction = "phx_zoneRestriction" call BIS_fnc_getParamValue;

if (_zoneRestriction isEqualTo 0) then {
  deleteVehicle zoneTrigger;
};

switch (activeMode) do {
  case "uplink": {
    execVM "f\modes\uplink.sqf";
  };
  case "destroy": {
    execVM "f\modes\destroy.sqf";
  };
  case "destroy_ez": {
    execVM "f\modes\destroy_ez.sqf";
  };
  case "rush": {
    execVM "f\modes\rush.sqf";
  };
  case "ctf": {
    execVM "f\modes\ctf.sqf";
    [[],"f\clientmodes\ctf.sqf"] remoteExec ["BIS_fnc_execVM",0,true];
  };
  case "connection": {
    execVM "f\modes\connection.sqf";
  };
  case "neutralSector": {
    execVM "f\modes\neutralSector.sqf";
  };
  case "neutralCaptureTheFlag": {
    modeParams execVM "f\servermodes\neutralCaptureTheFlag.sqf";
    [[],"f\clientmodes\neutralCaptureTheFlag.sqf"] remoteExec ["BIS_fnc_execVM",0,true];
  };
  case "adSector": {
    execVM "f\modes\adSector.sqf";
  };
  case "0": {};
  default {
    ["Game mode not configured correctly, check 'varSelection.sqf'"] remoteExec ["hint"];
  };
};

if !(activeMode isEqualTo "uplink" || activeMode isEqualTo "connection") then {
  deleteMarker "term1Mark";
  deleteMarker "term2Mark";
  deleteMarker "term3Mark";
};

if !(activeMode isEqualTo "connection") then {
  deleteMarker "term3Mark";
};

if !(activeMode isEqualTo "destroy_ez") then {
  deleteMarker "cache1Mark";
  deleteMarker "cache2Mark";
};

//Delete ctf trigger if mode is not active
if !(activeMode isEqualTo "ctf") then {
  deleteVehicle attackFlagTrig;
  deleteMarker "flagMark";
};
