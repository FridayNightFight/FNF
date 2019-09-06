_sleepTime = ("f_param_mission_timer" call BIS_fnc_getParamValue) * 60;

sleep _sleepTime;

_bluforInMission = false;
_opforInMission = false;
_indforInMission = false;

_bluforEliminated = false;
_opforEliminated = false;
_indforEliminated = false;

if (({(side _x == west)}count playableUnits) > 0) then {
  _bluforInMission = true;
};
if (({(side _x == east)}count playableUnits) > 0) then {
  _opforInMission = true;
};
if (({(side _x == independent)}count playableUnits) > 0) then {
  _indforInMission = true;
};

_endAliveEH = addMissionEventHandler ["EntityKilled", {
  params ["_unit", "_killer", "_instigator", "_useEffects"];
  if (_bluforInMission && !bluforEliminated && (({(alive _x) and (side _x == west)}count playableUnits) < 1)) then {
    bluforEliminated = true;
    ["BLUFOR eliminated!"] remoteExec ["hint"];
  };

  if (opforInMission && !opforEliminated && (({(alive _x) and (side _x == east)}count playableUnits) < 1 )) then {
    opforEliminated = true;
    ["OPFOR eliminated!"] remoteExec ["hint"];
  };

  if (indforInMission && !indforEliminated && (({(alive _x) and (side _x == independent)}count playableUnits) < 1)) then {
    indforEliminated = true;
    ["INDFOR eliminated!"] remoteExec ["hint"];
  };
}];
