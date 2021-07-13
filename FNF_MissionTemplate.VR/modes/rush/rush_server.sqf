//Only run server-side
if (!isServer) exitWith {};

#include "..\..\mode_config\rush.sqf"

//Init vars
_hackedObjectives = 0;
phx_term1Hacking = false;
phx_term2Hacking = false;
phx_term3Hacking = false;
_terminals = [];

switch (_numberOfTerminals) do {
  case 2: {
    deleteVehicle term3;
    _terminals = [term1,term2];
  };
  case 3: {_terminals = [term1,term2,term3]};
  default {hint "Terminal number not set correctly"};
};

switch (typeName _terminalHackTime) do {
  case "ARRAY": {
    phx_term1Time = _terminalHackTime select 0;
    phx_term2Time = _terminalHackTime select 1;
    if (!isNull term3) then {
      phx_term3Time = _terminalHackTime select 2;
    };
  };
  case "SCALAR": {
    phx_term1Time = _terminalHackTime;
    phx_term2Time = _terminalHackTime;
    if (!isNull term3) then {phx_term3Time = _terminalHackTime};
  };
  default {
    hint "Terminal hack timer not set correctly";
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
      _mark setMarkerText "Terminal 1 - Active";
      _mark setMarkerColor _markColor;
    };
    case term2: {
      _mark = createMarker ["term2Mark",getPos term2];
      _mark setMarkerText "Terminal 2 - Inactive";
      _mark setMarkerColor _markColor;
    };
    case term3: {
      _mark = createMarker ["term3Mark",getPos term3];
      _mark setMarkerText "Terminal 3 - Inactive";
      _mark setMarkerColor _markColor;
    };
  };

  _mark setMarkerType "mil_dot";
};

{_x call _termMarkSetup;} forEach _terminals;

_terminalHackComplete = {
  _term = _this select 0;
  _defendTask = _this select 1;
  _attackTask = _this select 2;
  _mark = _this select 3;

  _term remoteExec ["removeAllActions"];
  _mark setMarkerText "Terminal - Hack Complete";
  [_defendTask,"FAILED"] call BIS_fnc_taskSetState;
  [_attackTask,"SUCCEEDED"] call BIS_fnc_taskSetState;

  playSound3D [getMissionPath "description\sound\bomb_alarm.ogg", _term, false, getposasl _term, 1, 1, 250];

  uiSleep 12;

  "Bo_GBU12_LGB" createVehicle (getposATL _term);
  deleteVehicle _term;
  [_mark] remoteExec ["deleteMarkerLocal",0,true];
};

