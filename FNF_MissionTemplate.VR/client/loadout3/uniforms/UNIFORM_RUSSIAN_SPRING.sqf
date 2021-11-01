phx_loadout_uniform = "rhs_uniform_6sh122_gloves_v1";
phx_loadout_vest = "rhs_6b3_AK";
phx_loadout_headgear = "rhsusf_opscore_fg_pelt";

if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_6b3_AK_3";
};
if (phx_loadout_unitLevel == 2) then {
  phx_loadout_vest = "rhs_6b3_R148";
};
if (phx_loadout_unitLevel == 1) then {
  phx_loadout_vest = "rhs_6b3_R148";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b3_holster";
};

#include "base\EAST_WD.sqf"
