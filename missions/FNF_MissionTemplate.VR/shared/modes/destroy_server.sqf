//Only run server-side
if (!isServer) exitWith {};

#include "..\..\mode_config\destroy.sqf"

//Init vars
_taskCount = 1;
phx_aliveObjectives = 0;

//Delete pre-made objectives if not using
if ((_obj1 select 0) != destroy_obj1) then {
  deleteVehicle destroy_obj1;
  deleteMarker "destroy_obj1Mark";
};

{
  if !(_x in _obj1 || _x in _obj2 || _x in _obj3) then {
    deleteVehicle _x;
    deleteMarker ((str _x) + "Mark");
  };
} forEach [destroy_obj1, destroy_obj2];

_objArr = [_obj1,_obj2,_obj3];
missionNamespace setVariable ["phx_destroyObjs", [_obj1 select 0, _obj2 select 0, _obj3 select 0], true];

//Reduce damage if obj is default cache
{
  if !(isNull (_x select 0)) then {
    phx_aliveObjectives = phx_aliveObjectives + 1;

    if (typeOf (_x select 0) isEqualTo "Box_FIA_Ammo_F") then {
      (_x select 0) addEventHandler ["HandleDamage", {
        _unit = _this select 0;
        _selection = _this select 1;
        _damage = _this select 2;

        if (_selection == "?") exitWith {};

        _curDamage = damage _unit;
        if (_selection != "") then {_curDamage = _unit getHit _selection};
        _newDamage = _damage - _curDamage;

        _damage - _newDamage * 0.9;
      }];
    };
  };
} forEach _objArr;

//Tasks and task handlers
{
  if (isNull (_x select 0)) exitWith {};

  _attackersTaskText = "Search for and destroy the ";

  _defendTaskID = "defendTask" + str _taskCount;
  _attackTaskID = "attackTask" + str _taskCount;

  [phx_defendingSide,_defendTaskID,["",format ["Defend the %1",_x select 2],_x select 1],_x select 0,"CREATED"] call BIS_fnc_taskCreate;
  [phx_attackingSide,_attackTaskID,["",format [_attackersTaskText + "%1",_x select 2],_x select 1],getMarkerPos (_x select 1),"CREATED"] call BIS_fnc_taskCreate;

  [_x select 0] call phx_fnc_objBuildingDamage;

  //Check for alive objective
  [_x select 0, _x select 1, _defendTaskID, _attackTaskID] spawn {
    params ["_object","_markerName","_defendTaskID","_attackTaskID"];

    waitUntil {!alive _object};

    [_defendTaskID, "FAILED", true] call BIS_fnc_taskSetState;
    [_attackTaskID, "SUCCEEDED", true] call BIS_fnc_taskSetState;

    phx_aliveObjectives = phx_aliveObjectives - 1;
    [_markerName] remoteExec ["deleteMarkerLocal",0,true];
  };

  //Handle moving objective
  [_x select 0,_x select 1,_attackTaskID] spawn {
    _obj = _this select 0;
    _marker = _this select 1;
    _attackTaskID = _this select 2;
    _objMarkerUpdateTime = 20; //Change this value to however often you want the objective markers to update (seconds)
    _objMaxDistance = selectMin (getMarkerSize _marker);

    //Sets marker position to a random area around the objective, keeping the objective inside the marker
    _marker setMarkerPos ([[[position _obj,(_objMaxDistance * random [0.1,0.7,1])]],[]] call BIS_fnc_randomPos);
    [_attackTaskID, _marker] call BIS_fnc_taskSetDestination;

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

  _taskCount = _taskCount + 1;
} forEach _objArr;

//Check for win condition and end game if all objectives are destroyed
waitUntil {phx_aliveObjectives < 1};

[format ["All objectives have been destroyed.\n%1 wins!",
switch (phx_attackingSide) do {
  case east: {"OPFOR"};
  case west: {"BLUFOR"};
  case independent: {"INDFOR"};
}]] remoteExec ["hint"];

//Send var to other scripts and clients to signal that the game has ended
missionNamespace setVariable ["phx_gameEnd", true, true];

uisleep 20;

"end1" call bis_fnc_endMissionServer;
