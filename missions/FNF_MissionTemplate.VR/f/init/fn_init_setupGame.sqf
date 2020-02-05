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
  case "neutralCTF": {
    execVM "f\modes\neutralCTF.sqf";
    [[],"f\clientmodes\neutralCTF.sqf"] remoteExec ["BIS_fnc_execVM",0,true];
  };
  case "connection": {
    execVM "f\modes\connection.sqf";
  };
  case "neutralSector": {
    execVM "f\modes\neutralSector.sqf";
  };
  case "adSector": {
    execVM "f\modes\adSector.sqf";
  };
  case "0": {};
  default {
    ["Game mode not configured correctly, check 'varSelection.sqf'"] remoteExec ["hint"];
  };
};

if !(activeMode isEqualTo "destroy_ez") then {
  ["cache1Mark"] remoteExec ["deleteMarkerLocal",0,true];
  ["cache2Mark"] remoteExec ["deleteMarkerLocal",0,true];
};

if !(activeMode isEqualTo "ctf" || activeMode isEqualTo "neutralCTF") then {
  deleteVehicle attackFlagTrig;
  ["flagMark"] remoteExec ["deleteMarkerLocal",0,true];
};

if !(activeMode isEqualTo "neutralCTF") then {
  deleteVehicle eastFlagTrig;
  deleteVehicle westFlagTrig;
  deleteVehicle indFlagTrig;
};
