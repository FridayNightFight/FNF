phx_loadout_uniform = "rhsgref_uniform_specter";
phx_loadout_vest = "rhs_6b23_6sh116";
phx_loadout_headgear = "rhs_6b47_bala";

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhs_6b23_6sh116_vog";
};

if (pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_vest = "rhs_6b23_digi"
};

if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_digi_sniper";
};

#include "base\EAST_WD.sqf"