_terminalHacking = {
  private _term = _this select 0;
  private _timer = _this select 1;
  private _termTimeText = "";

  switch (_term) do {
    case term1: {
      while {phx_term1Time > 0 && phx_term1Hacking} do {
        if (phx_term1Time % 5 == 0 || phx_term1Time <= 10) then {
          _termTimeText = "Terminal 1 hack timer: " + ([phx_term1Time,"MM:SS"] call BIS_fnc_secondsToString);
          _termTimeText remoteExec ["hintSilent",0,false];
          playSound3D ["A3\Sounds_F\sfx\alarm.wss", term1, false, getposasl term1, 0.6, 1, 175];
        };
        uiSleep 1;
        if (phx_term1Hacking) then {
          phx_term1Time = phx_term1Time - 1;
          _timer = phx_term1Time;
        };
      };
    };
    case term2: {
      while {phx_term2Time > 0 && phx_term2Hacking} do {
        if (phx_term2Time % 5 == 0 || phx_term2Time <= 10) then {
          _termTimeText = "Terminal 2 hack timer: " + ([phx_term2Time,"MM:SS"] call BIS_fnc_secondsToString);
          _termTimeText remoteExec ["hintSilent",0,false];
          playSound3D ["A3\Sounds_F\sfx\alarm.wss", term2, false, getposasl term2, 0.6, 1, 175];
        };
        uiSleep 1;
        if (phx_term2Hacking) then {
          phx_term2Time = phx_term2Time - 1;
          _timer = phx_term2Time;
        };
      };
    };
    case term3: {
      while {phx_term3Time > 0 && phx_term3Hacking} do {
        if (phx_term3Time % 5 == 0 || phx_term3Time <= 10) then {
          _termTimeText = "Terminal 3 hack timer: " + ([phx_term3Time,"MM:SS"] call BIS_fnc_secondsToString);
          _termTimeText remoteExec ["hintSilent",0,false];
          playSound3D ["A3\Sounds_F\sfx\alarm.wss", term3, false, getposasl term3, 0.6, 1, 175];
        };
        uiSleep 1;
        if (phx_term3Hacking) then {
          phx_term3Time = phx_term3Time - 1;
          _timer = phx_term3Time;
        };
      };
    };
  };

  if (_timer <= 0) then {
    _termTimeText = format ["Terminal %1 hack complete",[str _term, 4, 4] call BIS_fnc_trimString];
    _termTimeText remoteExec ["hintSilent",0,false];
    switch (_term) do {
      case term1: {[_term, "defendTask1", "attackTask1", "term1Mark"] spawn _terminalHackComplete};
      case term2: {[_term, "defendTask2", "attackTask2", "term2Mark"] spawn _terminalHackComplete};
      case term3: {[_term, "defendTask3", "attackTask3", "term3Mark"] spawn _terminalHackComplete};
    };
  } else {
    _this call _terminalHacking;
  };
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
      switch (_term) do {
        case term1: {missionNamespace setVariable ["phx_term1Hacking", true, true];};
        case term2: {missionNamespace setVariable ["phx_term2Hacking", true, true];};
        case term3: {missionNamespace setVariable ["phx_term3Hacking", true, true];};
      };

      [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
    case false: {
      switch (_term) do {
        case term1: {missionNamespace setVariable ["phx_term1Hacking", false, true];};
        case term2: {missionNamespace setVariable ["phx_term2Hacking", false, true];};
        case term3: {missionNamespace setVariable ["phx_term3Hacking", false, true];};
      };

      [{format ["%1 hack paused!", _this] remoteExec ["hintSilent", 0]}, _message, 1] call CBA_fnc_waitAndExecute;
      [_term,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
  };
};

_win = {
  //Send var to other scripts and clients to signal that the game has ended
  phx_gameEnd = true;
  publicVariable "phx_gameEnd";

  [phx_attackingSide, "has successfully hacked all terminals and won!"] spawn phx_fnc_gameEnd;
};

[phx_defendingSide,"defendTask1",[format ["%1 second hack time",phx_term1Time],"Defend the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide,"attackTask1",[format ["%1 second hack time",phx_term1Time],"Hack the data terminal","term1Mark"],term1,"AUTOASSIGNED"] call BIS_fnc_taskCreate;

waitUntil {phx_term1Hacking};
[term1, phx_term1Time] call _terminalHacking;

sleep 1;

[phx_defendingSide,"defendTask2",[format ["%1 second hack time",phx_term2Time],"Defend the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide,"attackTask2",[format ["%1 second hack time",phx_term2Time],"Hack the data terminal","term2Mark"],term2,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
"term2Mark" setMarkerText "Terminal 2 - Active";

waitUntil {phx_term2Hacking};
[term2, phx_term2Time] call _terminalHacking;

sleep 1;

if (!isNull term3) then {
  [phx_defendingSide,"defendTask3",[format ["%1 second hack time",phx_term3Time],"Defend the data terminal","term3Mark"],term3,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
  [phx_attackingSide,"attackTask3",[format ["%1 second hack time",phx_term3Time],"Hack the data terminal","term3Mark"],term3,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
  "term3Mark" setMarkerText "Terminal 3 - Active";

  waitUntil {phx_term3Hacking};
  [term3, phx_term3Time] call _terminalHacking;

  waitUntil {isNull term3};
  call _win;
} else {
  call _win;
};
