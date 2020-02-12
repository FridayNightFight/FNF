//Init vars
flagControllingSide = nil;
flagInVic = false;
flagCarrier = "";
flagInCapZone = false;
sideCapturing = nil;
flagMarkerUpdateTime = 10;
_sidesPart = [];
_westPart = false;
_eastPart = false;
_indPart = false;
bluforZoneShown = false;
opforZoneShown = false;
indforZoneShown = false;
//10 min capture time
captureTime = 600;

if (east in objectives) then {
  _eastPart = true;
};
if (west in objectives) then {
  _westPart = true;
};
if (independent in objectives) then {
  _indPart = true;
};

//Make sure flag marker is in correct position
"flagMark" setMarkerPos (getPos flagObj);

//create task
[true,"attackTask",["","Capture the flag","flagMark"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;

if (_eastPart) then {
  _sidesPart pushBack east;

  eastFlagTrig setTriggerActivation ["NONE", "PRESENT", true];
  eastFlagTrig setTriggerStatements ["flagObj inArea thisTrigger && !gameEnd", "
  ['OPFOR has the flag in their capture zone!'] remoteExec ['hint'];
  flagInCapZone = true;
  sideCapturing = east;
  [east] spawn flagInZone;
  ","
  if (!gameEnd) then {
    flagInCapZone = false;
    sideCapturing = nil;
    ['The flag has left the OPFOR capture zone!'] remoteExec ['hint'];
    [] spawn {sleep 5; [''] remoteExec ['hintSilent']};
    switch (flagControllingSide) do {
      case east: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_red_co.paa';
      'flagMark' setMarkerType 'Faction_OPFOR_EP1';};
      case west: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_blue_co.paa';
      'flagMark' setMarkerType 'Faction_BLUFOR_EP1';};
      case independent: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_green_co.paa';
      'flagMark' setMarkerType 'Faction_INDFOR_EP1';};
    };
  };"];
};

if (_westPart) then {
  _sidesPart pushBack west;

  westFlagTrig setTriggerActivation ["NONE", "PRESENT", true];
  westFlagTrig setTriggerStatements ["flagObj inArea thisTrigger && !gameEnd", "
  ['BLUFOR has the flag in their capture zone!'] remoteExec ['hint'];
  flagInCapZone = true;
  sideCapturing = west;
  [west] spawn flagInZone;
  ","
  if (!gameEnd) then {
    flagInCapZone = false;
    sideCapturing = nil;
    ['The flag has left the BLUFOR capture zone!'] remoteExec ['hint'];
    [] spawn {sleep 5; [''] remoteExec ['hintSilent']};
    switch (flagControllingSide) do {
      case east: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_red_co.paa';
      'flagMark' setMarkerType 'Faction_OPFOR_EP1';};
      case west: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_blue_co.paa';
      'flagMark' setMarkerType 'Faction_BLUFOR_EP1';};
      case independent: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_green_co.paa';
      'flagMark' setMarkerType 'Faction_INDFOR_EP1';};
    };
  };"];
};

if (_indPart) then {
  _sidesPart pushBack independent;

  indFlagTrig setTriggerActivation ["NONE", "PRESENT", true];
  indFlagTrig setTriggerStatements ["flagObj inArea thisTrigger && !gameEnd", "
  ['INDFOR has the flag in their capture zone!'] remoteExec ['hint'];
  flagInCapZone = true;
  sideCapturing = independent;
  [independent] spawn flagInZone;
  ","
  if (!gameEnd) then {
    flagInCapZone = false;
    sideCapturing = nil;
    ['The flag has left the INDFOR capture zone!'] remoteExec ['hint'];
    [] spawn {sleep 5; [''] remoteExec ['hintSilent']};
    switch (flagControllingSide) do {
      case east: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_red_co.paa';
      'flagMark' setMarkerType 'Faction_OPFOR_EP1';};
      case west: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_blue_co.paa';
      'flagMark' setMarkerType 'Faction_BLUFOR_EP1';};
      case independent: {flagObj setFlagTexture '\A3\Data_F\Flags\flag_green_co.paa';
      'flagMark' setMarkerType 'Faction_INDFOR_EP1';};
    };
  };"];
};

