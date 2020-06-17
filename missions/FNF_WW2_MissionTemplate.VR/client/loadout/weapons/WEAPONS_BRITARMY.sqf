/*
For magazines, use the format "MAGAZINE_CLASSNAME:NUMBER_OF_MAGS"
example:
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:9"; //mag classname of "rhs_mag_30Rnd_556x45_M855A1_Stanag", with 9 magazines
*/
#include "..\cfgLoadouts.hpp"

//You can leave any of the variables in this file as an empty string

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "LIB_LeeEnfield_No4";
phx_loadout_rifle_mag_tracer = "";
phx_loadout_rifle_mag = "LIB_10Rnd_770x56:14";

phx_loadout_smoke = "SmokeShell:4";
phx_loadout_grenade = "LIB_MillsBomb:2";

if (pRole == ROLE_PL || pROLE == ROLE_SL) then {
  phx_loadout_rifle_weapon = "LIB_Sten_Mk5";
  phx_loadout_rifle_mag_tracer = "";
  phx_loadout_rifle_mag = "LIB_32Rnd_9x19_Sten:4";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "fow_w_bren";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LIB_M1919A6";
};

//Global sidearm classes
phx_loadout_sidearm_weapon = "fow_w_webley";
phx_loadout_sidearm_mag = "fow_6Rnd_455:2";

//Magazine classnames for AR and MMG
phx_loadout_ar_mag = "fow_30Rnd_303_bren:10";
phx_loadout_mmg_mag = "LIB_50Rnd_762x63:10";

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "fow_30Rnd_303_bren:5";
phx_loadout_am_mag = "LIB_50Rnd_762x63:5";

//Light AT
phx_loadout_antitank_weapon = "";
phx_loadout_antitank_mag = "";

//Medium AT
phx_loadout_mediumantitank_weapon = "LIB_PIAT";
phx_loadout_mediumantitank_mag = "LIB_1Rnd_89m_PIAT:2";

//Marksman optic
phx_loadout_rifle_optic = "";

phx_allowedWeapons = []; //Weapons that can be selected in the gear selector. Leave blank for none.
//**Currently requires that selectable weapons use the same magazines**

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_CLS: {}; //Medic
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {}; //Combat engineer
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_AT: {}; //Anti-tank
  case ROLE_AAT: {phx_loadout_mediumantitank_mag = "LIB_1Rnd_89m_PIAT:2"}; //Assistant anti-tank
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "LIB_LeeEnfield_No4_Scoped";
    phx_loadout_rifle_mag = "LIB_10Rnd_770x56:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_UK";
