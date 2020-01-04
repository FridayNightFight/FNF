#include "..\..\varSelection.sqf"

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
  case "adRush": {
    execVM "f\modes\adRush.sqf";
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
