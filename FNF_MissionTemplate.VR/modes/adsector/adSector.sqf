if (!isServer) exitWith {};

#include "..\..\mode_config\adSector.sqf"

phx_capNum = 0;
phx_sectorNum = _numberOfSectors;
phx_sectorInOrder = _inOrder;
_sectors = [];

switch (_numberOfSectors) do {
  case 1: {_sectors pushBack phx_sec1};
  case 2: {_sectors pushBack phx_sec1; _sectors pushBack phx_sec2};
  case 3: {_sectors pushBack phx_sec1; _sectors pushBack phx_sec2; _sectors pushBack phx_sec3};
};

phx_server_sectorWin = {
  phx_gameEnd = true;
  publicVariable "phx_gameEnd";

  [phx_attackingSide, "has captured all sectors and wins!"] spawn phx_fnc_gameEnd;
};

_sectorNum = 0;
{
  _area = triggerArea _x;

  _mark = createMarker [(str _x) + "Mark", getPos _x];

  _mark setMarkerShape (if (_area select 3) then {"RECTANGLE"} else {"ELLIPSE"});

  _mark setMarkerSize [_area select 0, _area select 1];

  _mark setMarkerDir (_area select 2);

  _mark setMarkerBrush "SolidBorder";

  _mark setMarkerColor "ColorBlack";

  _textMark = createMarker [(str _x) + "TextMark", getPos _x];
  _textMark setMarkerType "mil_dot";
  _sectorNum = _sectorNum + 1;
  _textMark setMarkerText ("Sector " + str _sectorNum);

  [_x,_mark,_textMark,_sectorNum] spawn {
    params ["_sector","_mark","_textMark","_sectorNum","_dTask","_aTask"];

    if (phx_sectorInOrder) then {
      waitUntil {phx_capNum == (_sectorNum - 1)};
    };

    switch (phx_defendingSide) do {
      case east: {_mark setMarkerColor "ColorRed"};
      case west: {_mark setMarkerColor "ColorBlue"};
      case independent: {_mark setMarkerColor "ColorGreen"};
    };

    _dTask = "dtask" + str(_sectorNum);
    _aTask = "atask" + str(_sectorNum);
    _dTaskTitle = "Defend Sector " + str(_sectorNum);
    _aTaskTitle = "Capture Sector " + str(_sectorNum);

    [phx_defendingSide, [_dTask], [_dTaskTitle, _dTaskTitle, ""], getPos _sector, "AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [phx_attackingSide, [_aTask], [_aTaskTitle, _aTaskTitle, ""], getPos _sector, "AUTOASSIGNED"] call BIS_fnc_taskCreate;

    _units = [];

    while {alive _sector && !phx_gameEnd} do {
      _dPresent = false;
      _aPresent = false;

      _units = allUnits inAreaArray _sector;

      {
        if (_x call BIS_fnc_objectSide == phx_defendingSide && vehicle _x isKindOf "Man" && lifeState _x != "INCAPACITATED" && !isObjectHidden _x) then {
          _dPresent = true;
        };
        if (_x call BIS_fnc_objectSide == phx_attackingSide && vehicle _x isKindOf "Man" && lifeState _x != "INCAPACITATED" && !isObjectHidden _x) then {
          _aPresent = true;
        };
      } forEach _units;

      if (_aPresent && !_dPresent) then {
        phx_capNum = phx_capNum + 1;

        deleteVehicle _sector;
        deleteMarker _mark;
        deleteMarker _textMark;

        [_dTask,"FAILED"] call BIS_fnc_taskSetState;
        [_aTask,"SUCCEEDED"] call BIS_fnc_taskSetState;

        if (phx_capNum >= phx_sectorNum) then {call phx_server_sectorWin} else {
          ["Attackers have captured Sector " + (str _sectorNum)]  remoteExec ["phx_fnc_hintThenClear",0,false];
        };
      };

      sleep 2;
    };
  };
} forEach _sectors;
