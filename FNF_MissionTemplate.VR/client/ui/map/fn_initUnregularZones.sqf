if (isNil "zoneTrigger") then {
  _boundryMarkers = [];
  for "_i" from 1 to 50 do {
    private _markerName = format["fnf_zoneBoundary_marker_%1", _i];
    if (markerShape _markerName != "") then {
     _boundryMarkers pushBack (_markerName);
    };
  };
  [_boundryMarkers, [0,0,0,0.5], true] call fnf_ui_fnc_triangulateAndShadePolygon;
};
