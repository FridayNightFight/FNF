params["_markerList"];

_safeMarkerList = true;

{
  if (getMarkerColor _x == "") then
  {
    _safeMarkerList = false;
  };
} forEach _markerList;

if (!_safeMarkerList) exitWith {};

deleteMarkerLocal ((_markerList select 0) + "_polyline");

_outputsToUse = [];

[_markerList, _outputsToUse] call fnf_ui_fnc_triangulatePolygon;

_indexsToDelete = [];
{
  _triangleChecking = _x;
  {
    if (_triangleChecking isEqualTo (_x select 0)) then
    {
      _indexsToDelete pushBack _forEachIndex;
    };
  } forEach fnf_trianglesToDraw;
} forEach _outputsToUse;

_indexsToDelete sort true;

_indexOffset = 0;
{
  fnf_trianglesToDraw deleteAt (_x - _indexOffset);
  _indexOffset = _indexOffset + 1;
} forEach _indexsToDelete;
