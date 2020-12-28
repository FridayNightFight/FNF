#include "..\cfgLoadouts.hpp"

phx_loadout_uniform = "rhs_uniform_emr_des_patchless";
phx_loadout_vest = "rhs_6b23_ML_6sh92";
phx_loadout_backpack = "B_FieldPack_khk";
phx_loadout_headgear = "rhs_6b27m_ml";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsgref_6b23_khaki_medic";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhs_6b23_ML_6sh92_vog_headset";
  phx_loadout_backpack = phx_loadout_lrRadio;
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhs_6b23_ML_6sh92_vog_headset";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "rhs_6b23_ML";
  phx_loadout_backpack = phx_loadout_lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_vest = "rhs_6b23_ML_crew";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_ML_sniper";
};
if (pRole == ROLE_AT) then {
  phx_loadout_backpack = "B_AssaultPack_cbr";
};
if (pRole == ROLE_CE) then {
  phx_loadout_backpack = "B_Kitbag_tan";
};
