/*
Kills the player if they are outside of the mission boundary for too long.
*/

phx_zoneTimer = 15;

phx_zonePFH = [{
  if !(alive player) exitWith {if (phx_zoneTimer < 15) then {titleText ["", "PLAIN"];}; phx_zonePFH call CBA_fnc_removePerFrameHandler;};

  _condition =
  vehicle player inArea (missionNamespace getVariable ["zoneTrigger",objNull]) ||
  getpos (vehicle player) inPolygon (missionNamespace getVariable ["phx_zoneBoundary_polygon",[]]) ||
  vehicle player isKindOf "Air";

  if (!_condition) then {
    if (phx_zoneTimer == 0) exitWith {phx_zonePFH call CBA_fnc_removePerFrameHandler; titleText ["", "PLAIN"]; player setDamage 1};
    _msg = format ["You have %1 seconds to get back into the mission zone.", phx_zoneTimer];
    titleText [_msg, "PLAIN"];
    phx_zoneTimer = phx_zoneTimer - 1;
  } else {
    if (phx_zoneTimer != 15) then {
      phx_zoneTimer = 15;
      titleText ["", "PLAIN"];
    };
  };
}, 1, []] call CBA_fnc_addPerFrameHandler;
