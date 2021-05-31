/*
Overtime end conditions for each game mode
*/

//Exit if game already ended via other script
if (phx_gameEnd) exitWith {};

_endGame = {
  _msg = _this;
  _defendSide = switch (phx_defendingSide) do {
    case east: {"OPFOR"};
    case west: {"BLUFOR"};
    case independent: {"INDFOR"};
  };

  format [_msg + "\n" + _defendSide + " wins!"] remoteExec ["hint"];

  phx_gameEnd = true;
  publicVariable "phx_gameEnd";

  if (phx_gameMode in ["destroy","uplink"]) then {
    sleep 10;
    "end1" call bis_fnc_endmissionserver;
  };
};



_overTimeAlert = false;
_pointLead = 20;
while {!phx_gameEnd} do {
  _overtime = false;
  _highSide = sideEmpty;
  _highCount = -1;

  _blu = [west] call BIS_fnc_respawnTickets;
  _opf = [east] call BIS_fnc_respawnTickets;
  _ind = [independent] call BIS_fnc_respawnTickets;

  {
    _val = [_x] call BIS_fnc_respawnTickets;
    if (_val > _highCount) then {_highCount = _val; _highSide = _x};
  } forEach [east,west,independent];

  _bluOpfDif = 0;
  _bluIndDif = 0;

  _opfBluDif = 0;
  _opfIndDif = 0;

  _indBluDif = 0;
  _indOpfDif = 0;

  if (_blu > _opf) then {
    _bluOpfDif = _blu - _opf;
  };
  if (_blu > _ind) then {
    _bluIndDif = _blu - _ind;
  };

  if (_opf > _blu) then {
    _opfBluDif = _opf - _blu;
  };
  if (_opf > _ind) then {
    _opfIndDif = _opf - _ind;
  };

  if (_ind > _blu) then {
    _indBluDif = _ind - _blu;
  };
  if (_ind > _opf) then {
    _indOpfDif = _ind - _opf;
  };

  if (_highSide == west && (_bluOpfDif < _pointLead || _bluIndDif < _pointLead)) then {_overtime = true};
  if (_highSide == east && (_opfBluDif < _pointLead || _opfIndDif < _pointLead)) then {_overtime = true};
  if (_highSide == independent && (_indBluDif < _pointLead || _indOpfDif < _pointLead)) then {_overtime = true};

  if (!_overtime) then {
    _sideText = switch (_highSide) do {
      case east: {"OPFOR"};
      case west: {"BLUFOR"};
      case independent: {"INDFOR"};
      default {"Nobody"};
    };

    format ["The mission time limit has been reached.\n%1 wins!", _sideText] remoteExec ["hint"];
    phx_gameEnd = true;
    publicVariable "phx_gameEnd";
    _highSide call PHX_fnc_titanMultiRoundHandler;
  } else {
    if (!_overTimeAlert) then {
      "Overtime enabled! \n The first side to hit 100 points or a 20 point lead will win." remoteExec ["hint"];
      _overTimeAlert = true;
    };
  };
};
  //END NEUTRAL SECTOR & CONNECTION

