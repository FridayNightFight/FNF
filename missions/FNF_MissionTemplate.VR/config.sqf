#include "client\loadout\cfgLoadouts.hpp"
#include "shared\definitions.hpp"

phx_gameMode = destroy; //Change this to whatever game mode you want and configure the respective file in mode_config
//If you don't want to use one of the template modes, you can set phx_gameMode = "";
/*
destroy - atk/def
uplink - atk/def
rush - atk/def
connection - neutral
captureTheFlag - atk/def
*/

phx_defendingSide = sideEmpty; //west/east/independent - BLUFOR/OPFOR/INDFOR
phx_attackingSide = sideEmpty; //west/east/independent - BLUFOR/OPFOR/INDFOR
//Leave it as sideEmpty if chosen mode is neutral

////////////////////////////////////////////////////////////

//Uniforms
phx_bluforUniform = UNIFORM_MARPAT_WD;
phx_opforUniform = UNIFORM_EMR_SUMMER;
phx_indforUniform = UNIFORM_M93_OAKLEAF;
phx_civUniform = UNIFORM_CIVILIAN;

//Weapons
phx_bluforWeapons = WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST;
phx_opforWeapons = WEAPONS_AK74M_PKM_PKP_RPG7_RPG32;
phx_indforWeapons = WEAPONS_AKMN_PKM_PKP_RPG7_RPG32;
phx_civWeapons = WEAPONS_UNARMED;

////////////////////////////////////////////////////////////

phx_allowFortify = true; //Allow the defending side to use ACEX Fortify
phx_fortifyPoints = 50; //Currency for fortify - individual to each Combat Engineer
phx_fortifyColor = 0; //Color of fortifications. 0 = green, 1 = tan

phx_missionBoundaryRestriction = true; //Set to false to disable the mission boundary
phx_safeStartTime = 15; //Safestart time in minutes
phx_missionTimeLimit = 60; //Mission time limit in minutes
phx_opticMagnification = false; //Set to true to allow players to use magnified optics

phx_customLoadouts = false; //Set to true if you don't want to use this template's loadout system - radios will still be preset
////////////////////////////////////////////////////////////
/*
==========UNIFORM VALUES========== -- ==========WEAPON VALUES==========
                                   --
UNIFORM_MARPAT_WD                  --   WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST
UNIFORM_MARPAT_D                   --   WEAPONS_AK74M_PKM_PKP_RPG7_RPG32
UNIFORM_OCP                        --   WEAPONS_M16A4_M249_M240G_M136_GUST
UNIFORM_G3_BLACK                   --   WEAPONS_SCARH_MK18320_SAW_M240_M136_GUST
UNIFORM_TTSKO_FOREST               --   WEAPONS_MX_STONER_MXSW_RPG32_TITAN
UNIFORM_EMR_DESERT                 --   WEAPONS_KATIBA_ZAFIR_LYNX_RPG32_TITAN
UNIFORM_EMR_SUMMER                 --   WEAPONS_KAR98K_PKM_MG42_RPG26_RPG7
UNIFORM_SPECTER_S_FLORA            --   WEAPONS_AKMN_PKM_PKP_RPG7_RPG32
UNIFORM_COLDWAR_ERA_1              --   WEAPONS_G36KV_M249_M240G_M136_GUST
UNIFORM_M88_MOUNTAIN_LES           --   WEAPONS_RANDOM
UNIFORM_M93_OAKLEAF                --   WEAPONS_UNARMED
UNIFORM_CSAT_HEX                   --   WEAPONS_CUSTOM_1
UNIFORM_CSAT_URBAN                 --   WEAPONS_CUSTOM_2
UNIFORM_M93_FLECKTARN              --   WEAPONS_CUSTOM_3
UNIFORM_M93_WOODLAND               --
UNIFORM_AAF                        --
UNIFORM_GUERILLA                   --
UNIFORM_WETSUIT                    --
UNIFORM_CIVILIAN_TANOA             --
UNIFORM_CIVILIAN                   --
UNIFORM_CUSTOM_1                   --
UNIFORM_CUSTOM_2                   --
UNIFORM_CUSTOM_3                   --
*/
