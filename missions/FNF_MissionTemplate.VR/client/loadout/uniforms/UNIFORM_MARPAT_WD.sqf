#include "..\cfgLoadouts.hpp"

phx_loadout_uniform = "rhs_uniform_FROG01_wd";
phx_loadout_vest = "rhsusf_spc_light";
phx_loadout_backpack = "rhsusf_falconii_coy";
phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsusf_spc_corpsman";
  phx_loadout_backpack = "B_FieldPack_cbr";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhsusf_spc_squadleader";
  phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk2";
  phx_loadout_backpack = phx_loadout_lrRadio;
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk2";
  phx_loadout_vest = "rhsusf_spc_squadleader";
};
if (pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_vest = "rhsusf_spc_mg";
};
if (pRole == ROLE_AAR || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_FieldPack_cbr";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_vest = "rhsusf_plateframe_light";
  phx_loadout_backpack = phx_loadout_lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_vest = "rhsusf_spc_crewman";
  phx_loadout_headgear = "rhsusf_cvc_green_ess";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsusf_spc_marksman";
};
if (pRole == ROLE_CE) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_AT || pRole == ROLE_AAT) then {
  phx_loadout_backpack = "B_Kitbag_cbr";
};
