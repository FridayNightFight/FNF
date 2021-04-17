#include "..\cfgLoadouts.hpp"

//Global customization - will be applied to every role
//Must have a uniform and/or helmet defined here to make the uniform diary record appear
phx_loadout_uniform  = "rhs_uniform_cu_ocp";
phx_loadout_vest     = "rhsusf_iotv_ocp_Rifleman";
phx_loadout_backpack = "rhsusf_assault_eagleaiii_ocp";
phx_loadout_headgear = "rhsusf_ach_helmet_headset_ess_ocp_alt";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then { phx_loadout_vest = "rhsusf_iotv_ocp_Grenadier";}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then { phx_loadout_vest = "rhsusf_iotv_ocp_SAW";}; //AR & MG

if (pRole == ROLE_CLS) then { phx_loadout_vest = "rhsusf_iotv_ocp_Medic";}; //Medic

if (pRole == ROLE_CR) then { phx_loadout_headgear = "rhsusf_cvc_ess"; phx_loadout_vest = "rhsusf_iotv_ocp"; phx_loadout_backpack = phx_loadout_lrRadio;}; // Crewman

if (pRole == ROLE_P) then { phx_loadout_headgear = "H_CrewHelmetHeli_B"; phx_loadout_vest = "rhsusf_iotv_ocp"; phx_loadout_backpack = phx_loadout_lrRadio;}; // Pilot



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
