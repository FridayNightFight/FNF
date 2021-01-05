#include "..\cfgLoadouts.hpp"

//Optional: You can create a base for the loadout by uncommenting the line below and removing 2 of the functions
//If using a base, remove lines from this file that you don't want to overwrite the base
call giveBLUFORLoadout;

//AR and MG weapon and magazine classes
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_m27iar_grip";
  phx_loadout_rifle_mag    = "rhs_mag_100Rnd_556x45_M855A1_cmag_mixed:10";
};

//Magazine classnames for assistant AR
phx_loadout_aar_mag = "rhs_mag_100Rnd_556x45_M855A1_cmag_mixed:10";

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
