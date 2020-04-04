#include "..\..\modeConfigs\uplink.sqf"

//Init vars
_hackedObjectives = 0;
_term1Counted = false;
_term2Counted = false;
_term3Counted = false;
phx_term1Hacking = false;
phx_term2Hacking = false;
phx_term3Hacking = false;
publicVariable "phx_term1Hacking";
publicVariable "phx_term2Hacking";
publicVariable "phx_term3Hacking";

switch (typeName _terminalHackTime) do {
  case "ARRAY": {
    phx_term1Time = _terminalHackTime select 0;
    if !(isNil {_terminalHackTime select 1}) then {
      phx_term2Time = _terminalHackTime select 1;
    };
    if !(isNil {_terminalHackTime select 2}) then {
      phx_term3Time = _terminalHackTime select 2;
    };
  };
  case "SCALAR": {
    phx_term1Time = _terminalHackTime;
    phx_term2Time = _terminalHackTime;
    phx_term3Time = _terminalHackTime;
  };
  default {
    hint "Terminal hack timer not set correctly.";
  };
};

switch (_numberOfTerminals) do {
  case 1: {
    _obj1Mark = createMarker ["term1Mark",getPos term1];
    "term1Mark" setMarkerPos (getPos term1);
    "term1Mark" setMarkerType "mil_dot";
    "term1Mark" setMarkerText "Terminal 1";
    deleteVehicle term2;
    deleteVehicle term3;
  };
  case 2: {
    _obj1Mark = createMarker ["term1Mark",getPos term1];
    _obj2Mark = createMarker ["term2Mark",getPos term2];
    "term1Mark" setMarkerPos (getPos term1);
    "term1Mark" setMarkerType "mil_dot";
    "term1Mark" setMarkerText "Terminal 1";
    "term2Mark" setMarkerPos (getPos term2);
    "term2Mark" setMarkerType "mil_dot";
    "term2Mark" setMarkerText "Terminal 2";
    deleteVehicle term3;
  };
  case 3: {
    _obj1Mark = createMarker ["term1Mark",getPos term1];
    _obj2Mark = createMarker ["term2Mark",getPos term2];
    _obj3Mark = createMarker ["term3Mark",getPos term3];
    "term1Mark" setMarkerPos (getPos term1);
    "term1Mark" setMarkerType "mil_dot";
    "term1Mark" setMarkerText "Terminal 1";
    "term2Mark" setMarkerPos (getPos term2);
    "term2Mark" setMarkerType "mil_dot";
    "term2Mark" setMarkerText "Terminal 2";
    "term3Mark" setMarkerPos (getPos term3);
    "term3Mark" setMarkerType "mil_dot";
    "term3Mark" setMarkerText "Terminal 3";
  };
  default {
    hint "Terminal number not set correctly."
  };
};

