/*
For magazines, use the format "MAGAZINE_CLASSNAME:NUMBER_OF_MAGS"
example:
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:9"; //mag classname of "rhs_mag_30Rnd_556x45_M855A1_Stanag", with 9 magazines
*/
#include "..\cfgLoadouts.hpp"

//You can leave any of the variables in this file as an empty string

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "LIB_M9130";
phx_loadout_rifle_mag_tracer = "LIB_5Rnd_762x54_t46:5";
phx_loadout_rifle_mag = "LIB_5Rnd_762x54:10";

phx_loadout_smoke = "SmokeShell:4";
phx_loadout_grenade = "LIB_F1:2";

if (pRole == ROLE_PL) then {
  phx_loadout_rifle_weapon = "LIB_M38";
  phx_loadout_rifle_mag_tracer = "LIB_5Rnd_762x54_t46:3";
};

if (pRole == ROLE_SL) then {
  phx_loadout_rifle_weapon = "LIB_SVT_40";
  phx_loadout_rifle_mag_tracer = "LIB_10Rnd_762x54_t46:2";
  phx_loadout_rifle_mag = "LIB_10Rnd_762x54:5";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "LIB_PPSh41_m";
  phx_loadout_rifle_mag_tracer = "LIB_35Rnd_762x25_t:3";
  phx_loadout_rifle_mag = "LIB_35Rnd_762x25:6";
};

if (pRole == ROLE_GR) then {
  phx_loadout_grenade = "LIB_F1:8";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "LIB_PPSh41_m";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LIB_DP28";
};

//Global sidearm classes
phx_loadout_sidearm_weapon = "LIB_TT33";
phx_loadout_sidearm_mag = "LIB_8Rnd_762x25:2";

//Magazine classnames for AR and MMG
phx_loadout_ar_mag = "LIB_71Rnd_762x25_t:11";
phx_loadout_mmg_mag = "LIB_47Rnd_762x54d:12";

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "";
phx_loadout_am_mag = "LIB_47Rnd_762x54d:6";

//Light AT
phx_loadout_antitank_weapon = "LIB_PzFaust_30m";
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
  case ROLE_AAT: {phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6"}; //Assistant anti-tank
  case ROLE_P: {phx_loadout_smoke = "SmokeShell:2"}; //Pilot
  case ROLE_CR: {phx_loadout_smoke = "SmokeShell:2"; phx_loadout_grenade = ""}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "LIB_M9130PU";
    phx_loadout_rifle_mag = "LIB_5Rnd_762x54_t46:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_SU";
