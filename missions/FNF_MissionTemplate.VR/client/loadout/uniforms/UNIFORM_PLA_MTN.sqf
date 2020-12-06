#include "..\cfgLoadouts.hpp"

//Global customization - will be applied to every role
//Must have a uniform and/or helmet defined here to make the uniform diary record appear
phx_loadout_uniform  = "U_mas_chi_O_sold1";
phx_loadout_vest     = "V_mas_chi_PlateCarrier_o";
phx_loadout_backpack = "O_mas_chi_Kitbag_m";
phx_loadout_headgear = "H_mas_chi_HelmetO_gog";


if (pRole == ROLE_PL) then { phx_loadout_uniform = "U_mas_chi_O_officer1";};

if (pRole == ROLE_P) then { phx_loadout_headgear = "H_mas_chi_HelmetPilot_O"; phx_loadout_backpack = phx_loadout_lrRadio;};

if (pRole == ROLE_AAR || pRole == ROLE_AM || pRole == ROLE_CE || pRole == ROLE_AAT) then {
  phx_loadout_backpack = "O_mas_chi_Kitbag_m2";
};

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
