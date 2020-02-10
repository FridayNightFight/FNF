//Make sure player stays inside safe start markers
_side = side player;
startMarkers = [];
safeZoneWarning = false;
playerInStart = true;

switch (_side) do {
  case east: {
    startMarkers = ["opforSafeMarker"];
  };
  case west: {
    startMarkers = ["bluforSafeMarker"];
  };
  case independent: {
    startMarkers = ["indforSafeMarker"];
  };
};

notInStart = {
  _timeAllowed = 15;
  while {!playerInStart && alive player && phx_safeStartEnabled} do {
    for [{_i=_timeAllowed}, {_i>0}, {_i=_i-1}] do {
      if (playerInStart || !phx_safeStartEnabled) exitWith {safeZoneWarning = false; hintSilent "sad"};
      hintSilent format ["You have %1 seconds to get back into the safe zone.", _i];
      sleep 1;
    };
    if (!playerInStart && phx_safeStartEnabled) then {
      safeZoneWarning = false;
      player setDamage 1;
    };
  };
  hintSilent "";
};

safeStartZonePFH = [{
  _pos = getPos vehicle player;
  for [{_i=0}, {_i<=(count startMarkers)-1}, {_i=_i+1}] do {
    if (_pos inArea (startMarkers select _i)) then {
      playerInStart = true;
    } else {
      playerInStart = false;
    };
    if (playerInStart) exitWith {};
  };
  if (playerInStart) exitWith {};
  if (!playerInStart && !safeZoneWarning) then {
    [] spawn notInStart;
    safeZoneWarning = true;
  };
  }, 0.5, []] call CBA_fnc_addPerFrameHandler;
