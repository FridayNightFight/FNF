#include "cfgLoadouts.hpp"

_lrRadio = "";

switch (playerSide) do {
  case east: {pUniform = phx_opforUniform; _lrRadio = "tf_mr3000_bwmod"};
  case west: {pUniform = phx_bluforUniform; _lrRadio = "tf_rt1523g_black"};
  case independent: {pUniform = phx_indforUniform; _lrRadio = "tf_anprc155_coyote"};
  case civilian: {pUniform = phx_civUniform};
};

switch (pUniform) do {
    case UNIFORM_MARPAT_WD: {
      #include "uniforms\UNIFORM_MARPAT_WD.sqf"
    };
    case UNIFORM_MARPAT_D: {
      #include "uniforms\UNIFORM_MARPAT_D.sqf"
    };
    case UNIFORM_EMR_DESERT: {
    #include "uniforms\UNIFORM_EMR_DESERT.sqf"
    };
    case UNIFORM_EMR_SUMMER: {
      #include "uniforms\UNIFORM_EMR_SUMMER.sqf"
    };
    case UNIFORM_M93_OAKLEAF: {
      #include "uniforms\UNIFORM_M93_OAKLEAF.sqf"
    };
    case UNIFORM_CUSTOM_1: {
      #include "uniforms\UNIFORM_CUSTOM_1.sqf"
    };
    case UNIFORM_CUSTOM_2: {
      #include "uniforms\UNIFORM_CUSTOM_2.sqf"
    };
    case UNIFORM_CUSTOM_3: {
      #include "uniforms\UNIFORM_CUSTOM_3.sqf"
    };
    case UNIFORM_CIVILIAN: {
      #include "uniforms\UNIFORM_CIVILIAN.sqf"
    };
    default {};
};
