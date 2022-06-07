if (!isServer) exitWith {};

_polygonMarkers = allMapMarkers select {"phx_zonePoly" in _x};
_usingPolygon = count _polygonMarkers > 2;
phx_zoneBoundary_polygon = [];

//Sort the polygon markers in ascending order by marker number
_arrSplit = _polygonMarkers apply {_x splitString "_"};
_markerNums = _arrSplit apply {parseNumber (_x select 2)};
_markerNums sort true;

_markersSorted = _markerNums apply {"phx_zonePoly_" + str _x};

{
  phx_zoneBoundary_polygon pushBack (getMarkerPos _x);
} forEach _markersSorted;

publicVariable "phx_zoneBoundary_polygon";

{deleteMarker _x} forEach _polygonMarkers;

//Boundary via zone trigger
_zoneTrigger = missionNamespace getVariable ["zoneTrigger",objNull];

if (!isNull _zoneTrigger && !_usingPolygon) then {
  private _zoneArea = triggerArea _zoneTrigger;
  _zoneTrigger setVariable ["objectArea", [_zoneArea select 0, _zoneArea select 1, _zoneArea select 2]];
  [_zoneTrigger,[],true] call BIS_fnc_moduleCoverMap;
} else {
  deleteVehicle (missionNamespace getVariable ["zoneTrigger",objNull]);
};

//Polyline boundary
if (_usingPolygon) then {
  _mark = createMarkerLocal ["polyMark", phx_zoneBoundary_polygon select 0];
  _mark setMarkerShapeLocal "polyline";

  _drawArr = flatten (phx_zoneBoundary_polygon apply {_x select [0,2]});
  _drawArr pushBack ((phx_zoneBoundary_polygon select 0) select 0);
  _drawArr pushBack ((phx_zoneBoundary_polygon select 0) select 1);

  _mark setMarkerPolyline _drawArr;
};

if (!_usingPolygon && isNull _zoneTrigger) then {["No zone boundary detected. You need to use either the zone trigger or the markers."] call bis_fnc_error};
