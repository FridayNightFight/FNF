#include "client\loadout\cfgLoadouts.hpp"
#include "shared\definitions.hpp"

////////////////////////////////////////////////////////////

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
phx_bluforUniform = "UNIFORM_GERARMY";
phx_opforUniform = "UNIFORM_SOVARMY";
phx_indforUniform = "UNIFORM_USARMY";
phx_civUniform = "UNIFORM_CIVILIAN";

//Weapons
phx_bluforWeapons = "WEAPONS_GERARMY";
phx_opforWeapons = "WEAPONS_SOVARMY";
phx_indforWeapons = "WEAPONS_USARMY";
phx_civWeapons = "";

////////////////////////////////////////////////////////////

phx_allowFortify = true; //Allow the defending side to use ACEX Fortify
phx_fortifyPoints = 50; //Currency for fortify - individual to each Combat Engineer
phx_fortifyColor = 0; //Color of fortifications. 0 = green, 1 = tan

phx_missionBoundaryRestriction = true; //Set to false to disable the mission boundary
phx_safeStartTime = 15; //Safestart time in minutes
phx_missionTimeLimit = 60; //Mission time limit in minutes
phx_opticMagnification = false; //Set to true to allow players to use magnified optics

phx_customLoadouts = false; //Set to true if you don't want to use this template's loadout system - radios will still be preset
phx_antiGammaDoping = false; //Set to true for certain night missions where gamma abuse may happen

////////////////////////////////////////////////////////////
/*
==========UNIFORM VALUES========== -- ==========WEAPON VALUES==========
UNIFORM_USARMY                     -- WEAPONS_USARMY
UNIFORM_GERARMY                    -- WEAPONS_GERARMY

*/
