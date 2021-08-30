_pointAddTime = 2;

["off"] call acex_fortify_fnc_handleChatCommand;

phx_term1HackingSide = sideEmpty;
phx_term2HackingSide = sideEmpty;
phx_term3HackingSide = sideEmpty;
phx_term1Animate = false;
phx_term2Animate = false;
phx_term3Animate = false;

//Show ticket counter
[] remoteExec ["BIS_fnc_showMissionStatus",0,true];

_markerSetup = {
  _term = _this;

  _mark = createMarker [format ["%1Mark",_term],getPos _term];
  _mark setMarkerType "mil_dot";
  _mark setMarkerText format ["Terminal %1", [str _term, 4, 4] call BIS_fnc_trimString];
};

term1 call _markerSetup;

phx_serverTerminalAction = {
  _term = _this select 0;
  _side = _this select 1;
  _animate = false;

  switch (_term) do {
    case term1: {
      missionNamespace setVariable ["phx_term1HackingSide",_side,true];
      if (!phx_term1Animate) then {
        _animate = true;
        phx_term1Animate = true;
      };
    };
    case term2: {
      missionNamespace setVariable ["phx_term2HackingSide",_side,true];
      if (!phx_term2Animate) then {
        _animate = true;
        phx_term2Animate = true;
      };
    };
    case term3: {
      missionNamespace setVariable ["phx_term3HackingSide",_side,true];
      if (!phx_term3Animate) then {
        _animate = true;
        phx_term3Animate = true;
      };
    };
  };

  _mark = str _term + "Mark";
  _termNum = [str _term, 4, 4] call BIS_fnc_trimString;

  switch (_side) do {
    case east: {
      _mark setMarkerText format ["Terminal %1 - Red Team", _termNum];
      _mark setMarkerType "Faction_OPFOR_EP1";
    };
    case west: {
      _mark setMarkerText format ["Terminal %1 - Blue Team", _termNum];
      _mark setMarkerType "Faction_BLUFOR_EP1";
    };
    case independent: {
      _mark setMarkerText format ["Terminal %1 - INDFOR", _termNum];
      _mark setMarkerType "Faction_INDFOR_EP1";
    };
  };


  if (_animate) then {
    [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
  };

 format ["Terminal %1 connected for %2", _termNum, switch (_side) do {case east: {"Red Team"}; case west: {"Blue Team"}; case independent: {"INDFOR"};}] remoteExec ["phx_fnc_hintThenClear", 0, false];
};

phx_connectionWin = {
  phx_gameEnd = true;
  publicVariable "phx_gameEnd";

  _side = _this;

  [format ["%1 has reached 100 points.\n%1 wins!",
  switch (_sideWon) do {
    case east: {"Red Team"};
    case west: {"Blue Team"};
    case independent: {"INDFOR"};
  }]] remoteExec ["hint"];

  {
    if (!isNull _x) then {
      _x remoteExec ["removeAllActions"];
    };
  } forEach [term1];

  _sideWon call PHX_fnc_titanMultiRoundHandler;
};

_sideWon = sideEmpty;

[{phx_term1HackingSide != sideEmpty}, {
phx_ticketPFH = [{
  if (!(missionNamespace getVariable ["phx_gameEnd",false])) then {
    [phx_term1HackingSide, 1] call BIS_fnc_respawnTickets;
    [phx_term2HackingSide, 1] call BIS_fnc_respawnTickets;
    [phx_term3HackingSide, 1] call BIS_fnc_respawnTickets;

    _sideWon = [[west,[west] call BIS_fnc_respawnTickets], [east,[east] call BIS_fnc_respawnTickets], [independent,[independent] call BIS_fnc_respawnTickets]] select {(_x select 1) >= 100};
    _sideWonCount = count _sideWon;
    _winCall = (_sideWonCount >= 1);
    switch (true) do {
      case (_sideWonCount == 1): {_sideWon = (_sideWon select 0) select 0};
      case (_sideWonCount > 1): {
        _points = 0;
        _largeSide = sideEmpty;
        {
          _sidePoints = _x select 1;
          if (_sidePoints > _points) then {
            _points = _sidePoints;
            _largeSide = _x select 0;
          };
        } forEach _sideWon;
        _sideWon = _largeSide;
      };
    };
    if (_winCall) then {
      _sideWon call phx_connectionWin;
    };
  };
}, 2] call Cba_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
