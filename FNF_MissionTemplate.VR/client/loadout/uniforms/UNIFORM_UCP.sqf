phx_loadout_uniform = "rhs_uniform_cu_ucp";
phx_loadout_vest = "rhsusf_iotv_ucp_Rifleman";
phx_loadout_headgear = "rhsusf_ach_helmet_headset_ess_ucp_alt";

if (phx_loadout_unitLevel > 0) then {
  phx_loadout_headgear = "rhsusf_ach_helmet_headset_ucp";
  phx_loadout_vest = "rhsusf_iotv_ucp_Squadleader";
}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_headgear = "rhsusf_ach_helmet_headset_ess_ucp";
  phx_loadout_vest = "rhsusf_iotv_ucp_Saw";
}; //AR & MG

if (pRole == ROLE_AAR || pRole == ROLE_AM) then {
  phx_loadout_vest = "rhsusf_iotv_ucp_Repair";
  phx_loadout_headgear = "rhsusf_ach_helmet_headset_ess_ucp"
}; // AAR & MG Ammo man

if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsusf_iotv_ucp_Medic";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsusf_spcs_ucp_sniper";
  phx_loadout_headgear = "rhsusf_ach_helmet_ucp_alt";
};

#include "base\WEST_WD.sqf"
