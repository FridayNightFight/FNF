/*
For magazines, use the format "MAGAZINE_CLASSNAME:NUMBER_OF_MAGS"
example:
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:9"; //mag classname of "rhs_mag_30Rnd_556x45_M855A1_Stanag", with 9 magazines
*/
#include "..\cfgLoadouts.hpp"

//You can leave any of the variables in this file as an empty string

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "LIB_M1_Carbine";
phx_loadout_rifle_mag_tracer = "LIB_15Rnd_762x33_t:3";
phx_loadout_rifle_mag = "LIB_15Rnd_762x33:10";

phx_loadout_smoke = "LIB_US_M18:4";
phx_loadout_grenade = "LIB_US_Mk_2:2";

if (pRole == ROLE_PL || pROLE == ROLE_SL) then {
  phx_loadout_rifle_weapon = "LIB_M1928A1_Thompson";
  phx_loadout_rifle_mag_tracer = "LIB_30Rnd_45ACP_t:2";
  phx_loadout_rifle_mag = "LIB_30Rnd_45ACP:6";
};

if (pRole == ROLE_R || pRole == ROLE_AAR || pRole == ROLE_GR) then {
  phx_loadout_rifle_weapon = "LIB_M1_Garand";
  phx_loadout_rifle_mag_tracer = "LIB_8Rnd_762x63_t:4";
  phx_loadout_rifle_mag = "LIB_8Rnd_762x63:10";

  phx_loadout_gr_adapter = "LIB_ACC_GL_M7";
  phx_loadout_gr_grenade = "LIB_1Rnd_G_Mk2:5";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "fow_w_m1918a2";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LIB_M1919A6";
};

//Global sidearm classes
phx_loadout_sidearm_weapon = "LIB_Colt_M1911";
phx_loadout_sidearm_mag = "LIB_7Rnd_45ACP:2";

//Magazine classnames for AR and MMG
phx_loadout_ar_mag = "fow_20Rnd_762x63:15";
phx_loadout_mmg_mag = "LIB_50Rnd_762x63:10";

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "fow_20Rnd_762x63:10";
phx_loadout_am_mag = "LIB_50Rnd_762x63:5";

//Light AT
phx_loadout_antitank_weapon = "";
phx_loadout_antitank_mag = "";

//Medium AT
phx_loadout_mediumantitank_weapon = "LIB_M1A1_Bazooka";
phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6:2";

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
  case ROLE_AAT: {phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6:2"}; //Assistant anti-tank
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "LIB_M1903A4_Springfield";
    phx_loadout_rifle_mag = "LIB_5Rnd_762x63_t:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_US";