//Tasks and task handlers
switch (_numberOfTerminals) do {
  case 1: {
    [phx_defendingSide,"defendTask1",[format ["%1 second hack time",phx_term1Time],"Defend the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide,"attackTask1",[format ["%1 second hack time",phx_term1Time],"Hack the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    [] spawn {
      waitUntil {isNull term1};
      ["defendTask1", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      ["term1Mark"] remoteExec ["deleteMarkerLocal",0,true];
    };
  };
  case 2: {
    [phx_defendingSide,"defendTask1",[format ["%1 second hack time",phx_term1Time],"Defend the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide,"attackTask1",[format ["%1 second hack time",phx_term1Time],"Hack the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    [phx_defendingSide,"defendTask2",[format ["%1 second hack time",phx_term2Time],"Defend the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide,"attackTask2",[format ["%1 second hack time",phx_term2Time],"Hack the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    //Wait until the terminals are hacked, then set the tasks to their appropriate states
    [] spawn {
      waitUntil {isNull term1};
      ["defendTask1", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      ["term1Mark"] remoteExec ["deleteMarkerLocal",0,true];
    };
    [] spawn {
      waitUntil {isNull term2};
      ["defendTask2", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask2", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      ["term2Mark"] remoteExec ["deleteMarkerLocal",0,true];
    };
  };
  case 3: {
    [phx_defendingSide,"defendTask1",[format ["%1 second hack time",phx_term1Time],"Defend the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide,"attackTask1",[format ["%1 second hack time",phx_term1Time],"Hack the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    [phx_defendingSide,"defendTask2",[format ["%1 second hack time",phx_term2Time],"Defend the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide,"attackTask2",[format ["%1 second hack time",phx_term2Time],"Hack the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    [phx_defendingSide,"defendTask3",[format ["%1 second hack time",phx_term3Time],"Defend the data terminal","term3Mark"],term3,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide,"attackTask3",[format ["%1 second hack time",phx_term3Time],"Hack the data terminal","term3Mark"],term3,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

    //Wait until the terminals are hacked, then set the tasks to their appropriate states
    [] spawn {
      waitUntil {isNull term1};
      ["defendTask1", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      ["term1Mark"] remoteExec ["deleteMarkerLocal",0,true];
    };
    [] spawn {
      waitUntil {isNull term2};
      ["defendTask2", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask2", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      ["term2Mark"] remoteExec ["deleteMarkerLocal",0,true];
    };
    [] spawn {
      waitUntil {isNull term3};
      ["defendTask3", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask3", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      ["term3Mark"] remoteExec ["deleteMarkerLocal",0,true];
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
  "(_this distance _target < 3) && (playerSide == phx_attackingSide) && !phx_term1Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
    [term1,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    phx_term1Hacking = true;
    publicVariable "phx_term1Hacking";
    ["Terminal 1 hack started!"] remoteExec ["hintSilent", 0];
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
    "(_this distance _target < 3) && (playerSide == phx_attackingSide) && !phx_term2Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
      [term2,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
      phx_term2Hacking = true;
      publicVariable "phx_term2Hacking";
      ["Terminal 2 hack started!"] remoteExec ["hintSilent", 0];
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    5,
    0,
    false,
    false
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};

//Terminal 3 hack action
if !(isNull term3) then {
  [
    term3,
    "Start Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (playerSide == phx_attackingSide) && !phx_term3Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
      [term3,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
      phx_term3Hacking = true;
      publicVariable "phx_term3Hacking";
      ["Terminal 3 hack started!"] remoteExec ["hintSilent", 0];
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
  "(_this distance _target < 3) && (playerSide == phx_defendingSide) && phx_term1Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
    [term1,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    phx_term1Hacking = false;
    publicVariable "phx_term1Hacking";
    ["Terminal 1 hack paused!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
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
  "(_this distance _target < 3) && (playerSide == phx_defendingSide) && phx_term2Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
    [term2,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    phx_term2Hacking = false;
    publicVariable "phx_term2Hacking";
    ["Terminal 2 hack paused!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  1,
  0,
  false,
  false
  ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
};

//Terminal 3 stop hack action
if !(isNull term3) then {[
  term3,
  "Stop Hack",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && (playerSide == phx_defendingSide) && phx_term3Hacking",
  "_caller distance _target < 3",
  {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
    [term3,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    phx_term3Hacking = false;
    publicVariable "phx_term3Hacking";
    ["Terminal 3 hack paused!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
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
  waitUntil {phx_term1Hacking || phx_term2Hacking || phx_term3Hacking};

  sleep 3;

  if (phx_term1Hacking) then {
    phx_term1Time = phx_term1Time - 3;
  };
  if (phx_term2Hacking) then {
    phx_term2Time = phx_term2Time - 3;
  };
  if (phx_term3Hacking) then {
    phx_term3Time = phx_term3Time - 3;
  };

  while {(phx_term1Hacking || phx_term2Hacking || phx_term3Hacking) && !phx_gameEnd} do {
    if (phx_term1Hacking) then {
      if (phx_term1Time <= 0) then {
        term1HackTimer = "Terminal 1 hack complete";
        phx_term1Time = 0;
      } else {
        term1HackTimer = format ["Terminal 1 hack time remaining: %1", [phx_term1Time, "MM:SS"] call BIS_fnc_secondsToString];
      };
    };

    if (phx_term2Hacking) then {
      if (phx_term2Time <= 0) then {
        term2HackTimer = "Terminal 2 hack complete";
        phx_term2Time = 0;
      } else {
        term2HackTimer = format ["Terminal 2 hack time remaining: %1", [phx_term2Time, "MM:SS"] call BIS_fnc_secondsToString];
      };
    };

    if (phx_term3Hacking) then {
      if (phx_term3Time <= 0) then {
        term3HackTimer = "Terminal 3 hack complete";
        phx_term3Time = 0;
      } else {
        term3HackTimer = format ["Terminal 3 hack time remaining: %1", [phx_term3Time, "MM:SS"] call BIS_fnc_secondsToString];
      };
    };

    _phx_hackString = "";

    if (phx_term1Hacking && !phx_term2Hacking && !phx_term3Hacking) then {
      _phx_hackString = _phx_hackString + term1HackTimer;
    } else {
      if (phx_term1Hacking) then {
        _phx_hackString = _phx_hackString + term1HackTimer + "\n";
      };
    };

    if (phx_term2Hacking && !phx_term1Hacking && !phx_term3Hacking) then {
      _phx_hackString = _phx_hackString + term2HackTimer;
    } else {
      if (phx_term2Hacking && phx_term3Hacking) then {
        _phx_hackString = _phx_hackString + term2HackTimer + "\n";
      } else {
        if (phx_term2Hacking) then {
          _phx_hackString = _phx_hackString + term2HackTimer;
        };
      };
    };

    if (phx_term3Hacking && !phx_term1Hacking && !phx_term2Hacking) then {
      _phx_hackString = _phx_hackString + term3HackTimer;
    } else {
      if (phx_term3Hacking) then {
        _phx_hackString = _phx_hackString + term3HackTimer;
      };
    };

    [_phx_hackString] remoteExec ["hintSilent"];

    sleep 1;

    if (phx_term1Hacking) then {
      phx_term1Time = phx_term1Time - 1;
    };
    if (phx_term2Hacking) then {
      phx_term2Time = phx_term2Time - 1;
    };
    if (phx_term3Hacking) then {
      phx_term3Time = phx_term3Time - 1;
    };
  };
  [] spawn hacking;
};

handleBomb = {
  params["_term"];

  _term remoteExec ["removeAllActions"];
  [_term,["bomb_alarm", 100, 1]] remoteExec ["say3D",0,false];

  sleep 12;

  switch (_term) do {
    case term1: {phx_term1Hacking = false};
    case term2: {phx_term2Hacking = false};
    case term3: {phx_term3Hacking = false};
  };

  "Bo_GBU12_LGB" createVehicle (getposATL _term);
  deleteVehicle _term;
};

[] spawn {
  while {!phx_gameEnd} do {
    if (phx_term1Hacking && phx_term1Time > 0) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term1];
    };
    if (phx_term2Hacking && phx_term2Time > 0) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term2];
    };
    if (phx_term3Hacking && phx_term3Time > 0) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term3];
    };
    sleep 2;
  };
};

[] spawn hacking;

while {!phx_gameEnd} do {
  if (phx_term1Time <= 0 && !_term1Counted) then {
    _hackedObjectives = _hackedObjectives + 1;
    _term1Counted = true;
    [term1] spawn handleBomb;
  };
  if (phx_term2Time <= 0 && !_term2Counted) then {
    _hackedObjectives = _hackedObjectives + 1;
    _term2Counted = true;
    [term2] spawn handleBomb;
  };
  if (phx_term3Time <= 0 && !_term3Counted) then {
    _hackedObjectives = _hackedObjectives + 1;
    _term3Counted = true;
    [term3] spawn handleBomb;
  };
  if (_hackedObjectives >= _numberOfTerminals) then {
    sleep 12;
    [format ["All objectives have been hacked.\n%1 wins!",
    switch (phx_attackingSide) do {
      case east: {"OPFOR"};
      case west: {"BLUFOR"};
      case independent: {"INDFOR"};
    }]] remoteExec ["hint"];

    phx_gameEnd = true;
    publicVariable "phx_gameEnd";

    sleep 20;

    "end1" call bis_fnc_endMissionServer;
  };
  sleep 2;
};
