if (!isServer) exitWith {};

#include "..\..\mode_config\adSector.sqf"

_validateSectors = ["fnf_sec1", "fnf_sec2", "fnf_sec3"] select [0, _numberOfSectors];
_validateSectors = _validateSectors apply {missionNamespace getVariable [_x, objNull]} select {!isNull _x};
if (count _validateSectors < _numberOfSectors) exitWith {
  "[FNF] (Gamemode) Failed to initialize ADSector: Fewer sector modules present than number set in mode_config!" remoteExec ["systemChat", 0, true];
};

fnf_gamemode_sectors = _validateSectors;

fnf_gamemode_capNum = 0;
fnf_gamemode_sectorNum = _numberOfSectors;
fnf_gamemode_sectorInOrder = _inOrder;

// // fnf_gamemode_sectors = [];
// switch (_numberOfSectors) do {
//   case 1: {fnf_gamemode_sectors pushBack fnf_sec1};
//   case 2: {fnf_gamemode_sectors pushBack fnf_sec1; fnf_gamemode_sectors pushBack fnf_sec2};
//   case 3: {fnf_gamemode_sectors pushBack fnf_sec1; fnf_gamemode_sectors pushBack fnf_sec2; fnf_gamemode_sectors pushBack fnf_sec3};
// };
[] remoteExec ["BIS_fnc_showMissionStatus",0,true];

fnf_briefingTable_highlightAreas = []; // contains places that should be highlighted with a sphere
private _objectives = [];
{
  _objectives pushBack [format["Sector %1", _forEachIndex + 1], getPos _x];
  fnf_briefingTable_highlightAreas pushBack [getPos _x, ((triggerArea _x)#0) max ((triggerArea _x)#1)];
} forEach fnf_gamemode_sectors;
[_objectives] call fnf_briefing_fnc_setupTables;
publicVariable "fnf_briefingTable_highlightAreas";

fnf_specObjectives = [];
publicVariable "fnf_specObjectives";

fnf_server_sectorWin = {
  fnf_gameEnd = true;
  publicVariable "fnf_gameEnd";

  [fnf_attackingSide, "has captured all sectors and wins!"] spawn fnf_server_fnc_gameEnd;
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

    if (fnf_gamemode_sectorInOrder) then {
      waitUntil {fnf_gamemode_capNum == (_sectorNum - 1)};
    };

    switch (fnf_defendingSide) do {
      case east: {_mark setMarkerColor "ColorEAST"};
      case west: {_mark setMarkerColor "ColorWEST"};
      case independent: {_mark setMarkerColor "ColorGUER"};
      default {"ColorCIV"};
    };

    private _defColorHTML = ([fnf_defendingSide, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBAtoHTML;
    private _defColorStr = ([fnf_defendingSide, true] call BIS_fnc_sideColor);
    private _atkColorHTML = ([fnf_attackingSide, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBAtoHTML;
    private _atkColorStr = ([fnf_attackingSide, true] call BIS_fnc_sideColor);

    _dTask = "dtask" + str(_sectorNum);
    _aTask = "atask" + str(_sectorNum);
    _dTaskTitle = "Defend Sector " + str(_sectorNum);
    _aTaskTitle = "Capture Sector " + str(_sectorNum);

    [fnf_defendingSide, [_dTask], [_dTaskTitle, _dTaskTitle, ""], getPos _sector, "AUTOASSIGNED"] call BIS_fnc_taskCreate;
    [fnf_attackingSide, [_aTask], [_aTaskTitle, _aTaskTitle, ""], getPos _sector, "AUTOASSIGNED"] call BIS_fnc_taskCreate;

    _units = [];

    while {alive _sector && !fnf_gameEnd} do {
      _dPresent = false;
      _aPresent = false;

      _units = allUnits inAreaArray _sector;

      {
        if (_x call BIS_fnc_objectSide == fnf_defendingSide && vehicle _x isKindOf "Man" && lifeState _x != "INCAPACITATED" && !isObjectHidden _x && ([_x] call ace_common_fnc_isAwake)) then {
          _dPresent = true;
        };
        if (_x call BIS_fnc_objectSide == fnf_attackingSide && vehicle _x isKindOf "Man" && lifeState _x != "INCAPACITATED" && !isObjectHidden _x && ([_x] call ace_common_fnc_isAwake)) then {
          _aPresent = true;
        };
      } forEach _units;

      if (_aPresent && !_dPresent) then {
        fnf_gamemode_capNum = fnf_gamemode_capNum + 1;

        [
          _sectorNum - 1, // id
          format["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>",_sectorNum], // text
          "\A3\ui_f\data\map\markers\nato\n_installation.paa", // texture
          [fnf_attackingSide, false] call BIS_fnc_sideColor, // color
          0, // fade
          getPosATL _sector, // position
          100 // barHeight (progress)
        ] remoteExec ["BIS_fnc_setMissionStatusSlot",0];

        deleteVehicle _sector;
        // deleteMarker _textMark;
        _textMark setMarkerText format["Sector %1 - Captured", _sectorNum];
        [_mark,_atkColorStr,7] spawn BIS_fnc_changeColorMarker;
        // [{deleteMarker _this},_mark,10] call CBA_fnc_waitAndExecute;

        [_dTask,"FAILED"] call BIS_fnc_taskSetState;
        [_aTask,"SUCCEEDED"] call BIS_fnc_taskSetState;

        if (fnf_gamemode_capNum >= fnf_gamemode_sectorNum) then {call fnf_server_sectorWin} else {
          [format[
            "<t align='center'>Attackers have captured Sector %1</t>",
            (str _sectorNum)
          ]] remoteExec ["fnf_fnc_hintThenClear",0,false];
        };
      } else {
        [
          _sectorNum - 1, // id
          format["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>",_sectorNum], // text
          "\A3\ui_f\data\map\markers\nato\n_installation.paa", // texture
          [fnf_defendingSide, false] call BIS_fnc_sideColor, // color
          0, // fade
          getPosATL _sector, // position
          0 // barHeight (progress)
        ] remoteExec ["BIS_fnc_setMissionStatusSlot",0];
      };

      sleep 3;
    };
  };
} forEach fnf_gamemode_sectors;
