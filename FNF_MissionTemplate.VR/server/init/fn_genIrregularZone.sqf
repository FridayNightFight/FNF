fnf_zoneBoundary_boundsLine_marker_1 = createMarkerLocal ["fnf_zoneBoundary_boundsLine_1", [0,0,0], -1];
fnf_zoneBoundary_boundsLine_marker_1 setMarkerShapeLocal "POLYLINE";
fnf_zoneBoundary_boundsLine_marker_1 setMarkerColorLocal "ColorBLACK";

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

true
