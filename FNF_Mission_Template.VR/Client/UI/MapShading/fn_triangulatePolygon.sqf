/*
	Author: Mallen

	Description:
		Takes a list of positions forming a regular polygon and trinagulates it

	Parameter(s):
	  1: ARRAY -  An array of positions forming a regular polygon

	Returns:
		Array of triangles in the format [[pos1,pos2,pos3],[pos1,pos2,pos3]]
*/

params["_posList", "_output"];

if (count _posList < 3) exitWith
{
  if (fnf_debug) then
  {
    systemChat "WARNING: Position list given to triangulation system less than 3";
  };
};

if (count _posList == 3) exitWith
{
  _output pushBack _posList;
  _output;
};

{
  _prevPos = "";
  _nextPos = "";
  _currentPos = _x;
  if (_forEachIndex == 0) then
  {
    _prevPos = _posList select ((count _posList) - 1);
  } else {
    _prevPos = _posList select (_forEachIndex - 1);
  };
  if (_forEachIndex == (count _posList) - 1) then
  {
    _nextPos = _posList select 0;
  } else {
    _nextPos = _posList select (_forEachIndex + 1);
  };

  _avgX = ((_currentPos select 0) + (_prevPos select 0) + (_nextPos select 0)) / 3;
  _avgY = ((_currentPos select 1) + (_prevPos select 1) + (_nextPos select 1)) / 3;
  _currentPolygon = +_posList;

  if ([_avgX, _avgY, 0] inPolygon _currentPolygon) then
  {
    _foundInPolygon = false;
    {
      _tempPos = _x;
      if (_tempPos isNotEqualTo _currentPos and _tempPos isNotEqualTo _prevPos and _tempPos isNotEqualTo _nextPos) then
      {
        if (_tempPos inPolygon [_prevPos, _currentPos, _nextPos]) then {
          _foundInPolygon = true;
          break;
        };
      };
    } forEach _posList;
    if (not _foundInPolygon) then
    {
      _output pushBack [_prevPos, _currentPos, _nextPos];
      _posList deleteAt _forEachIndex;
      if (count _posList == 3) then
      {
        _output pushBack _posList;
      } else {
        [_posList, _output] call FNF_ClientSide_fnc_triangulatePolygon;
      };
      break;
    };
  };
} forEach _posList;
