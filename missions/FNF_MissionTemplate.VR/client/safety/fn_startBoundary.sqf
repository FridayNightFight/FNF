switch (playerSide) do {
  case east: {
    phx_startZoneMarker = "opforSafeMarker";
  };
  case west: {
    phx_startZoneMarker = "bluforSafeMarker";
  };
  case independent: {
    phx_startZoneMarker = "indforSafeMarker";
  };
};

phx_startZoneMaxTime = 5;
phx_startZoneTimer = phx_startZoneMaxTime;

phx_startPFH = [{
  if (!phx_safetyEnabled || !(alive player)) exitWith {phx_startPFH call CBA_fnc_removePerFrameHandler; hintSilent ""};
  if !(vehicle player inArea phx_startZoneMarker) then {
    if (phx_startZoneTimer == 0) exitWith {vehicle player setPos (getMarkerPos phx_startZoneMarker findEmptyPosition [0, 100, typeOf vehicle player]); phx_startZoneTimer = phx_startZoneMaxTime; hintSilent ""};
    hintSilent format ["You have %1 seconds to get back into the starting zone.", phx_startZoneTimer];
    phx_startZoneTimer = phx_startZoneTimer - 1;
  } else {
    if (phx_startZoneTimer != phx_startZoneMaxTime) then {
      phx_startZoneTimer = phx_startZoneMaxTime;
      hintSilent "";
    };
  };
}, 1, []] call CBA_fnc_addPerFrameHandler;
