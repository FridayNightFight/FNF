//Config lines
defendingSide = west; //east/west/independent
attackingSide = east; //east/west/independent
objectives = [[term1,"term1Mark",120,false], [term2,"term2Mark",180,false]];
/*
-variable name of the terminal (object name)
-corresponding marker name (string)
-hack time (integer)
-whether or not the exact objective location is visible to attackers (boolean), true = visible

Examples:
COMING SOON
*/
publicVariable "defendingSide";
publicVariable "attackingSide";

//Make sure game is set correctly
if (isNil "defendingSide") exitWith {systemChat "You have not configured 'adUplink.sqf' properly! You need to choose a defending side."};
if (isNil "attackingSide") exitWith {systemChat "You have not configured 'adUplink.sqf' properly! You need to choose an attacking side."};
if (defendingSide isEqualTo attackingSide) exitWith {systemChat "You have not configured 'adUplink.sqf' properly! You cannot set the same side to attack and defend."};
if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east) && !(defendingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'adUplink.sqf' properly! The defending side is not a valid side. east/west/independent"};
if (!(attackingSide isEqualTo west) && !(attackingSide isEqualTo east) && !(attackingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'adUplink.sqf' properly! The attacking side is not a valid side. east/west/independent"};
if (count objectives < 1) exitWith {systemChat "You have not configured 'adUplink.sqf' properly! You need to create at least one objective."};

//Init vars
_taskCount = 1;
hackedObjectives = 0;
term1Counted = false;
term2Counted = false;
term1Hacking = false;
term2Hacking = false;
publicVariable "term1Hacking";
publicVariable "term2Hacking";
term1Time = objectives select 0 select 2;
term2Time = objectives select 1 select 2;

//Tasks and task handlers
{
  _attackersTaskText =
  if (_x select 3) then {
    "Hack the data terminal"
  } else {
    "Search for and hack the data terminal"
  };

  _defendTaskID = "defendTask" + str _taskCount;
  _attackTaskID = "attackTask" + str _taskCount;

  [defendingSide,_defendTaskID,["","Defend the data terminal",_x select 1],_x select 0,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
  [attackingSide,_attackTaskID,["",_attackersTaskText,_x select 1],if (_x select 3) then {_x select 0} else {getMarkerPos (_x select 1)},"AUTOASSIGNED"] call BIS_fnc_taskCreate;

  [_x select 0, _x select 1, _defendTaskID, _attackTaskID] spawn {
    params ["_object","_markerName","_defendTaskID","_attackTaskID"];

    waitUntil {isNull _object};

    [_defendTaskID, "FAILED", true] call BIS_fnc_taskSetState;
    [_attackTaskID, "SUCCEEDED", true] call BIS_fnc_taskSetState;

    deleteMarker _markerName;
  };

  _taskCount = _taskCount + 1;

  _x select 0 allowDamage false;
} forEach objectives;

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
] remoteExec ["BIS_fnc_holdActionAdd", attackingSide, true];

//Terminal 2 hack action
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
] remoteExec ["BIS_fnc_holdActionAdd", attackingSide, true];

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
] remoteExec ["BIS_fnc_holdActionAdd", defendingSide, true];

//Terminal 2 stop hack action
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
    ["Terminal  hack paused!"] remoteExec ["hint"]
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  1,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", defendingSide, true];

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
    if (hackedObjectives >= count objectives) then {
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
