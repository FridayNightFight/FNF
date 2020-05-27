#include "..\cfgLoadouts.hpp"

//Random guerrilla-style equipment

//Global customization
phx_loadout_uniform = selectRandom ["U_I_G_resistanceLeader_F", "U_BG_Guerrilla_6_1", "U_BG_Guerilla1_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_BG_leader", "rhsgref_uniform_TLA_2", "rhsgref_uniform_woodland_olive", "rhssaf_uniform_m93_oakleaf_summer", "rhssaf_uniform_m93_oakleaf", "rhsgref_uniform_og107_erdl"];
phx_loadout_vest = selectRandom ["V_PlateCarrierIA1_dgtl", "V_Chestrig_rgr", "V_BandollierB_rgr", "V_TacVest_blk", "V_I_G_resistanceLeader_F", "rhs_6b23", "rhs_6b13_EMR", "rhs_6b23_rifleman", "rhs_6sh92", "rhs_6sh92_vsr", "rhsusf_mbav", "rhsusf_mbav_rifleman", "rhsusf_plateframe_sapi", "rhsgref_6b23_khaki", "rhsgref_chestrig", "rhsgref_chicom", "rhsgref_otv_khaki", "rhsgref_TacVest_ERDL", "rhssaf_vest_md99_digital_rifleman", "rhssaf_vest_md99_woodland", "rhssaf_vest_md98_rifleman"];
phx_loadout_backpack = selectRandom ["B_AssaultPack_cbr", "B_AssaultPack_rgr", "B_Carryall_oli", "B_Carryall_khk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_Kitbag_cbr", "B_Kitbag_sgg", "B_Kitbag_rgr", "B_TacticalPack_blk", "B_TacticalPack_oli", "rhs_sidor", "rhs_assault_umbts", "rhssaf_kitbag_md2camo"];
phx_loadout_headgear = selectRandom ["rhs_6b26_green", "rhs_6b27m_green", "rhs_6b7_1m_bala1", "H_Bandanna_cbr", "H_Bandanna_camo", "H_Cap_grn", "H_Shemag_olive", "H_ShemagOpen_tan", "rhs_altyn_novisor_bala", "rhs_ssh68", "rhsusf_protech_helmet", "rhsgref_bcap_specter", "rhsgref_6b27m_ttsko_digi", "rhsgref_helmet_M1_bare_alt01", "rhsgref_helmet_m1942", "rhssaf_helmet_m97_black_nocamo", "rhssaf_helmet_m97_veil_woodland", "rhssaf_helmet_m97_veil_oakleaf"];

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
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {}; //Marksman
};

//Uncomment this block to give PLs and SLs radio backpacks
/*
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_backpack = phx_loadout_lrRadio;
};
*/

phx_noGearAddError = true;
