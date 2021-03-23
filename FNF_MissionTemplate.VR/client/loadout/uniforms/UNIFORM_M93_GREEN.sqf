phx_loadout_uniform = selectRandom ["rhsgref_uniform_og107","rhsgref_uniform_og107_erdl"];
phx_loadout_vest = "rhsgref_chestrig";
phx_loadout_headgear = "rhs_6b7_1m_olive";

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhsgref_alice_webbing";}; //PL, SL, TL, MGTL

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "rhsgref_chicom";}; //AR & MG

#include "base\EAST_WD.sqf"
