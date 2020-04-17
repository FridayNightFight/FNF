#include "cfgLoadouts.hpp"

#include "weapons\bluforLoadout.sqf"
#include "weapons\opforLoadout.sqf"
#include "weapons\indforLoadout.sqf"


switch (pWeapons) do {
    case WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST: {
      [] call giveBLUFORLoadout;
    };
    case WEAPONS_AK74M_PKM_PKP_RPG7_RPG32: {
      [] call giveOPFORLoadout;
    };
    case WEAPONS_M16A4_M249_M240G_M136_GUST: {
      [] call giveBLUFORLoadout;
      #include "weapons\WEAPONS_M16A4_M249_M240G_M136_GUST.sqf"
    };
    case WEAPONS_G36KV_M249_M240G_M136_GUST: {
      [] call giveBLUFORLoadout;
      #include "weapons\WEAPONS_G36KV_M249_M240G_M136_GUST.sqf"
    };
    case WEAPONS_AKMN_PKM_PKP_RPG7_RPG32: {
      [] call giveOPFORLoadout;
      #include "weapons\WEAPONS_AKMN_PKM_PKP_RPG7_RPG32.sqf"
    };
    case WEAPONS_MX_STONER_MXSW_RPG32_TITAN: {
      [] call giveINDFORLoadout;
      #include "weapons\WEAPONS_MX_STONER_MXSW_RPG32_TITAN.sqf"
    };
    case WEAPONS_KATIBA_ZAFIR_LYNX_RPG32_TITAN:{
      [] call giveINDFORLoadout;
      #include "weapons\WEAPONS_KATIBA_ZAFIR_LYNX_RPG32_TITAN.sqf"
    };
    case WEAPONS_KAR98K_PKM_MG42_RPG26_RPG7: {
      [] call giveOPFORLoadout;
      #include "weapons\WEAPONS_KAR98K_PKM_MG42_RPG26_RPG7.sqf"
    };
    case WEAPONS_SCARH_MK18320_SAW_M240_M136_GUST:{
      [] call giveBLUFORLoadout;
      #include "weapons\WEAPONS_SCARH_MK18320_SAW_M240_M136_GUST.sqf"
    };
    case WEAPONS_RANDOM: {
      #include "weapons\WEAPONS_RANDOM.sqf"
    };
    case WEAPONS_CUSTOM_1: {
      #include "weapons\WEAPONS_CUSTOM_1.sqf"
    };
    case WEAPONS_CUSTOM_2: {
      #include "weapons\WEAPONS_CUSTOM_2.sqf"
    };
    case WEAPONS_CUSTOM_3: {
      #include "weapons\WEAPONS_CUSTOM_3.sqf"
    };
    case WEAPONS_UNARMED: {
      #include "weapons\WEAPONS_UNARMED.sqf"
    };
    default {};
};
