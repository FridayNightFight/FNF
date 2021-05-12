phx_loadout_uniform  = "rhs_uniform_cu_ocp"; //per req
phx_loadout_vest     = "rhsusf_spcs_ocp_rifleman"; //per req
phx_loadout_headgear = "rhsusf_opscore_ut_pelt_nsw"; // per req

switch (pRole) do {
  case ROLE_PL: {phx_loadout_vest = "rhsusf_spcs_ocp_squadleader"}; //Platoon leader
  case ROLE_CLS: {phx_loadout_vest = "rhsusf_spcs_ocp_medic"}; //Medic
  case ROLE_SL: {phx_loadout_vest = "rhsusf_spcs_ocp_squadleader"}; //Squad leader
  case ROLE_TL: {phx_loadout_vest = "rhsusf_spcs_ocp_teamleader"}; //Team leader
  case ROLE_AR: {phx_loadout_vest = "rhsusf_spcs_ocp_saw"}; //Automatic rifleman
  case ROLE_AAR: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Assistant automatic rifleman
  case ROLE_RAT: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Rifleman (LAT)
  case ROLE_CE: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Combat engineer
  case ROLE_R: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Rifleman
  case ROLE_MG: {phx_loadout_vest = "rhsusf_spcs_ocp_machinegunner"}; //Machinegunner
  case ROLE_AM: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Ammo man
  case ROLE_MGTL: {phx_loadout_vest = "rhsusf_spcs_ocp_teamleader"}; //Machine gun team leader
  case ROLE_AT: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Anti-tank
  case ROLE_AAT: {phx_loadout_vest = "rhsusf_spcs_ocp_rifleman"}; //Assistant anti-tank
  case ROLE_P: {phx_loadout_vest = "rhsusf_spcs_ocp"}; //Pilot
  case ROLE_CR: {phx_loadout_vest = "rhsusf_spcs_ocp_crewman"}; //Crewman
  case ROLE_MK: {phx_loadout_vest = "rhsusf_spcs_ocp_sniper"}; //Marksman
};
#include "base\WEST_WD.sqf"
