/*
Hide enemy start zone markers if config is set to do so
*/

if (isNil "phx_enemyStartVisible") exitWith {};

// Don't run for SA
if (phx_gameMode == "sustainedAssault") exitWith {};

//Ensure that players don't see start zone markers in neutral objective types, regardless of setting in config
if (phx_gameMode == "connection" || phx_gameMode == "neutralSector") then {phx_enemyStartVisible = false};
if (phx_enemyStartVisible) exitWith {};

//Hides markers the client shouldn't be able to see.
_opforMarks = [nil, east, true] call phx_fnc_inSafeZone;
_bluforMarks = [nil, west, true] call phx_fnc_inSafeZone;
_indforMarks = [nil, independent, true] call phx_fnc_inSafeZone;

_handleMarker = {
  if !(getMarkerColor _this isEqualTo "") then {
    _this setMarkerAlphaLocal 0;
  };
};
switch (playerSide) do {
  case west: {
    {_x call _handleMarker} forEach _opforMarks;
    {_x call _handleMarker} forEach _indforMarks;
  };
  case east: {
    {_x call _handleMarker} forEach _bluforMarks;
    {_x call _handleMarker} forEach _indforMarks;
  };
  case independent: {
    {_x call _handleMarker} forEach _bluforMarks;
    {_x call _handleMarker} forEach _opforMarks;
  };
  default {
    {_x call _handleMarker} forEach _bluforMarks;
    {_x call _handleMarker} forEach _opforMarks;
    {_x call _handleMarker} forEach _indforMarks;
  };
};
