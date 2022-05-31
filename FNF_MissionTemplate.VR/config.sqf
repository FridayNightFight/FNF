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

//BLUFOR
phx_gearset_blufor = GERMANY_LATE;

//OPFOR
phx_gearset_opfor = SOVIET;

//INDFOR
phx_gearset_indfor = USA_ARMY;

/*
You can also use the civilian unit 'C_man_1'
Those units will not be touched by the tempalte loadout system, so they will keep their editor loadout
If they have a radio, they will all be preset to the same frequency
*/

phx_fortifyPoints = 125; //Currency for fortify - individual to each Combat Engineer - set to 0 to disable
phx_enemyStartVisible = true; //Set to false to hide enemy start zone markers
phx_maxViewDistance = 1500; //Maximum client view distance (meters)

/*
==========GEARSETS==========

=====BLUFOR=====
GERMANY_EARLY
GERMANY_LATE
GERMANY_DAK
GERMANY_WINTER
GERMANY_FSJ
GERMANY_STORMTROOPER

JAPAN

=====OPFOR=====
SOVIET
SOVIET_WINTER

=====INDFOR=====
USA_ARMY
USA_AIRBORNE
USA_RANGERS
USA_TORCH
USMC

BRITAIN_EARLY
BRITAIN_DESERT
BRITAIN_JUNGLE
BRITAIN_LATE
BRITAIN_PARA

POLISH
=========================================================================================================================
*/
