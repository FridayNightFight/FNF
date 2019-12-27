if (!isServer || !phx_safeStartEnabled) exitWith {};

if !(getMarkerColor "opforSafeMarker" isEqualTo "") then {
  ["opforSafeMarker"] remoteExec ["deleteMarker",0,true];
};
if !(getMarkerColor "bluforSafeMarker" isEqualTo "") then {
  ["bluforSafeMarker"] remoteExec ["deleteMarker",0,true];
};
if !(getMarkerColor "indforSafeMarker" isEqualTo "") then {
  ["indforSafeMarker"] remoteExec ["deleteMarker",0,true];
};

phx_safeStartEnabled = false;
