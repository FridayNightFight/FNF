#include "UNIFORM_MARPAT_WD.sqf"

phx_loadout_uniform = "rhs_uniform_acu_oefcp";
phx_loadout_headgear = "rhsusf_ach_helmet_ocp";

if (phx_loadout_unitLevel > 0) then {phx_loadout_headgear = "rhsusf_ach_helmet_headset_ocp";}; //PL, SL, TL, MGTL

#include "base\WEST_WD.sqf"
