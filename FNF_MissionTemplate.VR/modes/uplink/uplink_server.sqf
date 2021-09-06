#include "..\..\mode_config\uplink.sqf"

//Init vars
_hackedObjectives = 0;
_term1Counted = false;
_term2Counted = false;
_term3Counted = false;
phx_term1Hacking = false;
phx_term2Hacking = false;
phx_term3Hacking = false;

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

_termMarkSetup = {
  _mark = "";
  _markColor = switch (phx_defendingSide) do {
      case east: {"ColorEAST"};
      case west: {"ColorWEST"};
      case independent: {"ColorGUER"};
      default {"ColorCIV"};
    };
  switch (_this) do {
    case term1: {
      _mark = createMarker ["term1Mark",getPos term1];
      _mark setMarkerText "Terminal 1";
      _mark setMarkerColor _markColor;
    };
    case term2: {
      _mark = createMarker ["term2Mark",getPos term2];
      _mark setMarkerText "Terminal 2";
      _mark setMarkerColor _markColor;
    };
    case term3: {
      _mark = createMarker ["term3Mark",getPos term3];
      _mark setMarkerText "Terminal 3";
      _mark setMarkerColor _markColor;
    };
  };

  _mark setMarkerType "mil_dot";
};

_termTaskSetup = {
  _term = _this select 0;
  _side = _this select 1;
  _taskID = _this select 2;
  _time = 0;
  _title = "";
  _mark = "";

  switch (_term) do {
    case term1: {_time = phx_term1Time; _mark = "term1Mark"};
    case term2: {_time = phx_term2Time; _mark = "term2Mark"};
    case term3: {_time = phx_term3Time; _mark = "term3Mark"};
  };

  switch (_side) do {
    case phx_attackingSide: {_title = "Hack the data terminal"};
    case phx_defendingSide: {_title = "Defend the data terminal"};
  };

  [_side,_taskID,[format ["%1 second hack time",_time],_title,_mark],_term,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
};

switch (_numberOfTerminals) do {
  case 1: {
    term1 call _termMarkSetup;
    {deleteVehicle _x} forEach [term2,term3];

    [term1, phx_attackingSide, "attackTask1"] call _termTaskSetup;
    [term1, phx_defendingSide, "defendTask1"] call _termTaskSetup;
  };
  case 2: {
    {_x call _termMarkSetup;} forEach [term1,term2];
    deleteVehicle term3;

    [term1, phx_attackingSide, "attackTask1"] call _termTaskSetup;
    [term1, phx_defendingSide, "defendTask1"] call _termTaskSetup;
    [term2, phx_attackingSide, "attackTask2"] call _termTaskSetup;
    [term2, phx_defendingSide, "defendTask2"] call _termTaskSetup;
  };
  case 3: {
    {_x call _termMarkSetup;} forEach [term1,term2,term3];

    [term1, phx_attackingSide, "attackTask1"] call _termTaskSetup;
    [term1, phx_defendingSide, "defendTask1"] call _termTaskSetup;
    [term2, phx_attackingSide, "attackTask2"] call _termTaskSetup;
    [term2, phx_defendingSide, "defendTask2"] call _termTaskSetup;
    [term3, phx_attackingSide, "attackTask3"] call _termTaskSetup;
    [term3, phx_defendingSide, "defendTask3"] call _termTaskSetup;
  };
  default {
    hint "Terminal number not set correctly";
  };
};

_hackComplete = {
  _term = _this;

  _term remoteExec ["removeAllActions", 0, false];

  switch (_term) do {
    case term1: {
      phx_term1Hacking = false;
      phx_term1Time = 99;
      ["defendTask1", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      "term1Mark" remoteExec ["deleteMarkerLocal",0,true];
    };
    case term2: {
      phx_term2Hacking = false;
      phx_term2Time = 99;
      ["defendTask2", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask2", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      "term2Mark" remoteExec ["deleteMarkerLocal",0,true];
    };
    case term3: {
      phx_term3Hacking = false;
      phx_term3Time = 99;
      ["defendTask3", "FAILED", true] call BIS_fnc_taskSetState;
      ["attackTask3", "SUCCEEDED", true] call BIS_fnc_taskSetState;
      "term3Mark" remoteExec ["deleteMarkerLocal",0,true];
    };
  };

  playSound3D [getMissionPath "description\sound\bomb_alarm.ogg", _term, false, getposasl _term, 1, 1, 250];

  uiSleep 12;

  "Bo_GBU12_LGB" createVehicle (getposATL _term);
  deleteVehicle _term;
};

phx_serverTerminalAction = {
  _term = _this select 0;
  _hacking = _this select 1;
  _message = "";

  switch (_term) do {
    case term1: {_message = "Terminal 1"};
    case term2: {_message = "Terminal 2"};
    case term3: {_message = "Terminal 3"};
  };

  switch (_hacking) do {
    case true: {
      [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
      switch (_term) do {
        case term1: {
          missionNamespace setVariable ["phx_term1Hacking", true, true];
        };
        case term2: {
          missionNamespace setVariable ["phx_term2Hacking", true, true];
        };
        case term3: {
          missionNamespace setVariable ["phx_term3Hacking", true, true];
        };
      };
      format ["%1 hack started!", _message] remoteExec ["hintSilent", 0];
    };
    case false: {
      [_term,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
      switch (_term) do {
        case term1: {
          missionNamespace setVariable ["phx_term1Hacking", false, true];
        };
        case term2: {
          missionNamespace setVariable ["phx_term2Hacking", false, true];
        };
        case term3: {
          missionNamespace setVariable ["phx_term3Hacking", false, true];
        };
      };
      format ["%1 hack paused!", _message] remoteExec ["hintSilent", 0];
    };
  };
};

waitUntil {phx_term1Hacking || phx_term2Hacking || phx_term3Hacking};

sleep 3;

while {!phx_gameEnd} do {
  _hackString = "";

  if (phx_term1Hacking || phx_term2Hacking || phx_term3Hacking) then {
    if (phx_term1Hacking) then {
      if (phx_term1Time > 0) then {
        phx_term1Time = phx_term1Time - 1;
        _hackString = _hackString + "Terminal 1 time remaining: " + ([phx_term1Time, "MM:SS"] call BIS_fnc_secondsToString) + "\n";
      } else {
        _hackString = _hackString + "Terminal 1 hack complete" + "\n";
      };
    };
    if (phx_term2Hacking) then {
      phx_term2Time = phx_term2Time - 1;
      if (phx_term2Time > 0) then {
        _hackString = _hackString + "Terminal 2 time remaining: " + ([phx_term2Time, "MM:SS"] call BIS_fnc_secondsToString) + "\n";
      } else {
        _hackString = _hackString + "Terminal 2 hack complete" + "\n";
      };
    };
    if (phx_term3Hacking) then {
      phx_term3Time = phx_term3Time - 1;
      if (phx_term3Time > 0) then {
        _hackString = _hackString + "Terminal 3 time remaining: " + ([phx_term3Time, "MM:SS"] call BIS_fnc_secondsToString) + "\n";
      } else {
        _hackString = _hackString + "Terminal 3 hack complete";
      };
    };
  };

  if !(_hackString isEqualTo "") then {
    _hackString remoteExec ["hintSilent", 0, false];
  };

  if (phx_term1Hacking) then {
    if ((phx_term1Time % 5 == 0 || phx_term1Time <= 10) && phx_term1Time > 0) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term1, false, getposasl term1, 0.6, 1, 175];
    };
  };
  if (phx_term2Hacking) then {
    if ((phx_term2Time % 5 == 0 || phx_term2Time <= 10) && phx_term2Time > 0) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term2, false, getposasl term2, 0.6, 1, 175];
    };
  };
  if (phx_term3Hacking) then {
    if ((phx_term3Time % 5 == 0 || phx_term3Time <= 10) && phx_term3Time > 0) then {
      playSound3D ["A3\Sounds_F\sfx\alarm.wss", term3, false, getposasl term3, 0.6, 1, 175];
    };
  };

  if (phx_term1Time <= 0) then {_hackedObjectives = _hackedObjectives + 1; term1 spawn _hackComplete};
  if (phx_term2Time <= 0) then {_hackedObjectives = _hackedObjectives + 1; term2 spawn _hackComplete};
  if (phx_term3Time <= 0) then {_hackedObjectives = _hackedObjectives + 1; term3 spawn _hackComplete};

  uiSleep 1;

  if (_hackedObjectives >= _numberOfTerminals) then {
    uiSleep 13;

    phx_gameEnd = true;
    publicVariable "phx_gameEnd";

    [phx_attackingSide, "has successfully hacked all objectives and won!"] spawn phx_fnc_gameEnd;
  };
};
