phx_loadout_uniform = "rhsgref_uniform_gorka_1_f";
phx_loadout_vest = "rhsgref_6b23_ttsko_digi_rifleman";
phx_loadout_headgear = "rhsgref_helmet_pasgt_flecktarn";

//TL, MGTL
if (phx_loadout_unitLevel == 1) then
{
	phx_loadout_headgear = "rhsusf_bowman";
	phx_loadout_vest = "rhsgref_6b23_ttsko_digi_officer";
};

//PL, SL
if (phx_loadout_unitlevel == 2) then
{
	phx_loadout_headgear = "rhsusf_bowman";
	phx_loadout_vest = "rhsgref_6b23_ttsko_digi_nco";
};

#include "base\WEST_WD.sqf"
