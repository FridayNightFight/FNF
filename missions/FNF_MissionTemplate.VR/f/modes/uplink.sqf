//Make sure game is set correctly
if (isNil "defendingSide") exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to choose a defending side."};
if (isNil "attackingSide") exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to choose an attacking side."};
if (defendingSide isEqualTo attackingSide) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You cannot set the same side to attack and defend."};
if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east) && !(defendingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! The defending side is not a valid side. east/west/independent"};
if (!(attackingSide isEqualTo west) && !(attackingSide isEqualTo east) && !(attackingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! The attacking side is not a valid side. east/west/independent"};
if (count objectives < 1) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to create at least one objective."};

numObjs = objectives select 0;
_hackTime = objectives select 1;

//Init vars
hackedObjectives = 0;
term1Counted = false;
term2Counted = false;
term1Hacking = false;
term2Hacking = false;
publicVariable "term1Hacking";
publicVariable "term2Hacking";
term1Time = _hackTime;
term2Time = _hackTime;

//Delete term2 if mission makers only selected 1
switch (numObjs) do {
  case 1: {
    "term1Mark" setMarkerPos (getPos term1);
    deleteVehicle term2;
    deleteMarker "term2Mark";
  };
  case 2: {
    "term1Mark" setMarkerPos (getPos term1);
    "term2Mark" setMarkerPos (getPos term2);
  };
};

//Tasks and task handlers
switch (numObjs) do {
  case 1: {
    [defendingSide,"defendTask1",[format ["%1 second hack time",objectives select 1],"Defend the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [attackingSide,"attackTask1",[format ["%1 second hack time",objectives select 1],"Hack the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    [] spawn {
      waitUntil {isNull term1};
      ["defendTask1", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      deleteMarker term1Mark;
    };
  };
  case 2: {
    [defendingSide,"defendTask1",[format ["%1 second hack time",objectives select 1],"Defend the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [attackingSide,"attackTask1",[format ["%1 second hack time",objectives select 1],"Hack the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    [defendingSide,"defendTask2",[format ["%1 second hack time",objectives select 1],"Defend the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [attackingSide,"attackTask2",[format ["%1 second hack time",objectives select 1],"Hack the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    //Wait until the terminals are hacked, then set the tasks to their appropriate states
    [] spawn {
      waitUntil {isNull term1};
      ["defendTask1", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      deleteMarker "term1Mark";
    };
    [] spawn {
      waitUntil {isNull term2};
      ["defendTask2", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask2", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      deleteMarker "term2Mark";
    };
  };
};

//Terminal actions
//Terminal 1 hack action
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
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

//Terminal 2 hack action
if !(isNull term2) then {
  [
    term2,
    "Start Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == attackingSide) && !term2Hacking",
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
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};

//Terminal 1 stop hack action
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
  1,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

//Terminal 2 stop hack action
if !(isNull term2) then {[
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
    ["Terminal  hack paused!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  1,
  0,
  false,
  false
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};

hacking = {
  waitUntil {term1Hacking || term2Hacking};

  sleep 3;

  if (term1Hacking) then {
    term1Time = term1Time - 3;
  };
  if (term2Hacking) then {
    term2Time = term2Time - 3;
  };

  while {(term1Hacking || term2Hacking) && !gameEnd} do {
    if (term1Hacking) then {
      if (term1Time <= 0) then {
        term1HackTimer = "Terminal 1 hack complete";
        term1Time = 0;
      } else {
        term1HackTimer = format ["Terminal 1 hack time remaining: %1", [term1Time, "MM:SS"] call BIS_fnc_secondsToString];
      };
    };

    if (term2Hacking) then {
      if (term2Time <= 0) then {
        term2HackTimer = "Terminal 2 hack complete";
        term2Time = 0;
      } else {
        term2HackTimer = format ["Terminal 2 hack time remaining: %1", [term2Time, "MM:SS"] call BIS_fnc_secondsToString];
      };
    };

    if (term1Hacking && !term2Hacking) then {
      [term1HackTimer] remoteExec ["hintSilent"];
    } else {
      if (term2Hacking && !term1Hacking) then {
        [term2HackTimer] remoteExec ["hintSilent"];
      } else {
        if (term1Hacking && term2Hacking) then {
          [term1HackTimer + "\n" + term2HackTimer] remoteExec ["hintSilent"];
        };
      };
    };

    sleep 1;

    if (term1Hacking) then {
      term1Time = term1Time - 1;
    };
    if (term2Hacking) then {
      term2Time = term2Time - 1;
    };
  };
  [] spawn hacking;
};

handleBomb = {
  params["_term"];

  [_term,["bomb_alarm", 100, 1]] remoteExec ["say3D",0,false];

  sleep 12;

  "Bo_GBU12_LGB" createVehicle (getposATL _term);
  deleteVehicle _term;
};

[] spawn {
  while {!gameEnd} do {
    if (term1Hacking) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term1];
    };
    if (term2Hacking) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term2];
    };
    sleep 2;
  };
};

checkEnd = {
  while {!gameEnd} do {
    if (term1Time <= 0 && !term1Counted) then {
      term1Hacking = false;
      hackedObjectives = hackedObjectives + 1;
      term1Counted = true;
      [term1] spawn handleBomb;
    };
    if (term2Time <= 0 && !term2Counted) then {
      term2Hacking = false;
      hackedObjectives = hackedObjectives + 1;
      term2Counted = true;
      [term2] spawn handleBomb;
    };
    if (hackedObjectives >= numObjs) then {
      sleep 12;
      [format ["All objectives have been hacked.\n%1 wins!",
      switch (attackingSide) do {
        case east: {"OPFOR"};
        case west: {"BLUFOR"};
        case independent: {"INDFOR"};
      }]] remoteExec ["hint"];

      gameEnd = true;
      publicVariable "gameEnd";

      sleep 20;

      "end1" call bis_fnc_endMissionServer;
    };
    sleep 2;
  };
};

[] spawn hacking;
[] spawn checkEnd;
