#include "description\configDefs.hpp"

////////////////////////////////////////////////////////////

// MISSION MAKER NOTES //
// 0 or more of the below can be included. At minimum, it's suggested to populate the "briefingNotes" item.

// "Background" should include any lore you wish to explain.
fnf_briefingBackground = "";
// "WorldInfo" should include any notable details about the AO.
fnf_briefingWorldInfo = "";
// "Notes" can include anything else.
fnf_briefingNotes = "";
// "Rules" should include any mission-specific rules that you want to spell out for players.
fnf_briefingRules = "";

////////////////////////////////////////////////////////////

// Standard 1-life Friday Night Fight Mode
/*
  1. rename "mission_normal.sqm" to "mission.sqm"
  2. rename "description_normal.ext" to "description.ext"
  3. below, set fnf_gameMode to any of the valid values from configGuide.txt
  4. delete "description_SA.ext", "mission_SA_Modern.sqm", and "mission_SA_VN.sqm" (for filesize purposes)
*/

// NEW! Sustained Assault Mode
/*
  **requires advance permission from Missions Team Lead**
  1a. if using SOG Prairie Fire, rename "mission_SA_VN.sqm" to "mission.sqm"
  1b. if using modern RHS, rename "mission_SA_modern.sqm" to "mission.sqm"
  2. rename "description_SA.ext" to "description.ext"
  3. below, set fnf_gameMode = sustainedAssault
  4. delete "description_normal.ext" and whichever missionX.sqm files you didn't use (for filesize purposes)
*/


// SCENARIO SETTINGS //

fnf_gameMode = destroy;
/*
  MAKE SURE YOU SET THE ATTACKING AND DEFENDING SIDES BELOW IF YOUR CHOSEN MODE IS AN ATK/DEF
  DO NOT DELETE ANY OF THE OTHER TEMPLATE OBJECTIVE OBJECTS
  they will be deleted automatically if not in use
*/
fnf_defendingSide = west; // west/east/independent
fnf_attackingSide = east; // west/east/independent
// Leave it as sideEmpty if chosen mode is neutral

fnf_vnArtillerySide = sideEmpty; // west/east/independent
// which side's PLT SGT will have access to VN Artillery interface (requires Prairie Fire)
// use sideEmpty to not give anyone access

fnf_SWRadioForAll = -1;
// override loadout-based radio settings
// -1 means the loadout setting will be used (default)
// 0 means nobody will receive a SW Radio (Vietnam, not sustainedAssault)
// 1 means everyone will receive a SW Radio (sustainedAssault, etc)

fnf_enemyStartVisible = true; // Set to false to hide enemy start zone markers
fnf_maxViewDistance = 1500;
/*
  Maximum client view distance (meters)
    LOW: 500 (for urban combat)
    MEDIUM: 1000 (for hilly terrain, open areas)
    HIGH: 1500 (for large open ground, mountains)
*/

fnf_fortifyPoints = 125;
/*
  Currency for fortify - individual to each Combat Engineer - set to 0 to disable
    LOW: 60
    MEDIUM: 125
    HIGH: 250
*/

fnf_fortifyStyle = "Modern";
/*
  Determines what objects will be available for fnf_defendingSide CEs to place using Fortify tool
    "Modern" will auto-dermine tan or green hescos, sandbags, etc depending on map
    "ModernGreen" will force modern green objects
    "ModernTan" will force modern tan objects
    "NVA" will give Vietnam-era NVA/VC emplacements (requires Prairie Fire)
    "MACV" will give Vietnam-era US Army emplacements (requires Prairie Fire)
*/

fnf_magnifiedOptics = 0;
/*
  Allow players to grab magnified optics from the gear selector
  0 will restrict 4x+ optics to designated marksmen and snipers.
  1 will allow 4x+ optic choices for all except MGs.
  -1 will force ironsights.
*/

fnf_addNVG = 0;
/*
  Automatically add NVGs & lasers to players (Gen3, Black)
  Examples:
    fnf_addNVG = 0 OR [] will not give anyone NVGs
    fnf_addNVG = 1 OR [east, west, independent] will give all sides NVGs
    fnf_addNVG = [east] will give side east NVGs
    fnf_addNVG = [east,west] will give sides east and west NVGs
*/

////////////////////////////////////////////////////////////

// UNIFORM AND GEAR CHOICES //

//BLUFOR
fnf_bluforUniform = "RHS_UNI_NATO_US_ARMY_2020";
fnf_bluforGear = "RHS_GEAR_US_ARMY_2010_M16A4";

//OPFOR
fnf_opforUniform = "RHS_UNI_RU_RATNIK_2020";
fnf_opforGear = "RHS_GEAR_RU_ARMY_2010_AK74M";

//INDFOR
fnf_indforUniform = "RHS_UNI_ID_IRAQI_ARMY_2003";
fnf_indforGear = "RHS_GEAR_ID_IRAQI_ARMY_2003_AKMN";


////////////////////////////////////////////////////////////

// MAT SELECTION //

// BLUFOR
fnf_bluAT_Bravo = GEARDEFAULT;
fnf_bluAT_Delta = GEARDEFAULT;

// OPFOR
fnf_redAT_Bravo = GEARDEFAULT;
fnf_redAT_Delta = GEARDEFAULT;

// INDFOR
fnf_grnAT_Bravo = GEARDEFAULT;
fnf_grnAT_Delta = GEARDEFAULT;


////////////////////////////////////////////////////////////

// SQUAD HQ AUXILIARY ROLES //
// "SHQAUX"
// Adjusts what loadout the two extra Squad HQ members will receive
// Set to 0 to make default crewman, set to one of the options to enable equipment for it.
// BLUFOR
  fnf_westAlphaAuxRole = 0;
  fnf_westBravoAuxRole = 0;
  fnf_westCharlieAuxRole = 0;
  fnf_westDeltaAuxRole = 0;

// OPFOR
  fnf_eastAlphaAuxRole = 0;
  fnf_eastBravoAuxRole = 0;
  fnf_eastCharlieAuxRole = 0;
  fnf_eastDeltaAuxRole = 0;

// INDFOR
  fnf_guerAlphaAuxRole = 0;
  fnf_guerBravoAuxRole = 0;
  fnf_guerCharlieAuxRole = 0;
  fnf_guerDeltaAuxRole = 0;


////////////////////////////////////////////////////////////

// SYSTEM SETTINGS //

// Show/Hide unit / group icons on map, GPS for players
// Used in limited-intel scenarios like WWII and Vietnam
// i.e. showUnitIcons should be true for Modern and sustainedAssault VN missions
fnf_showUnitIcons = true;
fnf_showGroupIcons = true;
fnf_showAlliedFactions = true;
