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
  switch (_this) do {
    case term1: {
      _mark = createMarker ["term1Mark",getPos term1];
      _mark setMarkerText "Terminal 1 - Active";
    };
    case term2: {
      _mark = createMarker ["term2Mark",getPos term2];
      _mark setMarkerText "Terminal 2 - Inactive";
    };
    case term3: {
      _mark = createMarker ["term3Mark",getPos term3];
      _mark setMarkerText "Terminal 3 - Inactive";
    };
  };

  _mark setMarkerType "mil_dot";
};

{_x call _termMarkSetup; [_x] call phx_fnc_objBuildingDamage;} forEach _terminals;

_terminalHackComplete = {
  _term = _this select 0;
  _defendTask = _this select 1;
  _attackTask = _this select 2;
  _mark = _this select 3;

  _term remoteExec ["removeAllActions"];
  _mark setMarkerText "Terminal - Hack Complete";
  [_defendTask,"FAILED"] call BIS_fnc_taskSetState;
  [_attackTask,"SUCCEEDED"] call BIS_fnc_taskSetState;
  [_term,["bomb_alarm", 100, 1]] remoteExec ["say3D",0,false];

  uiSleep 12;

  "Bo_GBU12_LGB" createVehicle (getposATL _term);
  deleteVehicle _term;
  [_mark] remoteExec ["deleteMarkerLocal",0,true];
};

_terminalHacking = {
  _term = _this select 0;
  _timer = _this select 1;
  _termTimeText = "";

  switch (_term) do {
    case term1: {
      while {_timer > 0 && phx_term1Hacking} do {
        _termTimeText = "Terminal 1 hack timer: " + ([_timer,"MM:SS"] call BIS_fnc_secondsToString);
        _termTimeText remoteExec ["hintSilent",0,false];
        uiSleep 1;
        if (phx_term1Hacking) then {
          _timer = _timer - 1;
        };
      };
    };
    case term2: {
      while {_timer > 0 && phx_term2Hacking} do {
        _termTimeText = "Terminal 2 hack timer: " + ([_timer,"MM:SS"] call BIS_fnc_secondsToString);
        _termTimeText remoteExec ["hintSilent",0,false];
        uiSleep 1;
        if (phx_term2Hacking) then {
          _timer = _timer - 1;
        };
      };
    };
    case term3: {
      while {_timer > 0 && phx_term3Hacking} do {
        _termTimeText = "Terminal 3 hack timer: " + ([_timer,"MM:SS"] call BIS_fnc_secondsToString);
        _termTimeText remoteExec ["hintSilent",0,false];
        uiSleep 1;
        if (phx_term3Hacking) then {
          _timer = _timer - 1;
        };
      };
    };
  };

  if (_timer <= 0) then {
    _termTimeText = "Terminal hack complete";
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

      format ["%1 hack started!", _message] remoteExec ["hintSilent", 0];
      [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
    case false: {
      switch (_term) do {
        case term1: {missionNamespace setVariable ["phx_term1Hacking", false, true];};
        case term2: {missionNamespace setVariable ["phx_term2Hacking", false, true];};
        case term3: {missionNamespace setVariable ["phx_term3Hacking", false, true];};
      };

      format ["%1 hack stopped!", _message] remoteExec ["hintSilent", 0];
      [_term,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
  };
};

_win = {
  [format ["All terminals have been hacked.\n%1 wins!",
  switch (phx_attackingSide) do {
    case east: {"OPFOR"};
    case west: {"BLUFOR"};
    case independent: {"INDFOR"};
  }]] remoteExec ["hint"];

  //Send var to other scripts and clients to signal that the game has ended
  missionNamespace setVariable ["phx_gameEnd", true, true];
  uiSleep 20;
  "end1" call bis_fnc_endMissionServer;
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
