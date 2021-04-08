phx_loadout_uniform = "rhsgref_uniform_para_ttsko_mountain";
phx_loadout_headgear = "rhsgref_ssh68_ttsko_mountain";
phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_rifleman";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_officer";}; //PL, SL
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_nco";};

if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_medic";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_sniper";
};

#include "base\IND_WD.sqf"
