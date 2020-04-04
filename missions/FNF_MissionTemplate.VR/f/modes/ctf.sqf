//Init vars
flagControllingSide = "";
flagInVic = false;
flagCarrier = "";
flagInCapZone = false;
flagMarkerUpdateTime = 10;

//5 min capture time
captureTime = 300;

//Make sure flag marker is in correct position
"flagMark" setMarkerPos (getPos flagObj);

//create tasks
[phx_defendingSide,"defendTask",["","Defend the flag","flagMark"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide,"attackTask",["","Capture the flag","flagMark"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;

//create capture triggers
attackFlagTrig setTriggerActivation ["NONE", "PRESENT", true];
attackFlagTrig setTriggerStatements ["flagObj inArea thisTrigger && !phx_gameEnd", "
['Attackers have the flag in their capture zone!'] remoteExec ['hint'];
flagInCapZone = true;
[] spawn flagInZone;
","
if (!phx_gameEnd) then {
  flagInCapZone = false;
  ['The flag has left the capture zone!'] remoteExec ['hint'];
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

//Handle flag carrier disconnect
onPlayerDisconnected {
  if (_owner == flagPlayerID && !flagInVic) then {
    call dropFlagServer;
  };
  if (_owner == flagPlayerID && flagInVic) then {
    call flagVicKilled;
  };
};

//Set flag pole flag to color of defending side
switch (phx_defendingSide) do {
  case east: {
    flagBanner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_red_co.paa"];
  };
  case west: {
    flagBanner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_blue_co.paa"];
  };
  case independent: {
    flagBanner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_green_co.paa"];
  };
};

//Create trigger for returning the flag
returnTrigger = createTrigger ["EmptyDetector", (getPos flagPole), false];
returnTrigger setTriggerActivation ["NONE", "PRESENT", true];
returnTrigger setTriggerArea [5, 5, 0, false];
returnTrigger setTriggerStatements  ["(flagObj inArea thisTrigger) && (flagControllingSide isEqualTo phx_defendingSide) && !phx_gameEnd", "
call flagReturn;
",""];

//Setup marker for capture area
_attackCapArea = triggerArea attackFlagTrig;

createMarker ["attackCapMarker", getPos attackFlagTrig];
createMarker ["capMarkerText", getPos attackFlagTrig];
"capMarkerText" setMarkerType "hd_dot";
"capMarkerText" setMarkerText "Capture Zone";

"attackCapMarker" setMarkerSize [_attackCapArea select 0, _attackCapArea select 1];

if (_attackCapArea select 3) then {
  "attackCapMarker" setMarkerShape "RECTANGLE";
} else {
  "attackCapMarker" setMarkerShape "ELLIPSE";
};

switch (phx_attackingSide) do {
  case east: {
    "attackCapMarker" setMarkerColor "ColorRed";
  };
  case west: {
    "attackCapMarker" setMarkerColor "ColorBlue";
  };
  case independent: {
    "attackCapMarker" setMarkerColor "ColorGreen";
  };
};

"attackCapMarker" setMarkerDir (_attackCapArea select 2);

capMarkerVisibility = {
  if (playerSide == phx_defendingSide) then {
    "attackCapMarker" setMarkerAlphaLocal 0;
    "capMarkerText" setMarkerAlphaLocal 0;
  } else {
    "attackCapMarker" setMarkerAlphaLocal 1;
    "capMarkerText" setMarkerAlphaLocal 1;
  };
};

remoteExec ["capMarkerVisibility",0,true];

//Setup marker for return area
_returnMarkerArea = triggerArea returnTrigger;
createMarker ["returnMarker", getPos returnTrigger];
createMarker ["returnMarkerText", getPos returnTrigger];

"returnMarker" setMarkerShape "ELLIPSE";
"returnMarker" setMarkerSize [_returnMarkerArea select 0, _returnMarkerArea select 1];

"returnMarkerText" setMarkerType "hd_dot";
"returnMarkerText" setMarkerText "Flag Return Zone";
["returnMarkerText",0] remoteExec ["setMarkerAlphaLocal",0,true];

["returnMarker",0] remoteExec ["setMarkerAlphaLocal",0,true];

//Flag return function
flagReturn = {
  ["The flag has been returned!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
  hasFlag = false;
  publicVariable "hasFlag";
  [player,dropAction] remoteExec ["removeAction",flagPlayerID,false];
  [player,1] remoteExec ["setAnimSpeedCoef",flagPlayerID,false];
  "flagMark" setMarkerPos (getPos flagObj);
  detach flagObj;
  detach dummyMark;
  [flagObj] remoteExec ["hideObject",0,true];
  flagObj setPosATL (getPosATL flagPole);
  "flagMark" setMarkerType "hd_flag";
  flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
  [flagBanner,false] remoteExec ["hideObject",0,true];

  //hides return zone
  ["returnMarker",0] remoteExec ["setMarkerAlphaLocal",0,true];
  ["returnMarkerText",0] remoteExec ["setMarkerAlphaLocal",0,true];

  remoteExec ["flagPoleAction",2,false];
};

//Update flag marker position every 10 seconds
[] spawn {
  while {!phx_gameEnd} do {
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

  //Shows the flag return zone
  ["returnMarker",1] remoteExec ["setMarkerAlphaLocal",0,true];
  ["returnMarkerText",1] remoteExec ["setMarkerAlphaLocal",0,true];
};

//Function the server calls when the flag is dropped
dropFlagServer = {
  detach flagObj;
  detach dummyMark;
  flagObj attachTo [dummyMark,[0,0.475,1.5]];
  [flagObj,[0,0,1]] remoteExec ["setVectorUp",0,false];
  detach flagObj;
  [] remoteExec ["flagAction",0,false];
  if !(flagObj inArea attackFlagTrig) then {
    ["The flag has been dropped!"] remoteExec ["phx_fnc__hintThenClear", 0];
    flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
    "flagMark" setMarkerType "hd_flag";
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
      if !(flagObj inArea attackFlagTrig) then {
        ["OPFOR controls the flag!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_red_co.paa";
        "flagMark" setMarkerType "Faction_OPFOR_EP1";
      };
    };
    case west: {
      if !(flagObj inArea attackFlagTrig) then {
        ["BLUFOR controls the flag!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
        flagObj setFlagTexture "\A3\Data_F\Flags\flag_blue_co.paa";
        "flagMark" setMarkerType "Faction_BLUFOR_EP1";
      };
    };
    case independent: {
      if !(flagObj inArea attackFlagTrig) then {
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

  if !(flagObj inArea attackFlagTrig) then {
    ["The flag has been dropped!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
    flagObj setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
    "flagMark" setMarkerType "hd_flag";
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
  _captureTimeLeft = captureTime;

  sleep 3;

  _captureTimeLeft = _captureTimeLeft - 3;

  while {flagInCapZone && !phx_gameEnd} do {
    if (_captureTimeLeft <= 0) then {
      phx_gameEnd = true;
      ["Attackers have successfully held the flag.\nAttackers wins!"] remoteExec ["hint"];
      sleep 15;
      "end1" call bis_fnc_endMissionServer;
    };
    _captureTimeDisplay = format ["Capture time remaining: %1", [_captureTimeLeft, "MM:SS"] call BIS_fnc_secondsToString];
    [_captureTimeDisplay] remoteExec ["hintSilent"];

    _captureTimeLeft = _captureTimeLeft - 1;

    sleep 1;
  };
};
