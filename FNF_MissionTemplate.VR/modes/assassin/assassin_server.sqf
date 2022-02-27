if (!isServer) exitWith {};

//////////////////////////////////HVT///////////////////////////////
#include "..\..\mode_config\assassin.sqf"

fnf_assassin_targets = _targets;
fnf_assassin_aliveHVTs = count fnf_assassin_targets;
fnf_assassin_requiredKills = _requiredKills;

#define HVTXOBJ (missionNamespace getVariable [format["HVT_%1", _forEachIndex + 1], objNull])

if (fnf_defendingSide == sideEmpty || fnf_attackingSide == sideEmpty) exitWith {
  [
    "<t align='center'>This is an Atk/Def mode and the defending or attacking side is not configured. Please set it.</t>",
    "error",
    15
  ] remoteExec ["fnf_ui_fnc_notify", 0];
};


// create tasks
{
  (_x # 1) params ["_role", "_name", "_obj"];
  [
    fnf_defendingSide,
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
    fnf_attackingSide,
    format["atkTask%1", _forEachIndex + 1],
    ["", "Eliminate the enemy " + _role, ""],
    objNull,
    "CREATED"
  ] call BIS_fnc_taskCreate;
} forEach fnf_assassin_targets;


[{ // keep the list of HVTs updated throughout safestart and update brief for clients
  // only process during safestart to account for JIPs / DCs
  if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {
    [_handle] call CBA_fnc_removePerFrameHandler;
  };

  {
    _x params ["_targetNumStr", "_data"];
    _data params ["_roleName", "_fictionalName", "_object"];


    // check each target from mode config saved as global var and,
    // if object hasn't been saved or isn't alive or is null, try to save
    // will either save correct object, or objNull
    private _newObj = HVTXOBJ;
    if (isNil "_object") then {
      (_x # 1) set [2, _newObj];
    };

    if (!isNull _newObj) then {

      // set custom dogtag data
      _newObj setVariable [
        "ace_dogtags_dogTagData",
        [
          _name,
          [_name] call ace_dogtags_fnc_ssn,
          [_name] call ace_dogtags_fnc_bloodType
        ],
        true
      ];

      // make sure the task position is updated on the unit
      [format["defTask%1", _forEachIndex + 1], [_newObj,true]] call BIS_fnc_taskSetDestination;
    };
  } forEach fnf_assassin_targets;

  publicVariable "fnf_assassin_targets";
  ["REFRESH_BRIEF_GAMEMODE"] call CBA_fnc_globalEvent;
}, 20] call CBA_fnc_addPerFrameHandler;


// when safestart ends, auto-fail/-succeed the objective if the slot isn't filed
[{!(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {
  {
    _x params ["_targetNumStr", "_data"];
    _data params ["_roleName", "_fictionalName", "_object"];

    if (!alive _object || isNull _object) then {
      [format["defTask%1", _forEachIndex + 1], "FAILED", true] call BIS_fnc_taskSetState;
      [format["atkTask%1", _forEachIndex + 1], "SUCCEEDED", true] call BIS_fnc_taskSetState;

      fnf_assassin_aliveHVTs = fnf_assassin_aliveHVTs - 1;
    };
  } forEach fnf_assassin_targets;
}] call CBA_fnc_waitUntilAndExecute;


// when a unit dies, see if they're a target
// if so, find which one and adjust the task for them
addMissionEventHandler ["EntityKilled", {
  params ["_unit", "_killer", "_instigator", "_useEffects"];

  if !(_unit in (fnf_assassin_targets apply {_x select 1 select 2})) exitWith {};

  {
    if (_unit isEqualTo HVTXOBJ) exitWith {
      [format["defTask%1", _forEachIndex + 1], "FAILED", true] call BIS_fnc_taskSetState;
      [format["atkTask%1", _forEachIndex + 1], "SUCCEEDED", true] call BIS_fnc_taskSetState;

      fnf_assassin_aliveHVTs = fnf_assassin_aliveHVTs - 1;
    };
  } forEach fnf_assassin_targets;
}];


// Warn the HVTs if they leave their assigned zone
// monitors their position every 2 seconds
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

    // use a variable to limit checks/avoid duplicate messages
    if (_unit getVariable ["fnf_inZone", true]) then {
      if (count _badLocations == count _goodLocations) then {
        [format["atkTask%1", _forEachIndex + 1], [HVTXOBJ,true]] call BIS_fnc_taskSetDestination;
        ["<t align='center'>You're an HVT leaving a friendly jammer's radius.<br/>Your location has been revealed.</t>", "warning", 10] remoteExec ["fnf_ui_fnc_notify", _unit];
        _unit setVariable ["fnf_inZone", false];
      };
    };
    if !(_unit getVariable ["fnf_inZone", true]) then {
      if (count _badLocations != count _goodLocations) then {
        [format["atkTask%1", _forEachIndex + 1], [objNull,true]] call BIS_fnc_taskSetDestination;
        ["<t align='center'>You've entered the cover of a friendly jammer.<br/>Your location is no longer being revealed.</t>", "success", 10] remoteExec ["fnf_ui_fnc_notify", _unit];
        _unit setVariable ["fnf_inZone", true];
      };
    };
  } forEach fnf_assassin_targets;
}, 2] call CBA_fnc_addPerFrameHandler;


// Don't end game automatically in case it was due to DC or something.
[{fnf_assassin_aliveHVTs <= (count (fnf_assassin_targets) - fnf_assassin_requiredKills)},{
  [format["<t align='center'>The required number of HVTs has been eliminated!<br/>(%1 / %2)<br/><br/>As this may be due to disconnects or other circumstances, keep fighting until the staff declare a win!</t>", fnf_assassin_requiredKills, count (fnf_assassin_targets)],"info",15] remoteExec ["fnf_ui_fnc_notify", 0];
}] call CBA_fnc_waitUntilAndExecute;

// Admin should run this function if all HVTs are dead and mission should end in favor of attackers.
fnf_assassin_fnc_endGame = {
  fnf_gameEnd = true;
  publicVariable "fnf_gameEnd";

  [fnf_attackingSide, "has successfully killed all HVTs and won!"] spawn fnf_server_fnc_gameEnd;
};
