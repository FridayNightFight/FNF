phx_loadout_uniform  = "rhs_uniform_cu_ocp"; //per req
phx_loadout_vest     = "rhsusf_spcs_ocp_rifleman"; //per req
phx_loadout_headgear = "rhsusf_opscore_ut_pelt_nsw"; // per req

  if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "rhsusf_spcs__ocp_saw";}; //AR & MG

  if (pRole == ROLE_SL || pRole == ROLE_PL) then {phx_loadout_vest = "rhsusf_spcs_ocp_squadleader";}; //SLPL

  if (pRole == ROLE_CLS) then  {phx_loadout_vest = "rhsusf_spcs_ocp_medic";}; //Medic

  if (pRole == ROLE_TL || pRole == ROLE_MGTL) then  {phx_loadout_vest = "rhsusf_spcs_ocp_teamleader";}; //TL

  if (pRole == ROLE_MG) then  {phx_loadout_vest = "rhsusf_spcs_ocp_machinegunner";}; //Machinegunner

  if (pRole == ROLE_P) then   {phx_loadout_vest = "rhsusf_spcs_ocp";}; //Pilot

  if (pRole == ROLE_CR) then  {phx_loadout_vest = "rhsusf_spcs_ocp_crewman";}; //Crewman

  if (pRole == ROLE_MK) then  {phx_loadout_vest = "rhsusf_spcs_ocp_sniper";}; //Marksman

#include "base\WEST_WD.sqf"