//Handle flag carrier disconnect
onPlayerDisconnected {
  if (_owner == flagPlayerID && !flagInVic) then {
    call dropFlagServer;
  };
  if (_owner == flagPlayerID && flagInVic) then {
    call flagVicKilled;
  };
};

{
  switch (_x) do {
    case east: {
      _attackCapArea = triggerArea eastFlagTrig;

      createMarker ["eastCapMarker", getPos eastFlagTrig];
      createMarker ["eastCapMarkerText", getPos eastFlagTrig];
      "eastCapMarkerText" setMarkerType "hd_dot";
      "eastCapMarkerText" setMarkerText "OPFOR Capture Zone";

      "eastCapMarker" setMarkerSize [_attackCapArea select 0, _attackCapArea select 1];

      if (_attackCapArea select 3) then {
        "eastCapMarker" setMarkerShape "RECTANGLE";
      } else {
        "eastCapMarker" setMarkerShape "ELLIPSE";
      };

      "eastCapMarker" setMarkerColor "ColorRed";
      "eastCapMarker" setMarkerDir (_attackCapArea select 2);

      ["eastCapMarker",0] remoteExec ["setMarkerAlphaLocal",0,true];
      ["eastCapMarkerText",0] remoteExec ["setMarkerAlphaLocal",0,true];
    };
    case west: {
      _attackCapArea = triggerArea westFlagTrig;

      createMarker ["westCapMarker", getPos westFlagTrig];
      createMarker ["westCapMarkerText", getPos westFlagTrig];
      "westCapMarkerText" setMarkerType "hd_dot";
      "westCapMarkerText" setMarkerText "BLUFOR Capture Zone";

      "westCapMarker" setMarkerSize [_attackCapArea select 0, _attackCapArea select 1];

      if (_attackCapArea select 3) then {
        "westCapMarker" setMarkerShape "RECTANGLE";
      } else {
        "westCapMarker" setMarkerShape "ELLIPSE";
      };

      "westCapMarker" setMarkerColor "ColorBlue";
      "westCapMarker" setMarkerDir (_attackCapArea select 2);

      ["westCapMarker",0] remoteExec ["setMarkerAlphaLocal",0,true];
      ["westCapMarkerText",0] remoteExec ["setMarkerAlphaLocal",0,true];
    };
    case independent: {
      _attackCapArea = triggerArea indFlagTrig;

      createMarker ["indCapMarker", getPos indFlagTrig];
      createMarker ["indCapMarkerText", getPos indFlagTrig];
      "indCapMarkerText" setMarkerType "hd_dot";
      "indCapMarkerText" setMarkerText "INDFOR Capture Zone";

      "indCapMarker" setMarkerSize [_attackCapArea select 0, _attackCapArea select 1];

      if (_attackCapArea select 3) then {
        "indCapMarker" setMarkerShape "RECTANGLE";
      } else {
        "indCapMarker" setMarkerShape "ELLIPSE";
      };

      "indCapMarker" setMarkerColor "ColorGreen";
      "indCapMarker" setMarkerDir (_attackCapArea select 2);

      ["indCapMarker",0] remoteExec ["setMarkerAlphaLocal",0,true];
      ["indCapMarkerText",0] remoteExec ["setMarkerAlphaLocal",0,true];
    };
  };
} forEach _sidesPart;

capMarkerVisibility = {
  switch (side player) do {
    case east: {
      "eastCapMarker" setMarkerAlphaLocal 1;
      "eastCapMarkerText" setMarkerAlphaLocal 1;
    };
    case west: {
      "westCapMarker" setMarkerAlphaLocal 1;
      "westCapMarkerText" setMarkerAlphaLocal 1;
    };
    case independent: {
      "indCapMarker" setMarkerAlphaLocal 1;
      "indCapMarkerText" setMarkerAlphaLocal 1;
    };
  };
};

remoteExec ["capMarkerVisibility",0,true];

