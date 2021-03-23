phx_loadout_uniform = "rhs_uniform_acu_oefcp";
phx_loadout_headgear = "rhsusf_ach_helmet_ocp";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_headgear = "rhsusf_ach_helmet_headset_ocp";}; //PL, SL, TL, MGTL

if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhsusf_cvc_green_ess";
};

#include "base\WEST_WD.sqf"
