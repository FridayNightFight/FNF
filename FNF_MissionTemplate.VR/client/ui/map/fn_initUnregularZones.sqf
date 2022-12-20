if (isNil "zoneTrigger") then {
  _boundryMarkers = [];
  _markerLimitEndFound = false;
  _i = 1;
  while {!_markerLimitEndFound} do {
    private _markerName = format["fnf_custom_zoneBoundary_1_marker_%1", _i];
    if (markerShape _markerName != "") then {
     _boundryMarkers pushBack (_markerName);
    } else {
      _markerLimitEndFound = true;
    };
    _i = _i + 1;
  };
  [_boundryMarkers, [0,0,0,0.5], true] call fnf_ui_fnc_triangulateAndShadePolygon;
};