//Update flag marker position every 10 seconds
[] spawn {
  while {!gameEnd} do {
    "flagMark" setMarkerPos (getPos flagObj);
    sleep flagMarkerUpdateTime;
  };
};

//Create dummy object used to get new locaion for flag when it is dropped
dummyMark = "Land_HelipadEmpty_F" createVehicle [0,0,0];

//Function to remove actions from flag object
removeFlagAction = {
  [flagObj] remoteExec ["removeAllActions",0,false];
};
//Function to remove actions from flag pole after flag is controlled
removePoleAction = {
  [flagPole] remoteExec ["removeAllActions",0,true];
  [flagBanner] remoteExec ["hideObject",0,true];
  [flagObj,false] remoteExec ["hideObject",0,true];
};

//Function the server calls when the flag is dropped
dropFlagServer = {
  detach flagObj;
  detach dummyMark;
  flagObj attachTo [dummyMark,[0,0.475,1.5]];
  [flagObj,[0,0,1]] remoteExec ["setVectorUp",0,false];
  detach flagObj;
  [] remoteExec ["flagAction",0,false];

  switch (flagControllingSide) do {
    case east: {
      if !(flagObj inArea eastFlagTrig) then {
        ["The flag has been dropped!"] remoteExec ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
        "flagMark" setMarkerType "hd_flag";
      };
    };
    case west: {
      if !(flagObj inArea westFlagTrig) then {
        ["The flag has been dropped!"] remoteExec ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
        "flagMark" setMarkerType "hd_flag";
      };
    };
    case independent: {
      if !(flagObj inArea indFlagTrig) then {
        ["The flag has been dropped!"] remoteExec ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
        "flagMark" setMarkerType "hd_flag";
      };
    };
  };
  if (flagObj inArea eastFlagTrig) then {
    flagObj setFlagTexture "\A3\Data_F\Flags\flag_red_co.paa";
  };
  if (flagObj inArea westFlagTrig) then {
    flagObj setFlagTexture "\A3\Data_F\Flags\flag_blue_co.paa";
  };
  if (flagObj inArea indFlagTrig) then {
    flagObj setFlagTexture "\A3\Data_F\Flags\flag_green_co.paa";
  };
};

//Function the server calls when the flag is picked up
flagControlled = {
  params["_side","_player"];
  flagControllingSide = _side;
  call removeFlagAction;
  flagCarrier = _player;
  dummyMark attachTo [_player,[0,0,0]];
  flagObj attachTo [_player, [0.1,0.4,1.45], "aiming_axis"];
  [flagObj,[0,0,1]] remoteExec ["setVectorUp",0,false];

  switch (_side) do {
    case east: {
      if !(opforZoneShown) then {
        ["eastCapMarker",1] remoteExec ["setMarkerAlphaLocal",0,true];
        ["eastCapMarkerText",1] remoteExec ["setMarkerAlphaLocal",0,true];
        opforZoneShown = true;
      };
      if !(flagObj inArea eastFlagTrig) then {
        ["OPFOR controls the flag!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_red_co.paa";
        "flagMark" setMarkerType "Faction_OPFOR_EP1";
      };
    };
    case west: {
      if !(bluforZoneShown) then {
        ["westCapMarker",1] remoteExec ["setMarkerAlphaLocal",0,true];
        ["westCapMarkerText",1] remoteExec ["setMarkerAlphaLocal",0,true];
        bluforZoneShown = true;
      };
      if !(flagObj inArea westFlagTrig) then {
        ["BLUFOR controls the flag!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_blue_co.paa";
        "flagMark" setMarkerType "Faction_BLUFOR_EP1";
      };
    };
    case independent: {
      if !(indforZoneShown) then {
        ["indCapMarker",1] remoteExec ["setMarkerAlphaLocal",0,true];
        ["indCapMarkerText",1] remoteExec ["setMarkerAlphaLocal",0,true];
        indforZoneShown = true;
      };
      if !(flagObj inArea indFlagTrig) then {
        ["INDFOR controls the flag!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_green_co.paa";
        "flagMark" setMarkerType "Faction_INDFOR_EP1";
      };
    };
  };
};

//EH to check if the flag carrier died in a vehicle
flagVicEH = addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];
  if !(_killed isKindOf "Man" && _killed == flagCarrier && flagInVic) exitWith {};

  call flagVicKilled;
}];

