//Ensure this fnc is only ran once as it's called on both server and client
if (!isNil "phx_safeMarkersRan") exitWith {};
phx_safeMarkersRan = true;

//Create arrays with safe zone markers for each side
phx_bluforSafeMarkers = allMapMarkers select {"bluforSafeMarker" in _x};
phx_opforSafeMarkers = allMapMarkers select {"opforSafeMarker" in _x};
phx_indforSafeMarkers = allMapMarkers select {"indforSafeMarker" in _x};
phx_playerSafeMarkers = [];

if (isDedicated) exitWith {}; //Server doesn't need anything below this

switch (playerSide) do {
  case west: {phx_playerSafeMarkers = phx_bluforSafeMarkers};
  case east: {phx_playerSafeMarkers = phx_opforSafeMarkers};
  case independent: {phx_playerSafeMarkers = phx_indforSafeMarkers};
  default {};
};

//Create markers with text for each safe zone for the player
_markNum = 1;
_localMarks = [];
{
  if (count phx_playerSafeMarkers == 1) exitWith {};

  _marker = createMarkerLocal [_x + "_text_" + str _markNum, getMarkerPos _x];
  _marker setMarkerTypeLocal "mil_dot";
  _marker setMarkerTextLocal format ["Safe Zone %1", _markNum];
  _localMarks pushBack _marker;

  _markNum = _markNum + 1;
} forEach phx_playerSafeMarkers;

//Ensure that players don't see start zone markers in neutral objective types, regardless of setting in config
if (phx_gameMode == "connection" || phx_gameMode == "neutralSector") then {phx_enemyStartVisible = false};

if (!phx_enemyStartVisible) then {
  {_x setMarkerAlphaLocal 0} forEach (allMapMarkers select {"SafeMarker" in _x && !(_x in phx_playerSafeMarkers) && !(_x in _localMarks)});
};

//Delete markers once safety ends (server also handles this, but this is needed to delete the local markers created by this fnc)
[{!phx_safetyEnabled}, {
  {
    deleteMarkerLocal _x;
  } forEach (allMapMarkers select {"SafeMarker" in _x});
}] call CBA_fnc_waitUntilAndExecute;
