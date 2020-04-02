_fortifyMarker = "";
_playerItems = [];
player addItem "ACE_Fortify";

switch (playerSide) do {
  case east: {_fortifyMarker = "opforSafeMarker";};
  case west: {_fortifyMarker = "bluforSafeMarker";};
  case independent: {_fortifyMarker = "indforSafeMarker";};
};

while {phx_safeStartEnabled} do {
  _playerItems = items player;
  if (position player inArea _fortifyMarker) then {
    if !("ACE_Fortify" in _playerItems) then {
      player addItem "ACE_Fortify";
    };
  } else {
    if ("ACE_Fortify" in _playerItems) then {
      player removeItem "ACE_Fortify";
    };
  };

  sleep 1;
};

player removeItem "ACE_Fortify";
