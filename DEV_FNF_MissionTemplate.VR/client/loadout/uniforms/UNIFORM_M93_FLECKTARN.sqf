#include "..\cfgLoadouts.hpp"
#include "UNIFORM_EMR_SUMMER.sqf";

//Global customization - will be applied to every role
phx_loadout_uniform = "rhsgref_uniform_flecktarn_full";
phx_loadout_headgear = "rhs_6b28_green";
phx_loadout_vest = "rhsgref_chestrig";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhsgref_alice_webbing";}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "rhsgref_chicom";}; //AR & MG

if (pRole == ROLE_AAR || pRole == ROLE_AM) then {}; // AAR & MG Ammo man

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

if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_backpack = phx_loadout_lrRadio;
};

//This will give PLs and SLs radio backpacks, remove if wanted
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_backpack = phx_loadout_lrRadio;
};
