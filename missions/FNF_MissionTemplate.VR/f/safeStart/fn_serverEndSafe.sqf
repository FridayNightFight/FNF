if !(getMarkerColor "opforSafeMarker" isEqualTo "") then {
  ["opforSafeMarker"] remoteExec ["deleteMarkerLocal",0,true];
};
if !(getMarkerColor "bluforSafeMarker" isEqualTo "") then {
  ["bluforSafeMarker"] remoteExec ["deleteMarkerLocal",0,true];
};
if !(getMarkerColor "indforSafeMarker" isEqualTo "") then {
  ["indforSafeMarker"] remoteExec ["deleteMarkerLocal",0,true];
};

phx_safeStartEnabled = false;
