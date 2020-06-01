#include "cfgLoadouts.hpp"

phx_loadout_lrRadio = "";

switch (playerSide) do {
  case east: {pUniform = phx_opforUniform};
  case west: {pUniform = phx_bluforUniform};
  case independent: {pUniform = phx_indforUniform};
  case civilian: {pUniform = phx_civUniform};
};


_incStr = "client\loadout\uniforms\" + pUniform + ".sqf";

call compile preprocessFileLineNumbers _incStr;
