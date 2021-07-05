phx_loadout_uniform = "rhs_uniform_FROG01_wd";
phx_loadout_vest = "rhsusf_spc_light";
phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd";

if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsusf_spc_corpsman";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhsusf_spc_squadleader";
  phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk2";
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk2";
  phx_loadout_vest = "rhsusf_spc_squadleader";
};
if (pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_vest = "rhsusf_spc_mg";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsusf_spc_marksman";
};

#include "base\WEST_WD.sqf"
