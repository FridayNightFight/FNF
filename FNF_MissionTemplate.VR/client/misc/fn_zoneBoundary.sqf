if (!phx_missionBoundaryRestriction) exitWith {};

phx_zoneTimer = 15;

phx_zonePFH = [{
  if !(alive player) exitWith {if (phx_zoneTimer < 15) then {hintSilent "";}; phx_zonePFH call CBA_fnc_removePerFrameHandler;};
  if (!(vehicle player inArea zoneTrigger) && !(vehicle player isKindOf "Air")) then {
    if (phx_zoneTimer == 0) exitWith {phx_zonePFH call CBA_fnc_removePerFrameHandler; hintSilent ""; player setDamage 1};
    hintSilent format ["You have %1 seconds to get back into the mission zone.", phx_zoneTimer];
    phx_zoneTimer = phx_zoneTimer - 1;
  } else {
    if (phx_zoneTimer != 15) then {
      phx_zoneTimer = 15;
      hintSilent "";
    };
  };
}, 1, []] call CBA_fnc_addPerFrameHandler;
