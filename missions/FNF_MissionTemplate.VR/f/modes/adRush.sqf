//Make sure game is set correctly
if (isNil "defendingSide") exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to choose a defending side."};
if (isNil "attackingSide") exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to choose an attacking side."};
if (defendingSide isEqualTo attackingSide) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You cannot set the same side to attack and defend."};
if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east) && !(defendingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! The defending side is not a valid side. east/west/independent"};
if (!(attackingSide isEqualTo west) && !(attackingSide isEqualTo east) && !(attackingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! The attacking side is not a valid side. east/west/independent"};
if (count objectives < 3) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to create 3 terminal objectives"};

//Init vars
objectivesCount = count objectives;
term1 allowDamage false;
term2 allowDamage false;
term3 allowDamage false;

//Tasks and markers
_obj1Mark = createMarker ["term1Mark",getPos term1];
_obj2Mark = createMarker ["term2Mark",getPos term2];
_obj3Mark = createMarker ["term3Mark",getPos term3];

_obj1Mark setMarkerType "mil_box";
_obj2Mark setMarkerType "mil_box";
_obj3Mark setMarkerType "mil_box";

_obj1Mark setMarkerText "Terminal 1 - Active";
_obj2Mark setMarkerText "Terminal 2 - Inactive";
_obj3Mark setMarkerText "Terminal 3 - Inactive";

[defendingSide,"defendTask1",["","Defend Terminal 1",_obj1Mark],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
[attackingSide,"attackTask1",["","Hack Terminal 1",_obj1Mark],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

//Hack vars
term1Time = objectives select 0 select 1;
term2Time = objectives select 1 select 1;
term3Time = objectives select 2 select 1;
term1Hacked = false;
publicVariable "term1Hacked";
term2Hacked = false;
publicVariable "term2Hacked";
term3Hacked = false;
publicVariable "term3Hacked";

//Hack Actions 1
term1Hacking = false;
publicVariable "term1Hacking";
//Attack action 1
[
  term1,
  "Start Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (side player == attackingSide) && !term1Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
    [term1,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term1Hacking = true;
    publicVariable "term1Hacking";
    ["Terminal 1 hack started!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  5,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", attackingSide, true];

//Defend action 1
[
  term1,
  "Stop Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (side player == defendingSide) && term1Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
    [term1,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term1Hacking = false;
    publicVariable "term1Hacking";
    ["Terminal 1 hack paused!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  2,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", defendingSide, true];

//Hack Actions 2
term2Hacking = false;
publicVariable "term2Hacking";
//Attack action 2
[
  term2,
  "Start Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (side player == attackingSide) && !term2Hacking && term1Hacked",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
    [term2,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term2Hacking = true;
    publicVariable "term2Hacking";
    ["Terminal 2 hack started!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  5,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", attackingSide, true];

//Defend action 2
[
  term2,
  "Stop Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (side player == defendingSide) && term2Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
    [term2,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term2Hacking = false;
    publicVariable "term2Hacking";
    ["Terminal 2 hack paused!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  2,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", defendingSide, true];

//Hack Actions 3
term3Hacking = false;
publicVariable "term3Hacking";
//Attack action 3
[
  term3,
  "Start Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (side player == attackingSide) && !term3Hacking && term2Hacked",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
    [term3,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term3Hacking = true;
    publicVariable "term3Hacking";
    ["Terminal 3 hack started!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  5,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", attackingSide, true];

//Defend action 3
[
  term3,
  "Stop Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (side player == defendingSide) && term3Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
    [term3,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term3Hacking = false;
    publicVariable "term3Hacking";
    ["Terminal 3 hack paused!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  2,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", defendingSide, true];

terminalHacked = {
  params["_term","_termMark","_defendTask","_attackTask","_termHacked"];

  [_term,["bomb_alarm", 100, 1]] remoteExec ["say3D",0,false];

  sleep 12;

  "Bo_GBU12_LGB" createVehicle (getposATL _term);
  deleteVehicle _term;
  deleteMarker _termMark;
  [_defendTask,"FAILED"] call BIS_fnc_taskSetState;
  [_attackTask,"SUCCEEDED"] call BIS_fnc_taskSetState;

  switch (_termHacked) do {
    case "term1": {
      term1Hacked = true;
      publicVariable "term1Hacked";
    };
    case "term2": {
      term2Hacked = true;
      publicVariable "term2Hacked";
    };
    case "term3": {
      term3Hacked = true;
      publicVariable "term3Hacked";
    };
  };
};

//Timers
fn_term1Time = {
    if (term1Hacked) exitWith {};
    waitUntil {term1Hacking};

    sleep 3;

    while {term1Hacking} do {
      _term1TimerText = "Terminal 1 hack timer: " + ([term1Time,"MM:SS"] call BIS_fnc_secondsToString);
      if (term1Time <= 0) then {
        _term1TimerText = "Terminal 1 hack complete";

        term1Hacking = false;
        publicVariable "term1Hacking";
        removeAllActions term1;
        "term1Mark" setMarkerText "Terminal 1 - Hack Complete";

        [term1,"term1Mark","defendTask1","attackTask1","term1"] spawn terminalHacked;
      };
      [_term1TimerText] remoteExec ["hintSilent",0,false];
      term1Time = term1Time - 1;
      sleep 1;
    };
    [] spawn fn_term1Time;
};
[] spawn fn_term1Time;

fn_term2Time = {
    if (term2Hacked) exitWith {};
    waitUntil {term2Hacking};

    sleep 3;

    while {term2Hacking} do {
      _term2TimerText = "Terminal 2 hack timer: " + ([term2Time,"MM:SS"] call BIS_fnc_secondsToString);
      if (term2Time <= 0) then {
        _term2TimerText = "Terminal 2 hack complete";

        term2Hacking = false;
        publicVariable "term2Hacking";
        removeAllActions term2;
        "term2Mark" setMarkerText "Terminal 2 - Hack Complete";

        [term2,"term2Mark","defendTask2","attackTask2","term2"] spawn terminalHacked;
      };
      [_term2TimerText] remoteExec ["hintSilent",0,false];
      term2Time = term2Time - 1;
      sleep 1;
    };
    [] spawn fn_term2Time;
};

fn_term3Time = {
    if (term3Hacked) exitWith {};
    waitUntil {term3Hacking};

    sleep 3;

    while {term3Hacking} do {
      _term3TimerText = "Terminal 3 hack timer: " + ([term3Time,"MM:SS"] call BIS_fnc_secondsToString);
      if (term3Time <= 0) then {
        _term3TimerText = "Terminal 3 hack complete";

        term3Hacking = false;
        publicVariable "term3Hacking";
        removeAllActions term3;
        "term3Mark" setMarkerText "Terminal 3 - Hack Complete";

        [term3,"term3Mark","defendTask3","attackTask3","term3"] spawn terminalHacked;
      };
      [_term3TimerText] remoteExec ["hintSilent",0,false];
      term3Time = term3Time - 1;
      sleep 1;
    };
    [] spawn fn_term3Time;
};

waitUntil {term1Hacked};

[defendingSide,"defendTask2",["","Defend Terminal 2",_obj2Mark],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
[attackingSide,"attackTask2",["","Hack Terminal 2",_obj2Mark],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
_obj2Mark setMarkerText "Terminal 2 - Active";

[] spawn fn_term2Time;

waitUntil {term2Hacked};

[defendingSide,"defendTask3",["","Defend Terminal 3",_obj2Mark],term3,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
[attackingSide,"attackTask3",["","Hack Terminal 3",_obj2Mark],term3,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
_obj2Mark setMarkerText "Terminal 3 - Active";

[] spawn fn_term3Time;

while {!gameEnd} do {
  if (term3Hacked) then {
    sleep 3;

    [format ["All terminals have been hacked.\n%1 wins!",
    switch (attackingSide) do {
      case east: {"OPFOR"};
      case west: {"BLUFOR"};
      case independent: {"INDFOR"};
    }]] remoteExec ["hint"];

    //Send var to other scripts and clients to signal that the game has ended
    gameEnd = true;
    publicVariable "gameEnd";

    sleep 20;

    "end1" call bis_fnc_endMissionServer;
  };
  sleep 1;
};
