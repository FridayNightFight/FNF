#include "cfgLoadouts.hpp"

phx_loadout_lrRadio = "";

switch (playerSide) do {
  case east: {pUniform = phx_opforUniform; phx_loadout_lrRadio = "tf_mr3000_bwmod"};
  case west: {pUniform = phx_bluforUniform; phx_loadout_lrRadio = "tf_rt1523g_black"};
  case independent: {pUniform = phx_indforUniform; phx_loadout_lrRadio = "tf_anprc155_coyote"};
  case civilian: {pUniform = phx_civUniform};
};


_incStr = "client\loadout\uniforms\" + pUniform + ".sqf";

call compile preprocessFileLineNumbers _incStr;
