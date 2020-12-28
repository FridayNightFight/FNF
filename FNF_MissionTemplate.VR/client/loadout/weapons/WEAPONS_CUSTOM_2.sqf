/*
For magazines, use the format "MAGAZINE_CLASSNAME:NUMBER_OF_MAGS"
example:
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:9"; //mag classname of "rhs_mag_30Rnd_556x45_M855A1_Stanag", with 9 magazines
*/
#include "..\cfgLoadouts.hpp"

//Optional: You can create a base for the loadout by uncommenting the line below and removing 2 of the functions
//If using a base, remove lines from this file that you don't want to overwrite the base
//call giveBLUFORLoadout giveOPFORLoadout giveINDFORLoadout;

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "";
phx_loadout_rifle_mag_tracer = "";
phx_loadout_rifle_mag = "";

//Global sidearm classes
phx_loadout_sidearm_weapon = "";
phx_loadout_sidearm_mag = "";

//Leadership roles - can delete this if you don't want leaders to have GLs or different primary weapons
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "";
  //phx_loadout_rifle_mag = ""; //Uncomment and use this if you give the leaders a weapon with different mag classname than global
  phx_loadout_rifle_gl_he = "";
  phx_loadout_rifle_gl_smoke = "";
  phx_loadout_rifle_gl_flare = "";
};

//AR and MG weapon and magazine classes
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "";
  phx_loadout_rifle_mag = "";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "";
  phx_loadout_rifle_mag = "";
};

//Magazine classnames for assistant AR and MMG ammo man roles (these are the extra mags for the machinegunner)
phx_loadout_aar_mag = "";
phx_loadout_am_mag = "";

//Light AT
phx_loadout_antitank_weapon = "";
phx_loadout_antitank_mag = "";

//Medium AT - remove the block comment to customize, otherwise will use whatever is set in the config
/*
phx_loadout_mediumantitank_weapon = "";
phx_loadout_mediumantitank_optic = "";
phx_loadout_mediumantitank_mag = "";
*/

//Marksman optic
phx_loadout_rifle_optic = "";

phx_allowedOptics = []; //Optic classnames (array of strings) that can be selected in the gear selector
phx_allowedWeapons = []; //Weapon classnames (array of strings) that can be selected
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
