phx_loadout_lrRadio = "";

switch (phx_playerSide) do {
  case east: {pUniform = phx_opforUniform; phx_loadout_lrRadio = "TFAR_mr3000_rhs"};
  case west: {pUniform = phx_bluforUniform; phx_loadout_lrRadio = "TFAR_rt1523g_black"};
  case independent: {pUniform = phx_indforUniform; phx_loadout_lrRadio = "TFAR_anprc155_coyote"};
};

_incStr = "client\loadout\uniforms\" + pUniform + ".sqf";
call compile preprocessFileLineNumbers _incStr;

if (pRole in [ROLE_PL,ROLE_SL,ROLE_P]) then {phx_loadout_backpack = phx_loadout_lrRadio};
