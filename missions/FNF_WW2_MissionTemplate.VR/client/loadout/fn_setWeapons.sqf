switch (playerSide) do {
  case east: {pWeapons = phx_opforWeapons};
  case west: {pWeapons = phx_bluforWeapons};
  case independent: {pWeapons = phx_indforWeapons};
  case civilian: {pWeapons = phx_civWepaons};
};

_incStr = "client\loadout\weapons\" + pWeapons + ".sqf";

call compile preprocessFileLineNumbers _incStr;
