phx_zoneWarning = false;
phx_playerInZone = true;

phx_notInZone = {
  _timeAllowed = 20;
  while {!phx_playerInZone && alive player} do {
    for [{_i=_timeAllowed}, {_i>0}, {_i=_i-1}] do {
      if (vehicle player inArea zoneTrigger) exitWith {phx_playerInZone = true; phx_zoneWarning = false; hintSilent ""};
      hintSilent format ["You have %1 seconds to get back into the mission zone.", _i];
      sleep 1;
    };
    if (!phx_playerInZone) then {
      phx_safeZoneWarning = false;
      player setDamage 1;
    };
  };
  hintSilent "";
};

zonePFH = [{
  if (!(vehicle player inArea zoneTrigger) && !(vehicle player isKindOf "Air")) then {
    phx_playerInZone = false;
  };
  if (!phx_playerInZone && !phx_zoneWarning) then {
    [] spawn phx_notInZone;
    phx_zoneWarning = true;
  };
}, 1, []] call CBA_fnc_addPerFrameHandler;
