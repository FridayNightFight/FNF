zoneWarning = false;
playerInZone = true;

notInZone = {
  _timeAllowed = 15;
  while {!playerInZone && alive player} do {
    for [{_i=_timeAllowed}, {_i>0}, {_i=_i-1}] do {
      if (vehicle player inArea zoneTrigger) exitWith {playerInZone = true; zoneWarning = false; hintSilent ""};
      hintSilent format ["You have %1 seconds to get back into the mission zone.", _i];
      sleep 1;
    };
    if (!playerInZone) then {
      safeZoneWarning = false;
      player setDamage 1;
    };
  };
  hintSilent "";
};

zonePFH = [{
  if !(vehicle player inArea zoneTrigger) then {
    playerInZone = false;
  };
  if (!playerInZone && !zoneWarning) then {
    [] spawn notInZone;
    zoneWarning = true;
  };
}, 1, []] call CBA_fnc_addPerFrameHandler;
