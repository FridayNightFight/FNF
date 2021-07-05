phx_loadout_uniform = selectRandom ["rhsgref_uniform_altis_lizard", "rhsgref_uniform_altis_lizard_olive"];
phx_loadout_vest = "rhsgref_chicom";
phx_loadout_headgear = "rhsgref_helmet_pasgt_altis_lizard";

if (phx_loadout_unitLevel > 0) then { phx_loadout_headgear = "rhssaf_beret_green";}; //PL, SL, TL, MGTL

#include "base\IND_WD.sqf"
