#include "description\configDefs.hpp"

/* MAKE SURE YOU SET THE ATTACKING AND DEFENDING SIDES BELOW IF YOUR CHOSEN MODE IS AN ATK/DEF */
/* DO NOT DELETE ANY OF THE OTHER TEMPLATE OBJECTIVE OBJECTS - they will be deleted automatically if not in use */

phx_gameMode = destroy; //Change this to whatever game mode you want and configure the respective file in mode_config
//If you don't want to use one of the template modes, you can set phx_gameMode = "";
/*
===ATK/DEF===
destroy
uplink
rush
captureTheFlag
adSector

===NEUTRAL===
connection
neutralSector
*/

/************************* DON'T FORGET TO FILL THIS OUT IF YOUR GAME MODE IS NOT NEUTRAL *************************/
phx_defendingSide = sideEmpty; //west/east/independent
phx_attackingSide = sideEmpty; //west/east/independent
//Leave it as sideEmpty if chosen mode is neutral

////////////////////////////////////////////////////////////

//Uniforms
phx_bluforUniform = "UNIFORM_GERMANY";
phx_opforUniform = "UNIFORM_SOVIET";
phx_indforUniform = "UNIFORM_USA";

//Weapons
phx_bluforWeapons = "WEAPONS_USA";
phx_opforWeapons = "WEAPONS_SOVIET";
phx_indforWeapons = "WEAPONS_BRITAIN";

/*
You can also use the civilian unit 'C_man_1'
Those units will not be touched by the tempalte loadout system, so they will keep their editor loadout
If they have a radio, they will all be preset to the same frequency
*/

//MAT launcher weapon
phx_bluAT = CARLG; //BLUFOR
phx_redAT = RPG32; //OPFOR
phx_grnAT = RPG32; //INDFOR
/*
Values:
CARLG, RPG32, RPG7, TITAN, JAVELIN
METIS, NLAW, STINGER, IGLA
*/

phx_magnifiedOptics = false; //Allow players to grab magnified optics from the gear selector
phx_addNVG = false; //Automatically add NVGs & lasers to players (Gen3, Black) - true for global add or side or array of sides
//Example: phx_addNVG = east will give side east NVGs, phx_addNVG = [east,west] will give sides east and west NVGs

phx_allowFortify = true; //Allow the defending side to use ACEX Fortify
phx_fortifyPoints = 100; //Currency for fortify - individual to each Combat Engineer
phx_enemyStartVisible = true; //Set to false to hide enemy start zone markers
phx_maxViewDistance = 1500; //Maximum client view distance (meters)

/*
==========UNIFORM VALUES========== -- ==========WEAPON VALUES==========

=====BLUFOR=====                                =====ANY=====
UNIFORM_GER

=====OPFOR=====
UNIFORM_SOV

=====INDFOR=====
UNIFORM_USA
=========================================================================================================================
*/
