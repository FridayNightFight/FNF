_sleepTime = ("f_param_mission_timer" call BIS_fnc_getParamValue) * 60;
sleep _sleepTime;

if (({(side _x == west)}count playableUnits) > 0) then {
  bluforInMission = true;
};
if (({(side _x == east)}count playableUnits) > 0) then {
  opforInMission = true;
};
if (({(side _x == independent)}count playableUnits) > 0) then {
  indforInMission = true;
};


bluforEliminated = false;
opforEliminated = false;
indforEliminated = false;

_endAliveEH = addMissionEventHandler ["EntityKilled", {
  params ["_unit", "_killer", "_instigator", "_useEffects"];
  if !(_unit isKindOf "Man") exitWith {};
  if (bluforInMission && !bluforEliminated && (({(alive _x) and (side _x == west)}count playableUnits) < 1)) then {
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

aliveCounter = {
  aliveCount = true;

  waitUntil {!(alive player)};

  while {aliveCount} do {
     if !(alive player) then {
  	     _bluforAlive = ({(alive _x) and (side _x == west)} count playableUnits);
         _opforAlive = ({(alive _x) and (side _x == east)} count playableUnits);
         _indforAlive = ({(alive _x) and (side _x == east)} count playableUnits);

         hint format ["BLUFOR alive: %1\nOPFOR alive: %2\nINDFOR alive: %3", _bluforAlive, _opforAlive, _indforAlive];

     };
     sleep 5;
  };
};

remoteExec ["aliveCounter",0,true]
