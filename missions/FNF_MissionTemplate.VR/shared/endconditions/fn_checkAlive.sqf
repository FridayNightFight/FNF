waitUntil {!phx_safetyEnabled};

_bluforInMission = false;
_opforInMission = false;
_indforInMission = false;

_bluforEliminated = false;
_opforEliminated = false;
_indforEliminated = false;

_activeSides = 0;
_aliveSides = 0;

_units = allPlayers;
_cfg = configFile >> "cfgVehicles";

if ((west countSide _units) > 0) then {
  _bluforInMission = true;
  _activeSides = _activeSides + 1;
};

if ((east countSide _units) > 0) then {
  _opforInMission = true;
  _activeSides = _activeSides + 1;
};

if ((independent countSide _units) > 0) then {
  _indforInMission = true;
  _activeSides = _activeSides + 1;
};

_aliveSides = _activeSides; //To do: trigger game end

while {!(missionNamespace getVariable ["phx_gameEnd",false])} do {
  _bluforCount = {getNumber (_cfg >> typeOf _x >> "side") == 1 && alive _x} count _units;
  if (_bluforInMission && !_bluforEliminated && (_bluforCount < 1)) then {
    _bluforEliminated = true;
    _aliveSides = _aliveSides - 1;
    ["BLUFOR eliminated!"] remoteExec ["hint"];
  };

  _opforCount = {getNumber (_cfg >> typeOf _x >> "side") == 0 && alive _x} count _units;
  if (_opforInMission && !_opforEliminated && (_opforCount < 1)) then {
    _opforEliminated = true;
    _aliveSides = _aliveSides - 1;
    ["OPFOR eliminated!"] remoteExec ["hint"];
  };

  _indforCount = {getNumber (_cfg >> typeOf _x >> "side") == 2 && alive _x} count _units;
  if (_indforInMission && !_indforEliminated && (_indforCount < 1)) then {
    _indforEliminated = true;
    _aliveSides = _aliveSides - 1;
    ["INDFOR eliminated!"] remoteExec ["hint"];
  };
  sleep 10;
};
