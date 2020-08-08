//Hides markers the client shouldn't be able to see.

_opforMark = "opforSafeMarker";
_bluforMark = "bluforSafeMarker";
_indforMark = "indforSafeMarker";

_handleMarker = {
  if !(getMarkerColor _this isEqualTo "") then {
    _this setMarkerAlphaLocal 0;
  };
};

if (phx_gameMode != "connection" && phx_gameMode != "neutralSector") exitWith {};

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
