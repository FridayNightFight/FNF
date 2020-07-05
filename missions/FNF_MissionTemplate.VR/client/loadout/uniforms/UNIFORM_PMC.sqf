#include "..\cfgLoadouts.hpp"

//Global customization
phx_loadout_uniform = selectRandom ["U_I_G_resistanceLeader_F", "U_B_CombatUniform_mcam_tshirt", "rhs_uniform_g3_rgr", "rhs_uniform_g3_m81"];
phx_loadout_vest = selectRandom ["rhsusf_plateframe_light", "rhsusf_plateframe_rifleman", "rhsusf_plateframe_rifleman", "rhsusf_mbav_light", "V_PlateCarrier1_blk", "V_PlateCarrier2_blk"];
phx_loadout_backpack = selectRandom ["B_AssaultPack_cbr", "B_AssaultPack_rgr", "B_FieldPack_cbr", "B_FieldPack_khk", "B_TacticalPack_blk", "B_Kitbag_cbr", "B_Kitbag_rgr"];

if (pRole == ROLE_AAR || pRole == ROLE_AM || pRole == ROLE_AAT || pRole == ROLE_CLS || pRole == ROLE_CE) then {
  phx_loadout_backpack = selectRandom ["B_Kitbag_cbr", "B_Kitbag_rgr"];
};

phx_loadout_headgear = selectRandom ["rhsusf_opscore_bk", "rhsusf_opscore_fg", "rhsusf_opscore_ut"];

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {}; //Anti-tank
  case ROLE_AAT: {}; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_headgear = "H_PilotHelmetHeli_B";
    phx_loadout_vest = "rhsusf_plateframe_light";
    phx_loadout_backpack = phx_loadout_lrRadio;
  }; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {}; //Marksman
};

if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_backpack = phx_loadout_lrRadio;
};
