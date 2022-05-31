phx_loadout_lrRadio = "";

switch (playerSide) do {
  case east: {phx_loadout_lrRadio = "B_LIB_SOV_RA_Radio"};
  case west: {phx_loadout_lrRadio = "B_LIB_GER_Radio"};
  case independent: {phx_loadout_lrRadio = "B_LIB_US_Radio"};
};

_incStr = "client\loadout\uniforms\" + pUniform + ".sqf";
call compile preprocessFileLineNumbers _incStr;

if (pRole in [ROLE_PL,ROLE_SL,ROLE_TL,ROLE_MGTL]) then {phx_loadout_backpack = phx_loadout_lrRadio};
if (pRole == ROLE_CR && ((leader group player) == player)) then {
  phx_loadout_backpack = phx_loadout_lrRadio;
};
