phx_loadout_uniform = "rhs_uniform_emr_patchless";
phx_loadout_vest = "rhs_6b23_digi_6sh92";
phx_loadout_headgear = "rhs_6b27m_digi";

if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_6b23_digi_medic";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhs_6b23_digi_6sh92_vog_headset";
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhs_6b23_digi_6sh92_vog_headset";
};
if (pRole == ROLE_CR) then {
  phx_loadout_vest = "rhs_6b23_digi_crew";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_digi_sniper";
};

#include "base\EAST_WD.sqf"
