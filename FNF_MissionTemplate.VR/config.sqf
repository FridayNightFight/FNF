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
scavHunt
*/

/************************* DON'T FORGET TO FILL THIS OUT IF YOUR GAME MODE IS NOT NEUTRAL *************************/
phx_defendingSide = sideEmpty; //west/east/independent
phx_attackingSide = sideEmpty; //west/east/independent
//Leave it as sideEmpty if chosen mode is neutral

////////////////////////////////////////////////////////////

//BLUFOR
phx_bluforUniform = "RHS_UNI_US_ARMY_2020";
phx_bluforGear = "RHS_GEAR_US_ARMY_2010_M16A4";

//OPFOR
phx_opforUniform = "VN_UNI_NVA_Vietcong";
phx_opforGear = "VN_GEAR_NVA_VC1970";

//INDFOR
phx_indforUniform = "VN_UNI_NVA_Vietcong";
phx_indforGear = "VN_GEAR_FR_FRA1970";

/*
  POSSIBLE VALUES:

    UNIFORMS:
      RHS_UNI_MARINES_DESERT_2010
      RHS_UNI_RU_RATNIK_2020
      RHS_UNI_RU_RATNIK_D_2020
      RHS_UNI_RU_SPETSNAZ_2020
      RHS_UNI_SRU_ARMY_1980
      RHS_UNI_US_ARMY_1980
      RHS_UNI_US_ARMY_2020
      RHS_UNI_US_ARMY_OCP
      RHS_UNI_US_RANGERS_2020
      VN_UNI_NVA_Vietcong
      VN_UNI_US_MACV
      VN_UNI_US_SOG

    GEAR:
      RHS_GEAR_RU_ARMY_2010_AK74M
      RHS_GEAR_SRU_ARMY_1980_AK74
      RHS_GEAR_US_ARMY
      RHS_GEAR_US_ARMY_1980_M14
      RHS_GEAR_US_ARMY_2010_M16A4
      VN_GEAR_FR_FRA1970
      VN_GEAR_NVA_VC1970
      VN_GEAR_US_ARMY1970
      VN_GEAR_US_SOG1970
*/

/*
You can also use the civilian unit 'C_man_1'
Those units will not be touched by the template loadout system, so they will keep their editor loadout
If they have a radio, they will all be preset to the same frequency
*/


/*
MAT SELECTION

Possible launcher values (and recommended counts)
	CARLG(2)
	RPG32(2)
	RPG7(4)
	TITAN(1)
	JAVELIN(1)
	METIS(1)
	STINGER(1)
	IGLA(1)

  // Disposables
    M72LAW(1)
    RPG26(1)
    NLAW(1)

  // SOG ONLY
    VN_LAW(1) // DISPOSABLE
    VN_RPG7(2)
    VN_STRELA(1)

  or, you can set GEARDEFAULT to use that side's gear set's recommended MAT settings for each squad.
    GEARDEFAULT

EXAMPLE:
	format:
		phx_bluAT_Bravo = CARLG(2);

  CARLG would give the MAT gunner a Carl Gustav
  The 2 refers to how many rockets/missiles for each: gunner, assistant, assistant.
  a value of 2 would mean a total of 6 rockets/missiles in this squad

*/

// BLUFOR
phx_bluAT_Bravo = GEARDEFAULT;
phx_bluAT_Delta = JAVELIN(1);

// OPFOR
phx_redAT_Bravo = RPG32(2);
phx_redAT_Delta = IGLA(1);

// INDFOR
phx_grnAT_Bravo = RPG32(2);
phx_grnAT_Delta = IGLA(1);


/*
  Allow players to grab magnified optics from the gear selector
  0 will restrict 4x+ optics to designated marksmen and snipers.
  1 will allow 4x+ optic choices. -1 will force ironsights
*/
phx_magnifiedOptics = 0;

/*
  Automatically add NVGs & lasers to players (Gen3, Black)
  Examples:
    addNVG = 0 OR [] will not give anyone NVGs
    addNVG = 1 OR [east, west, independent] will give all sides NVGs
    addNVG = [east] will give side east NVGs
    addNVG = [east,west] will give sides east and west NVGs
  */
phx_addNVG = 0;

phx_fortifyPoints = 125; //Currency for fortify - individual to each Combat Engineer - set to 0 to disable
phx_enemyStartVisible = true; //Set to false to hide enemy start zone markers
phx_maxViewDistance = 1500; //Maximum client view distance (meters)


// Show/Hide unit / group icons on map, GPS for players
// Used in limited-intel scenarios like WWII and Vietnam
phx_showUnitIcons = true;
phx_showGroupIcons = true;


// MISSION MAKER NOTES
// 0 or more of the below can be included. At minimum, it's suggested to populate the "briefingNotes" item.

// "Background" should include any lore you wish to explain.
phx_briefingBackground = "";
// "WorldInfo" should include any notable details about the AO.
phx_briefingWorldInfo = "";
// "Notes" can include anything else.
phx_briefingNotes = "";
// "Rules" should include any mission-specific rules that you want to spell out for players.
phx_briefingRules = "";

/*
==========UNIFORM VALUES========== -- ==========WEAPON VALUES==========

=====BLUFOR=====                                =====ANY=====
UNIFORM_MARPAT_WD                  --
UNIFORM_MARPAT_D                   --   WEAPONS_RU
UNIFORM_OEF_CP                     --   WEAPONS_IND
UNIFORM_PMC                        --   WEAPONS_G36
UNIFORM_M93_DESERT                 --   WEAPONS_GUERRILLA
UNIFORM_M93_WOODLAND               --   WEAPONS_M21
RHS_US_ARMY_OCP                    --   WEAPONS_SCAR
UNIFORM_UCP                        --   WEAPONS_VHS
UNIFORM_CTRG_WD                    --   WEAPONS_FAL_COLDWAR
UNIFORM_ION_BK                     --   WEAPONS_M14
UNIFORM_ION_WD                     --   WEAPONS_SOVIET
UNIFORM_ISRAEL_TAN                 --
UNIFORM_RANGER                     --
UNIFORM_WEST_POLICE
UNIFORM_BUNDESWEHR
UNIFORM_HELLENIC_ARMY

=====OPFOR=====
UNIFORM_EMR_SUMMER
UNIFORM_EMR_DESERT
UNIFORM_FLORA
UNIFORM_MOUNTAIN_FLORA
UNIFORM_GORKA_GREEN
UNIFORM_GORKA_BEREZKA
UNIFORM_SOVIET_CSAT
UNIFORM_EAST_POLICE
UNIFORM_RUSSIAN_SPETSNAZ
UNIFORM_RUSSIAN_RATNIK
UNIFORM_SOVIET_AFGHAN
UNIFORM_SOVIET_WINTER
UNIFORM_RUSSIAN_SPRING

=====INDFOR=====
UNIFORM_M93_OAKLEAF
UNIFORM_M93_TIGER
UNIFORM_M93_GREEN
UNIFORM_M93_FLECKTARN
UNIFORM_M10_DESERT
UNIFORM_M10_MOUNTAIN
UNIFORM_GUERRILLA
UNIFORM_AAF
UNIFORM_ALTIS_LIZARD
UNIFORM_PARAMILITARY
UNIFORM_IND_POLICE
UNIFORM_M88
UNIFORM_JUNGLE
=========================================================================================================================
*/
