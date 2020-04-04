phx_gameEnd = false;
publicVariable "phx_gameEnd";

_zoneRestriction = "phx_zoneRestriction" call BIS_fnc_getParamValue;

if (_zoneRestriction isEqualTo 0) then {
  deleteVehicle zoneTrigger;
};

//Start selection markers
_defaultStartMarkers = ["startSelectionMarker_1","startSelectionMarker_2","startSelectionMarker_3","start1Text","start2Text","start3Text"];

{
  [_x, 0] remoteExec ["setMarkerAlphaLocal", 0, true];
} forEach _defaultStartMarkers;

if (typeName phx_startSelectionSide == "BOOL") then {
  {
    [_x] remoteExec ["deleteMarkerLocal",0,true];
  } forEach _defaultStartMarkers;
} else {
  if (typeName phx_startSelectionSide == "SIDE") then {
    {
      [_x, 1] remoteExec ["setMarkerAlphaLocal", phx_startSelectionSide, true];
    } forEach _defaultStartMarkers;
  };
};

//Create mode
switch (phx_gameMode) do {
  case "uplink": {
    execVM "f\modes\uplink.sqf";
  };
  case "destroy": {
    execVM "f\modes\destroy.sqf";
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

if !(phx_gameMode isEqualTo "ctf" || phx_gameMode isEqualTo "neutralCTF") then {
  deleteVehicle attackFlagTrig;
  ["flagMark"] remoteExec ["deleteMarkerLocal",0,true];
};

if !(phx_gameMode isEqualTo "neutralCTF") then {
  deleteVehicle eastFlagTrig;
  deleteVehicle westFlagTrig;
  deleteVehicle indFlagTrig;
};

if !(phx_gameMode isEqualTo "destroy") then {
  ["ez_cache1Mark"] remoteExec ["deleteMarkerLocal",0,true];
  ["ez_cache2Mark"] remoteExec ["deleteMarkerLocal",0,true];
};
