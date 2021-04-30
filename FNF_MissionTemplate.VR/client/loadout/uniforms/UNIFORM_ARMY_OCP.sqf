phx_loadout_uniform  = "rhs_uniform_cu_ocp";
phx_loadout_vest     = "rhsusf_iotv_ocp_Rifleman";
phx_loadout_headgear = "rhsusf_ach_helmet_headset_ess_ocp_alt";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then { phx_loadout_vest = "rhsusf_iotv_ocp_Grenadier";}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then { phx_loadout_vest = "rhsusf_iotv_ocp_SAW";}; //AR & MG

if (pRole == ROLE_CLS) then { phx_loadout_vest = "rhsusf_iotv_ocp_Medic";}; //Medic

if (pRole == ROLE_CR) then { phx_loadout_headgear = "rhsusf_cvc_ess"; phx_loadout_vest = "rhsusf_iotv_ocp";}; // Crewman

#include "base\WEST_D.sqf"
