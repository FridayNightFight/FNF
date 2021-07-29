#include "..\..\mode_config\search.sqf"

["off"] call acex_fortify_fnc_handleChatCommand;

phx_term1HackingSide = sideEmpty;
phx_term2HackingSide = sideEmpty;
phx_term3HackingSide = sideEmpty;
phx_term4HackingSide = sideEmpty;
phx_term5HackingSide = sideEmpty;
phx_term1Animate = false;
phx_term2Animate = false;
phx_term3Animate = false;
phx_term4Animate = false;
phx_term5Animate = false;

phx_sidesInMission = [east, west, independent] select {playableSlotsNumber _x > 3};


phx_searchTerminalTemplate = createHashMapFromArray [
  ["markStart", [0,0,0]],
  ["descriptorMark", ""],
  ["areaMark", ""],
  ["termNo", -1],
  ["radiusStageEAST", 0],
  ["radiusStageWEST", 0],
  ["radiusStageGUER", 0]
];
// also used is terminal getVariable "phx_searchMarkPosEast", etc


phx_searchStages = createHashMapFromArray [
  [0, 1], // 500m rad
  [1, 0.8], // 400m
  [2, 0.75], // 300m
  [3, 0.5], // 200m
  [4, 0.3], // 100m
  [5, 0.1] // 50m
];

phx_terminals = [];

//Show ticket counter
[] remoteExec ["BIS_fnc_showMissionStatus",0,true];

_initTerminal = {
  _terminal = _this;

  _info = _terminal getVariable "phx_termInfo";


  private _markPos = [
    [
      [
        position _terminal,
        (phx_searchMarkAreaStartRadius * random [0.15,0.45,0.75])
      ]
    ],
    []
  ] call BIS_fnc_randomPos;

  _info set ["markStart", _markPos];
  _terminal setVariable ["phx_termInfo", _info];

  _mark = createMarkerLocal [_info get "descriptorMark", _markPos];
  _mark setMarkerTypeLocal "loc_download";
  _mark setMarkerColorLocal "ColorWhite";
  _mark setMarkerText format ["Terminal %1", _info get "termNo"];

  _markArea = createMarkerLocal [_info get "areaMark", _markPos];
  // _markArea setMarkerType "hd_dot_noShadow";
  _markArea setMarkerShapeLocal "ELLIPSE";
  _markArea setMarkerBrushLocal "SolidBorder";
  _markArea setMarkerColorLocal "ColorCIV";
  _markArea setMarkerAlphaLocal 0.2;
  _markArea setMarkerSize [phx_searchMarkAreaStartRadius, phx_searchMarkAreaStartRadius];

  [{

    {
      private _terminal = _x;

      private _info = _terminal getVariable "phx_termInfo";

      private _termNo = _info get "termNo";
      private _mark = _info get "descriptorMark";
      private _markArea = _info get "areaMark";
      // "debug_console" callExtension (str _info);
      // "debug_console" callExtension (_markArea);

      {
        // "debug_console" callExtension (str(_x) + str(count ((units _x) select {_x inArea _markArea}) >= 1));
        private _str = format["radiusStage%1", str _x];
        private _num = _info get _str;
        if (_num + 1 <= 5) then { // should we check
          if (count ((units _x) select {_x inArea _markArea}) >= 1) then {
            
            
            _info set [_str, _num + 1];
            // "debug_console" callExtension (_str + str(_num + 1));
            _terminal setVariable ["phx_termInfo", _info];
            [_terminal, _x, _num + 1] call phx_nextSearchMarkerState;
          };
        };
      } forEach phx_sidesInMission;

      // every cycle, the circle shrinks and translates. destination circle will include the terminal location as well as a proportionately translated point along an intersect line between terminal and original circle's center to always keep on a steady path toward the objective. actual center of subsequent circles will be randomized to keep these two points of interest within 0.75*r of the circle.
      // 40 minutes of 50 game time
      // 5 cycles of 8 minutes each
      // 500 radius / 1km diameter
      // 400
      // 300
      // 200
      // 100
      // 50

    } forEach phx_terminals;
  }, 5] call CBA_fnc_addPerFrameHandler;
};


