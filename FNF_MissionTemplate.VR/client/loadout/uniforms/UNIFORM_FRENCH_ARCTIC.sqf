#include "..\cfgLoadouts.hpp"

//Global customization - will be applied to every role
//Must have a uniform and/or helmet defined here to make the uniform diary record appear
phx_loadout_uniform  = "U_mas_fra_B_suite_WINT";
phx_loadout_vest     = "V_mas_fra_PlateCarrierLR_wint";
phx_loadout_backpack = "B_mas_fra_Kitbag_w2";
phx_loadout_headgear = "H_mas_fra_airframe_w";

if (pRole == ROLE_P) then { phx_loadout_headgear = "H_CrewHelmetHeli_B"; phx_loadout_backpack = phx_loadout_lrRadio;}; // Pilot Loadout

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {}; //Medium Anti-tank
  case ROLE_AAT: {}; //Assistant anti-tank
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {}; //Marksman
};

//This will give PLs and SLs radio backpacks, remove if wanted
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_backpack = phx_loadout_lrRadio;
};
