/*
Kills the player if they are outside of the mission boundary for too long.
*/

fnf_zoneTimer = 15;

[{getClientStateNumber > 8}, {
  if (!isNil "fnf_zonePFH") then {
      [fnf_zonePFH] call CBA_fnc_removePerFrameHandler;
      fnf_zonePFH = nil;
  };
  fnf_zonePFH = [{
    if !(alive player) exitWith {};
    if (!(vehicle player inArea zoneTrigger) && !(vehicle player isKindOf "Air")) then {
      if (fnf_zoneTimer == 0) exitWith {fnf_zonePFH call CBA_fnc_removePerFrameHandler; titleText ["", "PLAIN"]; player setDamage 1};
      _msg = format ["You have %1 seconds to get back into the mission zone.", fnf_zoneTimer];
      titleText [_msg, "PLAIN"];
      fnf_zoneTimer = fnf_zoneTimer - 1;
    } else {
      if (fnf_zoneTimer != 15) then {
        fnf_zoneTimer = 15;
        titleText ["", "PLAIN"];
      };
    };
  }, 1, []] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