phx_randomizeSearchMarkPos = {
  params ["_terminal", "_multiplier", "_markStart", "_newSize"];

  private _pos = [];
  private _distanceOgObj = _terminal distance2D _markStart;
  private _distanceToIncl = _distanceOgObj * _multiplier;
  private _bearing = _terminal getDir _markStart;
  private _lineSpot = _terminal getPos [_distanceToIncl, _bearing];

  _pos = [
    [
      [
        position _terminal,
        (_newSize * random [0.15,0.45,0.75])
      ]
    ],
    []
  ] call BIS_fnc_randomPos;

  _pos;
};


phx_nextSearchMarkerState = {
  params ["_terminal", "_side", "_newStage"];

  private _info = _terminal getVariable "phx_termInfo";
  private _mark = _info get "descriptorMark";
  private _markArea = _info get "areaMark";
  private _markStart = _info get "markStart";
  private _termNo = _info get "termNo";
  private _stageMultiplier = phx_searchStages get _newStage;
  private _newSize = phx_searchMarkAreaStartRadius * _stageMultiplier;

  // Share point on line to original center + term in newSize
  private _newPos = [_terminal, _stageMultiplier, _markStart, _newSize] call phx_randomizeSearchMarkPos;

  // "debug_console" callExtension (_mark);
  // "debug_console" callExtension (_markArea);
  // "debug_console" callExtension (str (getPos _terminal));
  // "debug_console" callExtension (str _newPos);
  // "debug_console" callExtension (str _newSize);

  [_mark, _newPos] remoteExecCall ["setMarkerPosLocal", _side];
  [_markArea, _newPos] remoteExecCall ["setMarkerPosLocal", _side];
  [_markArea, [_newSize, _newSize]] remoteExecCall ["setMarkerSizeLocal", _side];
  _mark setMarkerPosLocal _newPos;
  _markArea setMarkerPosLocal _newPos;
  _markArea setMarkerSizeLocal [_newSize, _newSize];

  if (time > 10) then {
    format [
      "%1 unlocks more intel on Terminal %2!",
      _side call BIS_fnc_sideName,
      _termNo
    ] remoteExec ["phx_fnc_hintThenClear", 0];
  };
};


// if (!_randomSelection) then {
  switch (_numberOfTerminals) do {
    case 1: {
      {
        deleteVehicle _x;
      } forEach [term2, term3, term4, term5];
      phx_terminals = [term1];
    };
    case 3: {
      {
        deleteVehicle _x;
      } forEach [term4, term5];
      phx_terminals = [term1, term2, term3];
    };
    case 5: {
      phx_terminals = [term1, term2, term3, term4, term5];
    };
    default {hint "Terminal number not set correctly";};
  };
// } else {
  // to implement random selection of terminals to remove
//   switch (_numberOfTerminals) do {
//     case 1: {
//       {
//         deleteVehicle _x;
//       } forEach [term2, term3, term4, term5];
//       phx_terminals = [term1];
//     };
//     case 3: {
//       {
//         deleteVehicle _x;
//       } forEach [term4, term5];
//       phx_terminals = [term1, term2, term3];
//     };
//     case 5: {
//       phx_terminals = [term1, term2, term3, term4, term5];
//     };
//     default {hint "Terminal number not set correctly";};
//   };
// };

phx_terminals = phx_terminals select {!isNull _x};

