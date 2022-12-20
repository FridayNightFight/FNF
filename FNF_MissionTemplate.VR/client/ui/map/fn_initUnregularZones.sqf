if (isNil "zoneTrigger") then {
  _boundryMarkers = [];
  {
    if (_x regexMatch "^fnf_custom_zoneBoundary_1_marker_\d+$") then
    {
      _boundryMarkers pushBack (_x);
    };
  } forEach allMapMarkers;
  [_boundryMarkers, [0,0,0,0.5], true] call fnf_ui_fnc_triangulateAndShadePolygon;
  [_boundryMarkers, "ColorBlack"] call fnf_ui_fnc_genPolylineFromMarkers;
} else {
  _markersToDelete = [];
  {
    if (_x regexMatch "^fnf_custom_zoneBoundary_1_marker_\d+$") then
    {
      _markersToDelete pushBack _x;
    };
  } forEach allMapMarkers;
  {
    deleteMarkerLocal _x;
  } forEach _markersToDelete;
};
