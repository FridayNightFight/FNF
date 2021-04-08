phx_loadout_uniform = "rhsgref_uniform_tigerstripe";
phx_loadout_headgear = "rhs_6b7_1m_olive";
phx_loadout_vest = "rhsgref_chestrig";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhsgref_alice_webbing";}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "rhsgref_chicom";}; //AR & MG

#include "base\IND_WD.sqf"
