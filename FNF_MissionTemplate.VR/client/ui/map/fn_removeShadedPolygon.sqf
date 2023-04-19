params["_markerToFind"];

deleteMarkerLocal (_markerToFind + "_polyline");

_indexToDelete = -1;

{
  if ((_x select 3) == _markerToFind) then
  {
    _indexToDelete = _forEachIndex;
    break;
  }
} forEach fnf_trianglesToDraw;

fnf_trianglesToDraw deleteAt _indexToDelete
