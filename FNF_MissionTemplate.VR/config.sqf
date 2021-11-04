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

// MISSION MAKER NOTES //
// 0 or more of the below can be included. At minimum, it's suggested to populate the "briefingNotes" item.

// "Background" should include any lore you wish to explain.
phx_briefingBackground = "";
// "WorldInfo" should include any notable details about the AO.
phx_briefingWorldInfo = "";
// "Notes" can include anything else.
phx_briefingNotes = "";
// "Rules" should include any mission-specific rules that you want to spell out for players.
phx_briefingRules = "";


// SCENARIO SETTINGS //

phx_fortifyPoints = 125; //Currency for fortify - individual to each Combat Engineer - set to 0 to disable
phx_enemyStartVisible = true; //Set to false to hide enemy start zone markers
phx_maxViewDistance = 1500; //Maximum client view distance (meters)

/*
  Allow players to grab magnified optics from the gear selector
  0 will restrict 4x+ optics to designated marksmen and snipers.
  1 will allow 4x+ optic choices for all except MGs.
  -1 will force ironsights.
*/
phx_magnifiedOptics = 0;

/*
  Automatically add NVGs & lasers to players (Gen3, Black)
  Examples:
    phx_addNVG = 0 OR [] will not give anyone NVGs
    phx_addNVG = 1 OR [east, west, independent] will give all sides NVGs
    phx_addNVG = [east] will give side east NVGs
    phx_addNVG = [east,west] will give sides east and west NVGs
  */
phx_addNVG = 0;





// UNIFORM AND GEAR CHOICES //

//BLUFOR
phx_bluforUniform = "RHS_UNI_US_ARMY_2020";
phx_bluforGear = "RHS_GEAR_US_ARMY_2010_M16A4";

//OPFOR
phx_opforUniform = "RHS_UNI_RU_RATNIK_2020";
phx_opforGear = "RHS_GEAR_RU_ARMY_2010_AK74M";

//INDFOR
phx_indforUniform = "RHS_UNI_ID_MEC_2010";
phx_indforGear = "RHS_GEAR_ID_MEC_2010_AK74MR";

/*
  POSSIBLE VALUES:

    UNIFORMS:
    RHS_UNI_DE_BUNDESWEHR_2010
    RHS_UNI_ID_MEC_2010
    RHS_UNI_ID_NAVSOG_2010
    RHS_UNI_RU_RATNIK_2020
    RHS_UNI_RU_RATNIK_D_2020
    RHS_UNI_RU_SPETSNAZ_2010
    RHS_UNI_RU_SPETSNAZ_2020
    RHS_UNI_SERBIAN_ARMY_2010
    RHS_UNI_SOV_ARMY_1980
    RHS_UNI_US_ARMY_1980
    RHS_UNI_US_ARMY_2020
    RHS_UNI_US_ARMY_OCP
    RHS_UNI_US_MARINES_DESERT_2010
    RHS_UNI_US_MARINES_WOODLAND_2010
    RHS_UNI_US_RANGERS_2020
    VN_UNI_NLF_Vietcong
    VN_UNI_NVA_Vietcong
    VN_UNI_PAVN_NVA
    VN_UNI_SVA_ARVN
    VN_UNI_US_MACV
    VN_UNI_US_SOG

    GEAR:
    RHS_GEAR_DE_BUNDESWEHR_2010_G36
    RHS_GEAR_ID_MEC_2010_AK74MR
    RHS_GEAR_ID_NAVSOG_2010_M16A4
    RHS_GEAR_RU_ARMY_2010_AK74M
    RHS_GEAR_SERBIAN_ARMY_2010_M21
    RHS_GEAR_SOV_ARMY_1980_AK74
    RHS_GEAR_US_ARMY_1980_M14
    RHS_GEAR_US_ARMY_2010_M16A4
    RHS_GEAR_US_RANGERS_2010_SCAR
    VN_GEAR_NVA_VC1970
    VN_GEAR_US_ARMY1970
    VN_GEAR_US_SOG1970
*/

/*
You can also use the civilian unit 'C_man_1'
Those units will not be touched by the template loadout system, so they will keep their editor loadout
If they have a radio, they will all be preset to the same frequency
*/


// MAT SELECTION //

// BLUFOR
phx_bluAT_Bravo = GEARDEFAULT;
phx_bluAT_Delta = GEARDEFAULT;

// OPFOR
phx_redAT_Bravo = RPG32(2);
phx_redAT_Delta = IGLA(1);

// INDFOR
phx_grnAT_Bravo = RPG32(2);
phx_grnAT_Delta = IGLA(1);

/*
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


// SQUAD HQ AUXILIARY ROLES //
// "SHQAUX"
// Adjusts what loadout the two extra Squad HQ members will receive
// Set to 0 to make default crewman, set to one of the options to enable equipment for it.
// OPFOR
  phx_eastAlphaAuxRole = 0;
  phx_eastBravoAuxRole = HMG_KORD_LO(8);
  phx_eastCharlieAuxRole = 0;
  phx_eastDeltaAuxRole = HMG_KORD_LO(8);

// BLUFOR
  phx_westAlphaAuxRole = 0;
  phx_westBravoAuxRole = HMG_M2_LO(4);
  phx_westCharlieAuxRole = 0;
  phx_westDeltaAuxRole = HMG_M2_LO(4);

// INDFOR
  phx_guerAlphaAuxRole = 0;
  phx_guerBravoAuxRole = HMG_DSHKM_LO(8);
  phx_guerCharlieAuxRole = 0;
  phx_guerDeltaAuxRole = HMG_DSHKM_LO(8);

/*
OPTIONS
  HMG_M2(_boxes) // 100 rd mags
  HMG_M2_LO(_boxes) // 100 rd mags
  HMG_KORD(_boxes) // 50 rd mags
  HMG_KORD_LO(_boxes) // 50 rd mags
  HMG_DSHKM(_boxes) // 50 rd mags
  HMG_DSHKM_LO(_boxes) // 50 rd mags
  MORTAR_2B14(_he,_smk,_illum)
  MORTAR_M252(_he,_smk,_illum)
  AT_SPG9(_he,_heat)
  AT_METIS(_he,_heat)
  AT_TOW(_tow)

  VN_MORTAR_TYPE53(_he,_smk,_illum)
  VN_MORTAR_M2_60mm(_hecnt,_smk,_illum)
  VN_MORTAR_M29_81mm(_hecnt,_smk,_illum)

EXAMPLE:
  for BLUFOR Bravo Squad:
    format:
      // crewman
      phx_westBravoAuxRole = 0;

      // M2, short tripod, 4 boxes of ammo total
      phx_westBravoAuxRole = HMG_M2_LO(4);

      // M252 mortar with 10 HE, 5 smoke, 5 flares
      phx_westBravoAuxRole = MORTAR_M252(10,5,5);
*/



// SYSTEM SETTINGS //

// Show/Hide unit / group icons on map, GPS for players
// Used in limited-intel scenarios like WWII and Vietnam
phx_showUnitIcons = false;
phx_showGroupIcons = true;
