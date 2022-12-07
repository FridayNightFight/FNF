params["_markerList", "_output"];
if (count _markerList < 3) exitWith {hint "invalid marker list"};
if (count _markerList == 3) exitWith {_output pushBack _markerList};
{
  _prevMarker = "";
  _nextMarker = "";
  _marker = _x;
  if (_forEachIndex == 0) then
  {
    _prevMarker = _markerList select ((count _markerList) - 1);
  } else {
    _prevMarker = _markerList select (_forEachIndex - 1);
  };
  if (_forEachIndex == (count _markerList) - 1) then
  {
    _nextMarker = _markerList select 0;
  } else {
    _nextMarker = _markerList select (_forEachIndex + 1);
  };
  _markerPos = getMarkerPos _marker;
  _prevMarkerPos = getMarkerPos _prevMarker;
  _nextMarkerPos = getMarkerPos _nextMarker;

  _avgX = ((_markerPos select 0) + (_prevMarkerPos select 0) + (_nextMarkerPos select 0)) / 3;
  _avgY = ((_markerPos select 1) + (_prevMarkerPos select 1) + (_nextMarkerPos select 1)) / 3;
  _currentPolygon = [];

  {
    _currentPolygon pushBack (getMarkerPos _x);
  } forEach _markerList;

  if ([_avgX, _avgY, 0] inPolygon _currentPolygon) then
  {
    _foundInPolygon = false;
    {
      _tempMarkerPos = getMarkerPos _x;
      if (_x != _marker and _x != _prevMarker and _x != _nextMarker and _tempMarkerPos isNotEqualTo _markerPos and _tempMarkerPos isNotEqualTo _nextMarkerPos and _tempMarkerPos isNotEqualTo _prevMarkerPos) then
      {
        if ((getMarkerPos _x) inPolygon [_prevMarkerPos, _markerPos, _nextMarkerPos]) then {
          _foundInPolygon = true;
        };
      };
    } forEach _markerList;
    if (not _foundInPolygon) then
    {
      _output pushBack [_prevMarker, _marker, _nextMarker];
      _markerList deleteAt _forEachIndex;
      if (count _markerList == 3) then
      {
        _output pushBack _markerList;
      } else {
        [_markerList, _output] call fnf_ui_fnc_triangulatePolygon;
      };
      break;
    };
  };
} forEach _markerList;
