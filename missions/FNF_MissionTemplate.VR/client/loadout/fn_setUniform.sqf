#include "cfgLoadouts.hpp"

#include "uniforms\longRadio.sqf"

switch (pUniform) do {
    case UNIFORM_MARPAT_WD: {
      #include "uniforms\UNIFORM_MARPAT_WD.sqf"
    };
    case UNIFORM_MARPAT_D: {
      #include "uniforms\UNIFORM_MARPAT_D.sqf"
    };
    case UNIFORM_OCP: {
      #include "uniforms\UNIFORM_OCP.sqf"
    };
    case UNIFORM_G3_BLACK: {
      #include "uniforms\UNIFORM_G3_BLACK.sqf"
    };
    case UNIFORM_TTSKO_FOREST: {
      #include "uniforms\UNIFORM_TTSKO_FOREST.sqf"
    };
    case UNIFORM_EMR_DESERT: {
    #include "uniforms\UNIFORM_EMR_DESERT.sqf"
    };
    case UNIFORM_EMR_SUMMER: {
      #include "uniforms\UNIFORM_EMR_SUMMER.sqf"
    };
    case UNIFORM_COLDWAR_ERA_1: {
      #include "uniforms\UNIFORM_COLDWAR_ERA_1.sqf"
    };
    case UNIFORM_M88_MOUNTAIN_LES: {
      #include "uniforms\UNIFORM_M88_MOUNTAIN_LES.sqf"
    };
    case UNIFORM_M93_OAKLEAF: {
      #include "uniforms\UNIFORM_M93_OAKLEAF.sqf"
    };
    case UNIFORM_M93_FLECKTARN: {
      #include "uniforms\UNIFORM_M93_FLECKTARN.sqf"
    };
    case UNIFORM_M93_WOODLAND: {
      #include "uniforms\UNIFORM_M93_WOODLAND.sqf"
    };
    case UNIFORM_SPECTER_S_FLORA: {
      #include "uniforms\UNIFORM_SPECTER_S_FLORA.sqf"
    };
    case UNIFORM_AAF: {
      #include "uniforms\UNIFORM_AAF.sqf"
    };
    case UNIFORM_CSAT_HEX: {
      #include "uniforms\UNIFORM_CSAT_HEX.sqf"
    };
    case UNIFORM_CSAT_URBAN: {
      #include "uniforms\UNIFORM_CSAT_URBAN.sqf"
    };
    case UNIFORM_GUERILLA: {
      #include "uniforms\UNIFORM_GUERILLA.sqf"
    };
    case UNIFORM_WETSUIT: {
      #include "uniforms\UNIFORM_WETSUIT.sqf"
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
    case UNIFORM_CIVILIAN_TANOA: {
      #include "uniforms\UNIFORM_CIVILIAN_TANOA.sqf"
    };
    case UNIFORM_CIVILIAN: {
      #include "uniforms\UNIFORM_CIVILIAN.sqf"
    };
    default {};
};
