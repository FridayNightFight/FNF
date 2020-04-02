if !(getMarkerColor "opforSafeMarker" isEqualTo "") then {
  ["opforSafeMarker"] remoteExec ["deleteMarkerLocal",0,true];
};
if !(getMarkerColor "bluforSafeMarker" isEqualTo "") then {
  ["bluforSafeMarker"] remoteExec ["deleteMarkerLocal",0,true];
};
if !(getMarkerColor "indforSafeMarker" isEqualTo "") then {
  ["indforSafeMarker"] remoteExec ["deleteMarkerLocal",0,true];
};

_defaultStartMarkers = ["startSelectionMarker_1","startSelectionMarker_2","startSelectionMarker_3","start1Text","start2Text","start3Text"];

{
  if !(getMarkerColor _x isEqualTo "") then {
    [_x] remoteExec ["deleteMarkerLocal", 0, true];
  };
} forEach _defaultStartMarkers;

["off"] call acex_fortify_fnc_handleChatCommand;

phx_safeStartEnabled = false;
publicVariable "phx_safeStartEnabled";
