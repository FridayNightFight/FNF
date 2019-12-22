waitUntil {!isNil "serverVarsSetup"};

gameEnd = false;
publicVariable "gameEnd";

_zoneRestriction = "phx_zoneRestriction" call BIS_fnc_getParamValue;

if (_zoneRestriction isEqualTo 0) then {
  deleteVehicle zoneTrigger;
};

switch (activeMode) do {
  case "adUplink": {
    execVM "f\modes\adUplink.sqf";
  };
  case "adDestroy": {
    execVM "f\modes\adDestroy.sqf";
  };
  case "adCaptureTheFlag": {
    modeParams execVM "f\servermodes\adCaptureTheFlag.sqf";
    [[],"f\clientmodes\adCaptureTheFlag.sqf"] remoteExec ["BIS_fnc_execVM",0,true];
  };
  case "neutralUplink": {
    [] execVM "f\servermodes\neutralUplink.sqf";
  };
  case "neutralSector": {
    modeParams execVM "f\servermodes\neutralSector.sqf";
  };
  case "neutralCaptureTheFlag": {
    modeParams execVM "f\servermodes\neutralCaptureTheFlag.sqf";
    [[],"f\clientmodes\neutralCaptureTheFlag.sqf"] remoteExec ["BIS_fnc_execVM",0,true];
  };
  case "adSector": {
    modeParams execVM "f\servermodes\adSector.sqf";
  };
  case "0": {};
  default {
    ["Game mode not configured correctly, check 'varSelection.sqf'"] remoteExec ["hint"];
  };
};

//Uplink
if (!(activeMode isEqualTo "adUplink")) then {
  _objs = [term1,term2,uplinkSpeaker1,uplinkSpeaker2,uplinkSound1,uplinkSound2];
  _markers = ["term1Mark","term2Mark"];
  {
    if (!isNull _x) then {
      deleteVehicle _x;
    };
  } forEach _objs;
  {
    if (!(getMarkerColor _x isEqualTo "")) then {
      [_x] remoteExec ["deleteMarker",0,true];
    };
  } forEach _markers;
};

if (activeMode isEqualTo "adUplink") then {
  if (modeParams select 1 == 1) then {
    deleteVehicle term2;
    deleteVehicle uplinkSpeaker2;
    deleteVehicle uplinkSound2;
    "term2Mark" remoteExec ["deleteMarker",0,true];
  };
};

//CTF
if (!(activeMode isEqualTo "neutralCaptureTheFlag") && !(activeMode isEqualTo "adCaptureTheFlag")) then {
  if (!isNull flagObj) then {
    deleteVehicle flagObj;
  };
  if (!isNull flagPole) then {
    deleteVehicle flagPole;
  };
  if (!isNull flagBanner) then {
    deleteVehicle flagBanner;
  };
  if (!(getMarkerColor "flagMark" isEqualTo "")) then {
    ["flagMark"] remoteExec ["deleteMarker",0,true];
  };
  if (!isNull bluFlagTrig) then {
    deleteVehicle bluFlagTrig;
  };
  if (!isNull opfFlagTrig) then {
    deleteVehicle opfFlagTrig;
  };
};

//AD CTF
if (activeMode isEqualTo "adCaptureTheFlag") then {
  _defendingSide = modeParams select 0;
  switch (_defendingSide) do {
    case east: {
      if (!isNull opfFlagTrig) then {
        deleteVehicle opfFlagTrig;
        defendingSide = east;
      };
    };
    case west: {
      if (!isNull bluFlagTrig) then {
        deleteVehicle bluFlagTrig;
        defendingSide = west;
      };
    };
  };
  publicVariable "defendingSide";
};

//Neutral Sector Control
if !(activeMode isEqualTo "neutralSector") then {
  deleteVehicle sector;
  deleteVehicle sectorSideBlu;
  deleteVehicle sectorSideOpf;
};
