params["_markerList", "_markerColorClass"];

_polyline = createMarkerLocal [(_markerList select 0) + "_polyline", [0,0,0], -1];
_polyline setMarkerShapeLocal "POLYLINE";
_polyline setMarkerColorLocal _markerColorClass;

_polylinePositions = [];

{
  _x setMarkerTypeLocal "Empty";
  _x setMarkerTextLocal "";
  _markerPos = getMarkerPos _x;
  _polylinePositions pushBack (_markerPos select 0);
  _polylinePositions pushBack (_markerPos select 1);
} forEach _markerList;

_firstMarkerPos = getMarkerPos (_markerList select 0);
_polylinePositions pushBack (_firstMarkerPos select 0);
_polylinePositions pushBack (_firstMarkerPos select 1);

_polyline setMarkerPolylineLocal _polylinePositions;
