_side = _this;

switch (_side) do {
  case west: {
    if (!(getMarkerColor "opforSafeMarker" isEqualTo "") && !(_side isEqualTo east)) then {
      "opforSafeMarker" setMarkerAlphaLocal 0;
    };
    if (!(getMarkerColor "indforSafeMarker" isEqualTo "") && !(_side isEqualTo independent)) then {
      "indforSafeMarker" setMarkerAlphaLocal 0;
    };
  };
  case east: {
    if (!(getMarkerColor "bluforSafeMarker" isEqualTo "") && !(_side isEqualTo west)) then {
      "bluforSafeMarker" setMarkerAlphaLocal 0;
    };
    if (!(getMarkerColor "indforSafeMarker" isEqualTo "") && !(_side isEqualTo independent)) then {
      "indforSafeMarker" setMarkerAlphaLocal 0;
    };
  };
  case independent: {
    if (!(getMarkerColor "bluforSafeMarker" isEqualTo "") && !(_side isEqualTo west)) then {
      "bluforSafeMarker" setMarkerAlphaLocal 0;
    };
    if (!(getMarkerColor "opforSafeMarker" isEqualTo "") && !(_side isEqualTo east)) then {
      "opforSafeMarker" setMarkerAlphaLocal 0;
    };
  };
};
