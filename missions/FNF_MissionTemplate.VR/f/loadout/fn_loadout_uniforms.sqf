#include "cfgLoadouts.hpp"

#include "uniformloadouts\longRadio.sqf"

switch (pUniform) do {
    case UNIFORM_MARPAT_WD: {
      #include "uniformloadouts\UNIFORM_MARPAT_WD.sqf"
    };
    case UNIFORM_MARPAT_D: {
      #include "uniformloadouts\UNIFORM_MARPAT_D.sqf"
    };
    case UNIFORM_OCP: {
      #include "uniformloadouts\UNIFORM_OCP.sqf"
    };
    case UNIFORM_G3_BLACK: {
      #include "uniformloadouts\UNIFORM_G3_BLACK.sqf"
    };
    case UNIFORM_TTSKO_FOREST: {
      #include "uniformloadouts\UNIFORM_TTSKO_FOREST.sqf"
    };
    case UNIFORM_EMR_DESERT: {
    #include "uniformloadouts\UNIFORM_EMR_DESERT.sqf"
    };
    case UNIFORM_EMR_SUMMER: {
      #include "uniformloadouts\UNIFORM_EMR_SUMMER.sqf"
    };
    case UNIFORM_COLDWAR_ERA_1: {
      #include "uniformloadouts\UNIFORM_COLDWAR_ERA_1.sqf"
    };
    case UNIFORM_M88_MOUNTAIN_LES: {
      #include "uniformloadouts\UNIFORM_M88_MOUNTAIN_LES.sqf"
    };
    case UNIFORM_M93_OAKLEAF: {
      #include "uniformloadouts\UNIFORM_M93_OAKLEAF.sqf"
    };
    case UNIFORM_M93_FLECKTARN: {
      #include "uniformloadouts\UNIFORM_M93_FLECKTARN.sqf"
    };
    case UNIFORM_M93_WOODLAND: {
      #include "uniformloadouts\UNIFORM_M93_WOODLAND.sqf"
    };
    case UNIFORM_SPECTER_S_FLORA: {
      #include "uniformloadouts\UNIFORM_SPECTER_S_FLORA.sqf"
    };
    case UNIFORM_AAF: {
      #include "uniformloadouts\UNIFORM_AAF.sqf"
    };
    case UNIFORM_CSAT_HEX: {
      #include "uniformloadouts\UNIFORM_CSAT_HEX.sqf"
    };
    case UNIFORM_CSAT_URBAN: {
      #include "uniformloadouts\UNIFORM_CSAT_URBAN.sqf"
    };
    case UNIFORM_GUERILLA: {
      #include "uniformloadouts\UNIFORM_GUERILLA.sqf"
    };
    case UNIFORM_WETSUIT: {
      #include "uniformloadouts\UNIFORM_WETSUIT.sqf"
    };
    case UNIFORM_CUSTOM_1: {
      #include "uniformloadouts\UNIFORM_CUSTOM_1.sqf"
    };
    case UNIFORM_CUSTOM_2: {
      #include "uniformloadouts\UNIFORM_CUSTOM_2.sqf"
    };
    case UNIFORM_CUSTOM_3: {
      #include "uniformloadouts\UNIFORM_CUSTOM_3.sqf"
    };
    case UNIFORM_CIVILIAN_TANOA: {
      #include "uniformloadouts\UNIFORM_CIVILIAN_TANOA.sqf"
    };
    case UNIFORM_CIVILIAN: {
      #include "uniformloadouts\UNIFORM_CIVILIAN.sqf"
    };
    default {};
};
