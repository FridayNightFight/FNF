#include "..\cfgLoadouts.hpp"

//Optional: You can create a base for the loadout by uncommenting the line below and removing 2 of the functions
//If using a base, remove lines from this file that you don't want to overwrite the base
//call giveBLUFORLoadout giveOPFORLoadout giveINDFORLoadout;

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon     = "arifle_Katiba_F";
phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:4";
phx_loadout_rifle_mag        = "30Rnd_65x39_caseless_green:7";

//Global sidearm classes
phx_loadout_sidearm_weapon = "hgun_Rook40_F";
phx_loadout_sidearm_mag    = "16Rnd_9x21_Mag:2";

//Leadership roles - can delete this if you don't want leaders to have GLs or different primary weapons
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon   = "arifle_Katiba_GL_F";
  phx_loadout_rifle_gl_he    = "1Rnd_HE_Grenade_shell:6";
  phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
  phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
};

//AR and MG weapon and magazine classes
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkm";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR_green:8";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkp";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR_green:8";
};

//Magazine classnames for assistant AR and MMG ammo man roles (these are the extra mags for the machinegunner)
phx_loadout_aar_mag = "150Rnd_762x54_Box_Tracer:6";
phx_loadout_am_mag = "rhs_100Rnd_762x54mmR_green:7";

//Pilot weapon and magazine classes
if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "arifle_Katiba_C_F";
  phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:4";
};

//Marksman weapon and magazine classes
if (pRole == ROLE_MK) then {
    phx_loadout_rifle_weapon = "srifle_DMR_01_F";
    phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:8";
};

//Light AT
phx_loadout_antitank_weapon = "rhs_weap_rpg26";

//Optic classnames (array of strings) that can be selected in the gear selector
phx_allowedOptics    = ["optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high"];

//Weapon classnames (array of strings) that can be selected
phx_allowedWeapons = [];

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
  case ROLE_AAT: {}; //Assistant anti-tank
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {}; //Marksman
  case ROLE_R: {}; //Rifleman
};