{
  private _terminal = _x;
  private _hash = +phx_searchTerminalTemplate;
  _hash set ["descriptorMark", format ["%1Mark",str _terminal]];
  _hash set ["areaMark", format ["%1MarkArea",str _terminal]];
  _hash set ["termNo", str _terminal select [4, 1]];
  _x setVariable ["phx_termInfo", _hash];
  _x call _initTerminal;
} forEach phx_terminals;


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
    case term4: {
      missionNamespace setVariable ["phx_term4HackingSide",_side,true];
      if (!phx_term4Animate) then {
        _animate = true;
        phx_term4Animate = true;
      };
    };
    case term5: {
      missionNamespace setVariable ["phx_term5HackingSide",_side,true];
      if (!phx_term5Animate) then {
        _animate = true;
        phx_term5Animate = true;
      };
    };
  };


  private _info = _term getVariable "phx_termInfo";

  private _termNo = _info get "termNo";
  private _mark = _info get "descriptorMark";
  private _markArea = _info get "areaMark";

  switch (_side) do {
    case sideEmpty: {
      [_mark, format ["Terminal %1 - Neutral", _termNo]] remoteExecCall ["setMarkerTextLocal", 0];
      [_mark, "loc_download"] remoteExecCall ["setMarkerTypeLocal", _side];
      [_mark, "ColorCIV"] remoteExecCall ["setMarkerColorLocal", _side];
    };
    case east: {
      [_mark, format ["Terminal %1 - OPFOR", _termNo]] remoteExecCall ["setMarkerTextLocal", 0];
      [_mark, "Faction_OPFOR_EP1"] remoteExecCall ["setMarkerTypeLocal", _side];
      [_mark, "ColorEAST"] remoteExecCall ["setMarkerColorLocal", _side];
    };
    case west: {
      [_mark, format ["Terminal %1 - BLUFOR", _termNo]] remoteExecCall ["setMarkerTextLocal", 0];
      [_mark, "Faction_BLUFOR_EP1"] remoteExecCall ["setMarkerTypeLocal", 0];
      [_mark, "ColorWEST"] remoteExecCall ["setMarkerColorLocal", 0];
    };
    case independent: {
      [_mark, format ["Terminal %1 - INDFOR", _termNo]] remoteExecCall ["setMarkerTextLocal", 0];
      [_mark, "Faction_INDFOR_EP1"] remoteExecCall ["setMarkerTypeLocal", 0];
      [_mark, "ColorGUER"] remoteExecCall ["setMarkerColorLocal", 0];
    };
  };

  if (_animate) then {
    [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
  };

  format [
    "Terminal %1 connected for %2",
    _termNo,
    switch (_side) do {
      case east: {"OPFOR"};
      case west: {"BLUFOR"};
      case independent: {"INDFOR"};
    }
  ] remoteExec ["phx_fnc_hintThenClear", 0, false];
};

phx_searchWin = {
  phx_gameEnd = true;
  publicVariable "phx_gameEnd";

  _side = _this;

  [_sideWon, "has reached 100 points and won Search!"] spawn phx_fnc_gameEnd;

  {
    if (!isNull _x) then {
      _x remoteExec ["removeAllActions"];
    };
  } forEach phx_terminals;

};

_sideWon = sideEmpty;
waitUntil {
  phx_term1HackingSide != sideEmpty ||
  phx_term2HackingSide != sideEmpty ||
  phx_term3HackingSide != sideEmpty ||
  phx_term4HackingSide != sideEmpty ||
  phx_term5HackingSide != sideEmpty
};

while {!(missionNamespace getVariable ["phx_gameEnd",false])} do {
  [phx_term1HackingSide, 1] call BIS_fnc_respawnTickets;
  [phx_term2HackingSide, 1] call BIS_fnc_respawnTickets;
  [phx_term3HackingSide, 1] call BIS_fnc_respawnTickets;
  [phx_term4HackingSide, 1] call BIS_fnc_respawnTickets;
  [phx_term5HackingSide, 1] call BIS_fnc_respawnTickets;

  _sideWon = [
    [west,[west] call BIS_fnc_respawnTickets],
    [east,[east] call BIS_fnc_respawnTickets],
    [independent,[independent] call BIS_fnc_respawnTickets]
  ] select {(_x select 1) >= 100};
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
    _sideWon call phx_searchWin;
  };
  sleep _pointAddTime;
};
