phx_loadout_uniform = "rhs_uniform_flora_patchless";
phx_loadout_vest = "rhs_6b13_Flora_6sh92";
phx_loadout_headgear = "rhs_6b26";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {phx_loadout_vest = "rhs_6b13_Flora_6sh92_headset_mapcase";}; //PL, SL, TL, MGTL
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhs_6b13_Flora_6sh92_radio";};

if (pRole == ROLE_CR) then {
  phx_loadout_vest = "rhs_6b13_Flora";
};

#include "base\EAST_WD.sqf"
