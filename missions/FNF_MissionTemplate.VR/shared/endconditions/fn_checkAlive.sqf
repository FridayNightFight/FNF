waitUntil {!phx_safetyEnabled};

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

while {!phx_gameEnd} do {
  _bluforCount = {isPlayer _x && alive _x && side _x == west} count allUnits;
  if (_bluforInMission && !_bluforEliminated && (_bluforCount < 1)) then {
    _bluforEliminated = true;
    ["BLUFOR eliminated!"] remoteExec ["hint"];
  };

  _opforCount = {isPlayer _x && alive _x && side _x == east} count allUnits;
  if (_opforInMission && !_opforEliminated && (_opforCount < 1)) then {
    _opforEliminated = true;
    ["OPFOR eliminated!"] remoteExec ["hint"];
  };

  _indforCount = {isPlayer _x && alive _x && side _x == independent} count allUnits;
  if (_indforInMission && !_indforEliminated && (_indforCount < 1)) then {
    _indforEliminated = true;
    ["INDFOR eliminated!"] remoteExec ["hint"];
  };
  sleep 10;
};
