phx_loadout_uniform = "rhsgref_uniform_flecktarn_full";
phx_loadout_headgear = "rhs_6b28_green";
phx_loadout_vest = "rhsgref_chestrig";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhsgref_alice_webbing";}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "rhsgref_chicom";}; //AR & MG

#include "base\IND_WD.sqf"
