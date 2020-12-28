/*
Hide enemy start zone markers if config is set to do so
*/

if (isNil "phx_enemyStartVisible") exitWith {};

//Ensure that players don't see start zone markers in neutral objective types, regardless of setting in config
if (phx_gameMode == "connection" || phx_gameMode == "neutralSector") then {phx_enemyStartVisible = false};
if (phx_enemyStartVisible) exitWith {};

//Hides markers the client shouldn't be able to see.
_opforMark = "opforSafeMarker";
_bluforMark = "bluforSafeMarker";
_indforMark = "indforSafeMarker";

_handleMarker = {
  if !(getMarkerColor _this isEqualTo "") then {
    _this setMarkerAlphaLocal 0;
  };
};
switch (playerSide) do {
  case west: {
    _opforMark call _handleMarker;
    _indforMark call _handleMarker;
  };
  case east: {
    _bluforMark call _handleMarker;
    _indforMark call _handleMarker;
  };
  case independent: {
    _bluforMark call _handleMarker;
    _opforMark call _handleMarker;
  };
  default {
    _bluforMark call _handleMarker;
    _opforMark call _handleMarker;
    _indforMark call _handleMarker;
  };
};