//Function called if the flag carrier died/disconnected in a vehicle
flagVicKilled = {
  detach flagObj;
  detach dummyMark;

  _pos = getPosATL flagObj;
  _newFlagPos = _pos findEmptyPosition [0.25, 15, "rhs_Flag_chdkz"];
  dummyMark setPosATL _newFlagPos;

  flagObj attachTo [dummyMark,[0,0.475,1.5]];
  [flagObj,[0,0,1]] remoteExec ["setVectorUp",0,false];
  detach flagObj;

  [] remoteExec ["flagAction",0,false];


  switch (flagControllingSide) do {
    case east: {
      if !(flagObj inArea eastFlagTrig) then {
        ["The flag has been dropped!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
        "flagMark" setMarkerType "hd_flag";
      };
    };
    case west: {
      if !(flagObj inArea westFlagTrig) then {
        ["The flag has been dropped!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
        "flagMark" setMarkerType "hd_flag";
      };
    };
    case independent: {
      if !(flagObj inArea indFlagTrig) then {
        ["The flag has been dropped!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
        "flagMark" setMarkerType "hd_flag";
      };
    };
  };
};

//function called if the flag carrier enters a vehicle. Puts the flag on the roof of the vehicle.
flagInVehicle = {
  params ["_vehicle","_unit"];
  flagVic = _vehicle;

  detach flagObj;
  detach dummyMark;

  //Locations for commonly used vehicles
  switch (typeOf _vehicle) do {
    case "rhsusf_m1025_w_m2": {
      flagObj attachTo [_vehicle,[0,-1.5,0.75]];
    };
    case "rhsusf_m1025_w": {
      flagObj attachTo [_vehicle,[0,-1.5,0.75]];
    };
    case "rhsgref_ins_uaz_dshkm": {
      flagObj attachTo [_vehicle,[-0.8,-1.22,1.7]];
    };
    case "rhsgref_ins_uaz": {
      flagObj attachTo [_vehicle,[-0.8,-1.22,1.7]];
    };
    case "I_G_Quadbike_01_F": {
      flagObj attachTo [_vehicle,[-0.5,-0.6,1.1]];
    };
    case "rhsusf_m966_w": {
      flagObj attachTo [_vehicle,[0,-1.5,0.75]];
    };
    case "rhs_btr80a_msv": {
      flagObj attachTo [_vehicle,[-0.9,-3.5,1.85]];
    };
    case "RHS_M2A3_wd": {
      flagObj attachTo [_vehicle,[-0.75,-2,2]];
    };
    //Default location
    default {
      flagObj attachTo [_vehicle,[0,-0.5,1]];
    };
  };
};

//Function called when the flag carrier exits a vehicle
flagOutVehicle = {
  params ["_player"];

  dummyMark attachTo [_player,[0,0,0]];
  flagObj attachTo [_player, [0.1,0.4,1.45], "aiming_axis"];
  [flagObj,[0,0,1]] remoteExec ["setVectorUp",0,false];
};

//Function called when the flag enters the capture zone. Capture timer starts.
flagInZone = {
  params ["_side"];
  if !(flagInCapZone) exitWith {};

  _captureTimeLeft = captureTime;

  sleep 3;

  _captureTimeLeft = _captureTimeLeft - 3;

  while {flagInCapZone && !gameEnd} do {
    if (_captureTimeLeft <= 0) then {
      gameEnd = true;
      [format["%1 has successfully held the flag.\n%1 wins!", _capTimeSideText]] remoteExec ["hint"];
      sleep 15;
      "end1" call bis_fnc_endMissionServer;
    };
    _captureTimeDisplay = format ["Capture time remaining: %1", [_captureTimeLeft, "MM:SS"] call BIS_fnc_secondsToString];
    [_captureTimeDisplay] remoteExec ["hintSilent"];

    _captureTimeLeft = _captureTimeLeft - 1;

    sleep 1;
  };
};
