switch (playerSide) do {
  case east: {pWeapons = phx_opforWeapons};
  case west: {pWeapons = phx_bluforWeapons};
  case independent: {pWeapons = phx_indforWeapons};
};

_incStr = "client\loadout\weapons\" + pWeapons + ".sqf";
call compile preprocessFileLineNumbers _incStr;

//if (pRole in [ROLE_AT,ROLE_AAT]) then {call phx_fnc_setMAT}; //set the MAT weapon and AAT ammo class
