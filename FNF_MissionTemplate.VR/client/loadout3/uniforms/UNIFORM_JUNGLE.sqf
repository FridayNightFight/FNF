phx_loadout_uniform = selectRandom["rhsgref_uniform_og107","rhsgref_uniform_og107_erdl","rhsgref_uniform_erdl"];
phx_loadout_vest = "rhsgref_alice_webbing";
phx_loadout_headgear = selectRandom["H_Booniehat_oli","rhsgref_helmet_pasgt_erdl"];

if (phx_loadout_unitLevel == 1) then
{
	phx_loadout_headgear = "H_Bandanna_khk";
};

if (phx_loadout_unitLevel == 2) then
{
	phx_loadout_headgear = "rhsgref_hat_M1951";
};

#include "base\IND_WD.sqf"
