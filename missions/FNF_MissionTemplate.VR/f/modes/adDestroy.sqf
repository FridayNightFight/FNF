//Config lines
defendingSide = west; //east/west/independent
attackingSide = independent; //east/west/independent
objectives = [[], []];
/*
-variable name of objective (object name)
-corresponding marker name (string)
-object description - used for task name (string)
-whether or not the exact objective location is visible to attackers (boolean), true = visible

Examples:
objectives = [[cache1,"Cache_Marker","wepaons cache",false]]; - 1 objective, object named cache1, marker named "Cache_Marker", name for task title "weapons cache", objective location not visible to attackers (no task marker)
objectives = [[cache,"Cache_Marker","wepaons cache",false], [tank,"Tank_Marker","prototype tank","true"]]; - 2 objectives

*There can be an infinite number of objectives*
*/

//Make sure game is set correctly
if (isNil "defendingSide") exitWith {systemChat "You have not configured 'adDestroy.sqf' properly! You need to choose a defending side."};
if (isNil "attackingSide") exitWith {systemChat "You have not configured 'adDestroy.sqf' properly! You need to choose an attacking side."};
if (defendingSide isEqualTo attackingSide) exitWith {systemChat "You have not configured 'adDestroy.sqf' properly! You cannot set the same side to attack and defend."};
if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east) && !(defendingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'adDestroy.sqf' properly! The defending side is not a valid side. east/west/independent"};
if (!(attackingSide isEqualTo west) && !(attackingSide isEqualTo east) && !(attackingSide isEqualTo independent)) exitWith {systemChat "You have not configured 'adDestroy.sqf' properly! The attacking side is not a valid side. east/west/independent"};
if (count objectives < 1) exitWith {systemChat "You have not configured 'adDestroy.sqf' properly! You need to create at least one objective."};

//Init vars
_taskCount = 1;
aliveObjectives = count objectives;

//Tasks and task handlers
{
  _attackersTaskText =
  if (_x select 3) then {
    deleteMarker (_x select 1);
    "Destroy the "
  } else {
    "Search for and destroy the "
  };

  _defendTaskID = "defendTask" + str _taskCount;
  _attackTaskID = "attackTask" + str _taskCount;

  [defendingSide,_defendTaskID,["",format ["Defend the %1",_x select 2],_x select 1],_x select 0,"AUTOASSIGNED"] call BIS_fnc_taskCreate;
  [attackingSide,_attackTaskID,["",format [_attackersTaskText + "%1",_x select 2],_x select 1],if (_x select 3) then {_x select 0} else {getMarkerPos (_x select 1)},"AUTOASSIGNED"] call BIS_fnc_taskCreate;

  [_x select 1,0] remoteExec ["setMarkerAlphaLocal",defendingSide,true];

  [_x select 0, _x select 1, _defendTaskID, _attackTaskID] spawn {
    params ["_object","_markerName","_defendTaskID","_attackTaskID"];

    waitUntil {!alive _object};

    [_defendTaskID, "FAILED", true] call BIS_fnc_taskSetState;
    [_attackTaskID, "SUCCEEDED", true] call BIS_fnc_taskSetState;

    aliveObjectives = aliveObjectives - 1;
    deleteMarker _markerName;
  };

  _taskCount = _taskCount + 1;
} forEach objectives;

//Check for win condition and end game
[] spawn {
  waitUntil {aliveObjectives < 1};

  [format ["All objectives have been destroyed.\n%1 wins!",
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
