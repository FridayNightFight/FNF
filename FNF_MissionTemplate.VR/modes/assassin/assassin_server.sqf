if (!isServer) exitWith {};

//////////////////////////////////HVT///////////////////////////////
#include "..\..\mode_config\assassin.sqf"

phx_assassinationTargets = _targets;
phx_aliveHVTs = count phx_assassinationTargets;

#define HVTXVAR {missionNamespace getVariable format["HVT_%1", _forEachIndex + 1]}
#define HVTXOBJ (missionNamespace getVariable [format["HVT_%1", _forEachIndex + 1], objNull])
#define GETTARGET ([phx_assassinationTargets, format["Target %1", _forEachIndex + 1]] call BIS_fnc_getFromPairs)


_fnc_gatherObjects = {
  params ["_useDefaultPLTHQ", "_targets"];
  if (_useDefaultPLTHQ) then {
    private "_HVTGroup";
    _HVTGroups = allGroups select {side _x isEqualTo phx_defendingSide && groupId _x isEqualTo "PLTHQ"};
    if (count _HVTGroups > 0) then {
      _HVTGroup = _HVTGroups # 0
    } else {
      {true} exitWith {
        [
          format["<t align='center'>Unable to locate Platoon HQ on %1, this mission will not work.</t>", phx_defendingSide call BIS_fnc_sideName],
          "error",
          15
        ] remoteExec ["phx_ui_fnc_notify", 0];
      };
    };

    {
      if (isNil HVTXVAR) then {
        [format["HVT_%1", _forEachIndex + 1], _x] call CBA_fnc_publicVariable;
      };
      private _arr = GETTARGET;
      _arr pushBackUnique _x;

      [phx_assassinationTargets, format["Target %1", _forEachIndex + 1], _arr] call BIS_fnc_setToPairs;
    } forEach (units _HVTGroup);

    // phx_aliveHVTs = count (units _HVTGroup);

  } else {
    {
      private _data = _x;
      if (!isNil HVTXVAR) then {
        [{!isNull (_this # 2)},{
          (_this # 0) params ["_role", "_name"];
          private _targetNum = _this # 1;
          private _unit = _this # 2;

          // (["defTask1",objNull] call BIS_fnc_taskReal) setSimpleTaskTarget [missionNamespace getVariable "hvt_OBL", true];

          private _arr = [phx_assassinationTargets, format["Target %1", _targetNum]] call BIS_fnc_getFromPairs;
          _arr pushBackUnique _unit;
          [phx_assassinationTargets, format["Target %1", _targetNum], _arr] call BIS_fnc_setToPairs;

          _unit setVariable [
            "ace_dogtags_dogTagData",
            [
              _name,
              [_name] call ace_dogtags_fnc_ssn,
              [_name] call ace_dogtags_fnc_bloodType
            ],
            true
          ];
        }, [_data # 1, _forEachIndex + 1, HVTXOBJ]] call CBA_fnc_waitUntilAndExecute;
      };
    } forEach _targets;
  };


  [{
    if (!phx_safetyEnabled) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
    ["REFRESH_BRIEF_GAMEMODE", [phx_assassinationTargets]] call CBA_fnc_globalEvent;
  // }, (random(20) + 50)] call CBA_fnc_addPerFrameHandler;
  }, 10] call CBA_fnc_addPerFrameHandler;
};

// make sure the tasks are "following" the location of the objectives for defenders
_fnc_updateTaskAssociations = {
  {
    (_x # 1) params ["_role", "_name", "_obj"];
    if (!isNil "_obj") then {
      [format["defTask%1", _forEachIndex + 1], [HVTXOBJ,true]] call BIS_fnc_taskSetDestination;
    };
  } forEach phx_assassinationTargets;
};



[_useDefaultPLTHQ, _targets] call _fnc_gatherObjects;
call _fnc_updateTaskAssociations;

// create tasks
{
  (_x # 1) params ["_role", "_name", "_obj"];
  [
    phx_defendingSide,
    format["defTask%1", _forEachIndex + 1],
    ["", "Protect the " + _role, ""],
    [HVTXOBJ,true],
    "CREATED"
  ] call BIS_fnc_taskCreate;
  [
    independent,
    format["defTask%1", _forEachIndex + 1],
    ["", "Protect the " + _role, ""],
    [HVTXOBJ,true],
    "CREATED"
  ] call BIS_fnc_taskCreate;
  [
    phx_attackingSide,
    format["atkTask%1", _forEachIndex + 1],
    ["", "Eliminate the enemy " + _role, ""],
    objNull,
    "CREATED"
  ] call BIS_fnc_taskCreate;
} forEach phx_assassinationTargets;
// (phx_assassinationTargets select {count (_x # 1) > 2});



// wait until safeStart is done then re-grab the objective units and process what slots are filled/alive
// also ensure tasks are 'following' the objectives for defenders
waitUntil {!(missionNamespace getVariable ["phx_safetyEnabled", true])};
[_useDefaultPLTHQ, _targets] call _fnc_gatherObjects;
call _fnc_updateTaskAssociations;



// when an objective unit dies, adjust the tasks for defenders and attackers (fail/success)
{
  (_x # 1) params ["_role", "_name", "_obj"];
  _targetNum = _forEachIndex + 1;
  if (!isNil "_obj") then {
    [{
      params ["_data", "_targetNum"];
      (_data # 1) params ["_role", "_name", "_obj"];
      !alive _obj
    }, {
      params ["_data", "_targetNum"];
      (_data # 1) params ["_role", "_name", "_obj"];

      [format["defTask%1", _targetNum], "FAILED", true] call BIS_fnc_taskSetState;
      [format["atkTask%1", _targetNum], "SUCCEEDED", true] call BIS_fnc_taskSetState;

      phx_aliveHVTs = phx_aliveHVTs - 1;
    }, [_x, _targetNum]] call CBA_fnc_waitUntilAndExecute;

  } else {
    (_x # 1) params ["_role", "_name", "_obj"];
    _targetNum = _forEachIndex + 1;
    [format["defTask%1", _targetNum], "FAILED", true] call BIS_fnc_taskSetState;
    [format["atkTask%1", _targetNum], "SUCCEEDED", true] call BIS_fnc_taskSetState;

    phx_aliveHVTs = phx_aliveHVTs - 1;
  };
} forEach phx_assassinationTargets;


phx_civGroup = createGroup civilian;
phx_civGroup setGroupIdGlobal ["Revealed HVTs"];
phx_hvtGroup = createGroup phx_defendingSide;
phx_hvtGroup setGroupIdGlobal ["HVTs"];
// Warn the HVTs if they leave their assigned zone
[{
  private _goodLocations = ["fnf_assassin_boundaries_"] call BIS_fnc_getMarkers;
  {
    (_x # 1) params ["_role", "_name", "_unit"];
    private _badLocations = [];

    {
      if !(_unit inArea _x) then {
        _badLocations pushBack _x;
      };
    } forEach _goodLocations;
    if (count _badLocations == count _goodLocations) then {
      [format["atkTask%1", _forEachIndex + 1], [HVTXOBJ,true]] call BIS_fnc_taskSetDestination;
      ["<t align='center'>You're an HVT leaving protective custody.<br/>Your location has been revealed to your enemies.<br/><br/>Return to the zone immediately!</t>", "warning", 5] remoteExec ["phx_ui_fnc_notify", _unit];
    } else {
      [format["atkTask%1", _forEachIndex + 1], [objNull,true]] call BIS_fnc_taskSetDestination;
    };
  } forEach phx_assassinationTargets;
}, 5] call CBA_fnc_addPerFrameHandler;

// Don't end game automatically in case it was due to DC or something.
[{phx_aliveHVTs <= (count (_this # 0) - (_this # 1))},{
  [format["<t align='center'><br/>The required number of HVTs has been eliminated!<br/>(%1 / %2)<br/><br/>As this may be due to disconnects or other circumstances, keep fighting until the staff declare a win!<br/></t>", _this # 1, count (_this # 0)],"info",15] call phx_ui_fnc_notify;
}, [_targets, _requiredKills]] call CBA_fnc_waitUntilAndExecute;

// Admin should run this function if all HVTs are dead and mission should end in favor of attackers.
phx_fnc_HVTEnd = {
  phx_gameEnd = true;
  publicVariable "phx_gameEnd";

  [phx_attackingSide, "has successfully killed all HVTs and won!"] spawn phx_fnc_gameEnd;
};
