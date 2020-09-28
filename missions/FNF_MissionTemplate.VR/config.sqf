#include "client\loadout\cfgLoadouts.hpp"
#include "shared\definitions.hpp"

/* MAKE SURE YOU SET THE ATTACKING AND DEFENDING SIDES BELOW IF YOUR CHOSEN MODE IS AN ATK/DEF */
/* DO NOT DELETE ANY OF THE OTHER TEMPLATE OBJECTIVE OBJECTS - they will be deleted automatically if not in use */

phx_gameMode = destroy; //Change this to whatever game mode you want and configure the respective file in mode_config
//If you don't want to use one of the template modes, you can set phx_gameMode = "";
/*
destroy - atk/def
uplink - atk/def
rush - atk/def
captureTheFlag - atk/def
adSector - atk/def

connection - neutral
neutralSector - neutral
*/

/************************* DON'T FORGET TO FILL THIS OUT IF YOUR GAME MODE IS NOT NEUTRAL *************************/
phx_defendingSide = sideEmpty; //west/east/independent
phx_attackingSide = sideEmpty; //west/east/independent
//Leave it as sideEmpty if chosen mode is neutral

////////////////////////////////////////////////////////////

//Uniforms
phx_bluforUniform = "UNIFORM_MARPAT_WD";
phx_opforUniform = "UNIFORM_EMR_SUMMER";
phx_indforUniform = "UNIFORM_M93_OAKLEAF";
phx_civUniform = "UNIFORM_CIVILIAN";

//Weapons
phx_bluforWeapons = "WEAPONS_M4A1_BLOCK_M249_M240G_M136";
phx_opforWeapons = "WEAPONS_AK74M_PKM_PKP_RPG7";
phx_indforWeapons = "WEAPONS_AKMN_PKM_PKP_RPG7";
phx_civWeapons = "WEAPONS_UNARMED";

//MAT launcher weapon
phx_bluAT = CARLG; //BLUFOR
phx_redAT = RPG32; //OPFOR
phx_grnAT = RPG32; //INDFOR

/*
Values:

CARLG
RPG32
RPG7
TITAN
METIS
NLAW
STINGER
IGLA
*/
////////////////////////////////////////////////////////////

phx_allowFortify = true; //Allow the defending side to use ACEX Fortify
phx_fortifyPoints = 75; //Currency for fortify - individual to each Combat Engineer
phx_fortifyColor = 0; //Color of fortifications. 0 = green, 1 = tan

phx_missionBoundaryRestriction = true; //Set to false to disable the mission boundary
phx_safeStartTime = 20; //Safestart time in minutes
phx_missionTimeLimit = 50; //Mission time limit in minutes - starts after safe start ends
phx_opticMagnification = false; //Set to true to allow players to use magnified optics
phx_maxViewDistance = 2000; //Maximum client view distance (meters), strongly recommended to keep it <= 2000 for client and server performance

phx_customLoadouts = false; //Set to true if you don't want to use this template's loadout system - radios will still be preset if units have them
phx_allowUniformSwap = false; //Set to true if you want players to be able to take off / change their uniform and helmet
phx_antiGammaDoping = false; //Set to true for certain night missions where gamma abuse may happen - this prevents clients from setting gamma > 1.3 in video settings

////////////////////////////////////////////////////////////
/*
==========UNIFORM VALUES========== -- ==========WEAPON VALUES==========

UNIFORM_MARPAT_WD                  --   WEAPONS_M4A1_BLOCK_M249_M240G_M136
UNIFORM_MARPAT_D                   --   WEAPONS_AK74M_PKM_PKP_RPG7
UNIFORM_EMR_DESERT                 --   WEAPONS_AKMN_PKM_PKP_RPG7
UNIFORM_EMR_SUMMER                 --   WEAPONS_SCAR
UNIFORM_M93_OAKLEAF                --   WEAPONS_G36
UNIFORM_GUERRILLA                  --   WEAPONS_GUERRILLA
UNIFORM_PMC                        --
UNIFORM_MOUNTAIN_FLORA             --
UNIFORM_FLORA                      --
UNIFORM_OEF_CP                     --
UNIFORM_M10_DESERT                 --
UNIFORM_M10_MOUNTAIN               --
UNIFORM_M93_DESERT                 --
UNIFORM_M93_TIGER                  --
UNIFORM_M93_GREEN                  --
UNIFORM_M93_FLECKTARN              --
UNIFORM_GORKA_GREEN                --
UNIFORM_GORKA_BEREZKA              --
UNIFORM_CUSTOM_1                   --  WEAPONS_CUSTOM_1 - configurable via respective file in "client\loadout\weapons"
UNIFORM_CUSTOM_2                   --  WEAPONS_CUSTOM_2
UNIFORM_CUSTOM_3                   --  WEAPONS_CUSTOM_3
*/
