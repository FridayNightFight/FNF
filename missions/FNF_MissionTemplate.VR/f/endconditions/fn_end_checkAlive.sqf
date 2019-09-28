sleep 10;

bluforInMission = false;
opforInMission = false;
indforInMission = false;

bluforEliminated = false;
opforEliminated = false;
indforEliminated = false;

if (({(side _x == west)}count playableUnits) > 0) then {
  bluforInMission = true;
};
if (({(side _x == east)}count playableUnits) > 0) then {
  opforInMission = true;
};
if (({(side _x == independent)}count playableUnits) > 0) then {
  indforInMission = true;
};

while {!gameEnd} do {
  _bluforCount = {isPlayer _x && alive _x && side _x == west} count allUnits;
  if (bluforInMission && !bluforEliminated && (_bluforCount < 1)) then {
    bluforEliminated = true;
    ["BLUFOR eliminated!"] remoteExec ["hint"];
  };

  _opforCount = {isPlayer _x && alive _x && side _x == east} count allUnits;
  if (opforInMission && !opforEliminated && (_opforCount < 1)) then {
    opforEliminated = true;
    ["OPFOR eliminated!"] remoteExec ["hint"];
  };

  _indforCount = {isPlayer _x && alive _x && side _x == independent} count allUnits;
  if (indforInMission && !indforEliminated && (_indforCount < 1)) then {
    indforEliminated = true;
    ["INDFOR eliminated!"] remoteExec ["hint"];
  };
  sleep 10;
};
