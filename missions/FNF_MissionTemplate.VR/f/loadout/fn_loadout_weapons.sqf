#include "cfgLoadouts.hpp"

#include "weaponloadouts\bluforLoadout.sqf"
#include "weaponloadouts\opforLoadout.sqf"
#include "weaponloadouts\indforLoadout.sqf"


switch (pWeapons) do {
    case WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST: {
      [] call giveBLUFORLoadout;
    };
    case WEAPONS_AK74M_PKM_PKP_RPG7_RPG32: {
      [] call giveOPFORLoadout;
    };
    case WEAPONS_M16A4_M249_M240G_M136_GUST: {
      [] call giveBLUFORLoadout;
      #include "weaponloadouts\WEAPONS_M16A4_M249_M240G_M136_GUST.sqf"
    };
    case WEAPONS_G36KV_M249_M240G_M136_GUST: {
      [] call giveBLUFORLoadout;
      #include "weaponloadouts\WEAPONS_G36KV_M249_M240G_M136_GUST.sqf"
    };
    case WEAPONS_AKMN_PKM_PKP_RPG7_RPG32: {
      [] call giveOPFORLoadout;
      #include "weaponloadouts\WEAPONS_AKMN_PKM_PKP_RPG7_RPG32.sqf"
    };
    case WEAPONS_MX_STONER_MXSW_RPG32_TITAN: {
      [] call giveINDFORLoadout;
      #include "weaponloadouts\WEAPONS_MX_STONER_MXSW_RPG32_TITAN.sqf"
    };
    case WEAPONS_KATIBA_ZAFIR_LYNX_RPG32_TITAN:{
      [] call giveINDFORLoadout;
      #include "weaponloadouts\WEAPONS_KATIBA_ZAFIR_LYNX_RPG32_TITAN.sqf"
    };
    case WEAPONS_KAR98K_PKM_MG42_RPG26_RPG7: {
      [] call giveOPFORLoadout;
      #include "weaponloadouts\WEAPONS_KAR98K_PKM_MG42_RPG26_RPG7.sqf"
    };
    case WEAPONS_SCARH_MK18320_SAW_M240_M136_GUST:{
      [] call giveBLUFORLoadout;
      #include "weaponloadouts\WEAPONS_SCARH_MK18320_SAW_M240_M136_GUST.sqf"
    };
    case WEAPONS_RANDOM: {
      #include "weaponloadouts\WEAPONS_RANDOM.sqf"
    };
    case WEAPONS_UNARMED: {
      #include "weaponloadouts\WEAPONS_UNARMED.sqf"
    };
    default {};
};

if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "hgun_PDW2000_F";
  phx_loadout_rifle_mag = "30Rnd_9x21_Mag:3";
};
