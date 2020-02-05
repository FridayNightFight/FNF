//Make sure game is set correctly
if (isNil "defendingSide") exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to choose a defending side."};
if (isNil "attackingSide") exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You need to choose an attacking side."};
if (defendingSide isEqualTo attackingSide) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! You cannot set the same side to attack and defend."};
if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east) && !(defendingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! The defending side is not a valid side. east/west/independent"};
if (!(attackingSide isEqualTo west) && !(attackingSide isEqualTo east) && !(attackingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'varSelection.sqf' properly! The attacking side is not a valid side. east/west/independent"};

objectives = [[cache1,"cache1Mark","weapons cache",false,false],[cache2,"cache2Mark","weapons cache",false,false]];

//Init vars
_taskCount = 1;
aliveObjectives = count objectives;

//Tasks and task handlers
{
  _attackersTaskText =
  if (_x select 3) then {
    [_x select 1] remoteExec ["deleteMarkerLocal",0,true];
    "Destroy the "
  } else {
    "Search for and destroy the "
  };

  _defendTaskID = "defendTask" + str _taskCount;
  _attackTaskID = "attackTask" + str _taskCount;

  [defendingSide,_defendTaskID,["",format ["Defend the %1",_x select 2],_x select 1],_x select 0,"CREATED"] call BIS_fnc_taskCreate;
  [attackingSide,_attackTaskID,["",format [_attackersTaskText + "%1",_x select 2],_x select 1],if (_x select 3) then {_x select 0} else {getMarkerPos (_x select 1)},"CREATED"] call BIS_fnc_taskCreate;

  [(_x select 1),0] remoteExec ["setMarkerAlphaLocal",defendingSide,true];

  //Check for alive objective
  [_x select 0, _x select 1, _defendTaskID, _attackTaskID] spawn {
    params ["_object","_markerName","_defendTaskID","_attackTaskID"];

    waitUntil {!alive _object};

    [_defendTaskID, "FAILED", true] call BIS_fnc_taskSetState;
    [_attackTaskID, "SUCCEEDED", true] call BIS_fnc_taskSetState;

    aliveObjectives = aliveObjectives - 1;
    [_markerName] remoteExec ["deleteMarkerLocal",0,true];
  };

  //Handle moving objective
  if (_x select 4 && !(_x select 3)) then {
    [_x select 0,_x select 1,_attackTaskID] spawn {
      _obj = _this select 0;
      _marker = _this select 1;
      _attackTaskID = _this select 2;
      _objMarkerUpdateTime = 30; //Change this value to however often you want the objective markers to update (seconds)
      _objMaxDistance = selectMin (getMarkerSize _marker);
      //Wait until safe start is over so attackers don't know where obj will be
      waitUntil {!phx_safeStartEnabled};
      //Loop over objective position every _objMarkerUpdateTime
      //If objective moves more than _objMaxDistance meters away from it's last known position, the objective marker will update
      while {alive _obj} do {
        if !(_obj inArea _marker) then {
          //Move the objective marker to a random position around the objective, while keeping the objective inside the marker's area
          _marker setMarkerPos ([[[position _obj,(_objMaxDistance * random [0.1,0.7,1])]],[]] call BIS_fnc_randomPos);
          [_attackTaskID, _marker] call BIS_fnc_taskSetDestination;
        };
        sleep _objMarkerUpdateTime;
      };
    };
  };

  _taskCount = _taskCount + 1;
} forEach objectives;

//Check for win condition and end game if all objectives are destroyed
[] spawn {
  waitUntil {aliveObjectives < 1};

  [format ["All objectives have been destroyed.\n%1 wins!",
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
