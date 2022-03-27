fnf_zoneBoundary_boundsLine_marker_1 = createMarkerLocal ["fnf_zoneBoundary_boundsLine_1", [0,0,0], -1];
fnf_zoneBoundary_boundsLine_marker_1 setMarkerShapeLocal "POLYLINE";
fnf_zoneBoundary_boundsLine_marker_1 setMarkerColorLocal "ColorBLACK";
fnf_zoneBoundary_boundsLine_marker_2 = createMarkerLocal ["fnf_zoneBoundary_boundsLine_2", [0,0,0], -1];
fnf_zoneBoundary_boundsLine_marker_2 setMarkerShapeLocal "POLYLINE";
fnf_zoneBoundary_boundsLine_marker_2 setMarkerColorLocal "ColorYELLOW";

fnf_zoneBoundary_boundaryMarks = [];
fnf_zoneBoundary_boundaryPos = [];

for "_i" from 1 to 50 do {
  private _markerName = format["fnf_zoneBoundary_marker_%1", _i];
  if (markerShape _markerName != "") then {
    _markerName setMarkerTypeLocal "mil_box_noShadow";
    // _markerName setMarkerAlphaLocal 0.2;
    _markerName setMarkerSizeLocal [0.5, 0.5];
    _markerName setMarkerText "";
    fnf_zoneBoundary_boundaryMarks pushBack (_markerName);
    fnf_zoneBoundary_boundaryPos pushBack (markerPos _markerName);
  };
};

publicVariable "fnf_zoneBoundary_boundaryMarks";
publicVariable "fnf_zoneBoundary_boundaryPos";
publicVariable "fnf_zoneBoundary_boundsLine_marker_1";
publicVariable "fnf_zoneBoundary_boundsLine_marker_2";


if (count fnf_zoneBoundary_boundaryMarks < 3) exitWith {
  "[FNF] (ZoneBoundary) Warning: If not using zoneTrigger, must place at least 3 ""fnf_zoneBoundary_marker_x"" markers" remoteExecCall ["systemChat", 0, true];
};

// change format to be compatible with setMarkerPolyline
fnf_zoneBoundary_boundsLine_points_1 = [];
{
  if (_forEachIndex + 1 < (count fnf_zoneBoundary_boundaryPos)) then {
    fnf_zoneBoundary_boundsLine_points_1 append (_x select [0, 2]);
    fnf_zoneBoundary_boundsLine_points_1 append ((fnf_zoneBoundary_boundaryPos select (_forEachIndex + 1)) select [0, 2]);
  } else {
    fnf_zoneBoundary_boundsLine_points_1 append (_x select [0, 2]);
    fnf_zoneBoundary_boundsLine_points_1 append ((fnf_zoneBoundary_boundaryPos select 0) select [0, 2]);
  }
} forEach fnf_zoneBoundary_boundaryPos;

// make first border
fnf_zoneBoundary_boundsLine_marker_1 setMarkerPolyline fnf_zoneBoundary_boundsLine_points_1;

// make second border/outline
// find midpoint between two safezones

// get safezones
private _safeZonePositions = [];
if !(sideEmpty in [fnf_attackingSide, fnf_defendingSide]) then {
  {
    _safeZonePositions pushBack selectRandom([nil, _x, true] call fnf_fnc_inSafeZone);
  } forEach [fnf_attackingSide, fnf_defendingSide];
} else {
  {
    _safeZonePositions pushBack selectRandom([nil, _x, true] call fnf_fnc_inSafeZone);
  } forEach ([west, east, independent] select {playableSlotsNumber _x > 4});
};

// get midpoints between each zone
_safeZoneMidPositions = [];
_safeZonePositions = _safeZonePositions apply {getMarkerPos _x};
{
  private _markerPos1 = _x;
  {
    private _markerPos2 = _x;
    _safeZoneMidPositions pushBack [(_markerPos1#0 + _markerPos2#0)/2, (_markerPos1#1 + _markerPos2#1)/2];
  } forEach _safeZonePositions;
} forEach _safeZonePositions;

private _areaCenter = [];
_temp = 0;
_tempCount = count _safeZoneMidPositions;
_safeZoneMidPositions apply {_x # 0} apply {_temp = _temp + _x};
_areaCenter pushBack (_temp/_tempCount);
_temp = 0;
_safeZoneMidPositions apply {_x # 1} apply {_temp = _temp + _x};
_areaCenter pushBack (_temp/_tempCount);

private _outlineCoords = fnf_zoneBoundary_boundaryPos apply {_areaCenter getPos [(_areaCenter distance _x) + 15, _areaCenter getDir _x]};
fnf_zoneBoundary_boundsLine_points_2 = [];
{
  if (_forEachIndex + 1 < (count fnf_zoneBoundary_boundaryPos)) then {
    fnf_zoneBoundary_boundsLine_points_2 append (_x select [0, 2]);
    fnf_zoneBoundary_boundsLine_points_2 append ((_outlineCoords select (_forEachIndex + 1)) select [0, 2]);
  } else {
    fnf_zoneBoundary_boundsLine_points_2 append (_x select [0, 2]);
    fnf_zoneBoundary_boundsLine_points_2 append ((_outlineCoords select 0) select [0, 2]);
  }
} forEach _outlineCoords;

fnf_zoneBoundary_boundsLine_marker_2 setMarkerPolyline fnf_zoneBoundary_boundsLine_points_2;

true
