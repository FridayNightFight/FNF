/*
Forces the player to stay within their starting zone until safe start ends.
*/

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
phx_startLastGoodPos = position vehicle player;

phx_startPFH = [{
  if (!phx_safetyEnabled || !(alive player)) exitWith {phx_startPFH call CBA_fnc_removePerFrameHandler; titleText ["", "PLAIN"]};
  if !(vehicle player inArea phx_startZoneMarker) then {
    if (phx_startZoneTimer == 0) exitWith {(vehicle player) setPosASL phx_startLastGoodPos; phx_startZoneTimer = phx_startZoneMaxTime; titleText ["", "PLAIN"]};
    _msg = format ["You have %1 seconds to get back into the starting zone.", phx_startZoneTimer];
    titleText [_msg, "PLAIN"];
    phx_startZoneTimer = phx_startZoneTimer - 1;
  } else {
    if (phx_startZoneTimer != phx_startZoneMaxTime) then {
      phx_startZoneTimer = phx_startZoneMaxTime;
      titleText ["", "PLAIN"];
    };
    phx_startLastGoodPos = getPosASL vehicle player;
  };
}, 1, []] call CBA_fnc_addPerFrameHandler;
