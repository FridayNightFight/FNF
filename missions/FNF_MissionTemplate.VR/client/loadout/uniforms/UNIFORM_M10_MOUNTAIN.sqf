#include "..\cfgLoadouts.hpp"
#include "UNIFORM_EMR_SUMMER.sqf";

//Global customization - will be applied to every role
phx_loadout_uniform = "rhsgref_uniform_para_ttsko_mountain";
phx_loadout_headgear = "rhsgref_ssh68_ttsko_mountain";
phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_rifleman";
phx_loadout_backpack = "B_AssaultPack_rgr";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_officer";}; //PL, SL
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_nco";};

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_backpack = "B_Kitbag_rgr";}; //AR & MG

if (pRole == ROLE_AAR || pRole == ROLE_AM) then {phx_loadout_backpack = "B_Kitbag_rgr";}; // AAR & MG Ammo man

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_medic";}; //Medic
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
  case ROLE_AT: {phx_loadout_backpack = "B_Kitbag_rgr";}; //Medium Anti-tank
  case ROLE_AAT: {}; //Assistant anti-tank
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_sniper";}; //Marksman
};

if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_backpack = phx_loadout_lrRadio;
  phx_loadout_vest = "rhsgref_6b23_ttsko_mountain";
};

//This will give PLs and SLs radio backpacks, remove if wanted
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_backpack = phx_loadout_lrRadio;
};
