class CfgPatches
{
 class fnf_backpacks
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"tfar_backpacks","UK3CB_Factions_Equipment_Backpack","UK3CB_Factions_Equipment_CW_Backpack_Soviet","A3_Weapons_F_Ammoboxes","rhsusf_c_troops","A3_Supplies_F_Enoch_Bags","UK3CB_Factions_Equipment_CW_Backpack_US","TRYK_BackPack","UK3CB_Factions_Backpack2","A3_Supplies_F_Exp","mas_chi_army_back","A3_Supplies_F_Orange_Bags","vtf_kf_units","A3_Supplies_F_AoW_Bags","rhs_c_troops","rhsusf_c_uav","UK3CB_BAF_Equipment_Backpacks","ace_common","rhssaf_c_gear","ace_gunbag","rhsgref_c_troops","UK3CB_Factions_AAF_I","UK3CB_Factions_AAF_O","UK3CB_Factions_ADA_B","UK3CB_Factions_ADA_I","UK3CB_Factions_ADA_O","UK3CB_Factions_ADE_I","UK3CB_Factions_ADE_O","UK3CB_Factions_ADG_B","UK3CB_Factions_ADG_I","UK3CB_Factions_ADG_O","UK3CB_Factions_ADM_B","UK3CB_Factions_ADM_I","UK3CB_Factions_ADM_O","UK3CB_Factions_ADP_B","UK3CB_Factions_ADP_I","UK3CB_Factions_ADP_O","UK3CB_Factions_ADR_B","UK3CB_Factions_ADR_I","UK3CB_Factions_ADR_O","UK3CB_Factions_ANA_B","UK3CB_Factions_ANP_B","UK3CB_Factions_APD_B","UK3CB_Factions_APD_I","UK3CB_Factions_APD_O","UK3CB_Factions_ARD_B","UK3CB_Factions_ARD_I","UK3CB_Factions_ARD_O","UK3CB_Factions_CHD_B","UK3CB_Factions_CHD_I","UK3CB_Factions_CHD_O","UK3CB_Factions_CHD_W_B","UK3CB_Factions_CHD_W_I","UK3CB_Factions_CHD_W_O","UK3CB_Factions_CSAT_A_O","UK3CB_Factions_CSAT_B_O","UK3CB_Factions_CSAT_G_O","UK3CB_Factions_CSAT_F_O","UK3CB_Factions_CSAT_N_O","UK3CB_Factions_CSAT_M_O","UK3CB_Factions_CSAT_U_O","UK3CB_Factions_CSAT_S_O","UK3CB_Factions_CSAT_W_O","ace_compat_rhs_afrf3","UK3CB_Factions_CW_SOV_O_EARLY","UK3CB_Factions_CW_SOV_O_LATE","UK3CB_Factions_FIA_B","UK3CB_Factions_FIA_I","UK3CB_Factions_FIA_O","UK3CB_Factions_GAF_B","UK3CB_Factions_GAF_I","UK3CB_Factions_GAF_O","UK3CB_Factions_ION_B_Desert","UK3CB_Factions_ION_B_Urban","UK3CB_Factions_ION_B_Winter","UK3CB_Factions_ION_B_Woodland","UK3CB_Factions_ION_I_Desert","UK3CB_Factions_ION_I_Urban","UK3CB_Factions_ION_I_Winter","UK3CB_Factions_ION_I_Woodland","UK3CB_Factions_ION_O_Desert","UK3CB_Factions_ION_O_Urban","UK3CB_Factions_ION_O_Winter","UK3CB_Factions_ION_O_Woodland","UK3CB_Factions_KDF_B","UK3CB_Factions_KDF_I","UK3CB_Factions_KDF_O","UK3CB_Factions_KRG_B","UK3CB_Factions_KRG_I","UK3CB_Factions_KRG_O","UK3CB_Factions_LDF_B","UK3CB_Factions_LDF_I","UK3CB_Factions_LDF_O","UK3CB_Factions_LFR_B","UK3CB_Factions_LFR_I","UK3CB_Factions_LFR_O","UK3CB_Factions_LNM_B","UK3CB_Factions_LNM_I","UK3CB_Factions_LNM_O","UK3CB_Factions_LSM_B","UK3CB_Factions_LSM_I","UK3CB_Factions_LSM_O","UK3CB_Factions_MEC_B","UK3CB_Factions_MEC_C","UK3CB_Factions_MEC_I","UK3CB_Factions_MEC_O","UK3CB_Factions_MEE_I","UK3CB_Factions_MEE_O","UK3CB_Factions_MEI_B","UK3CB_Factions_MEI_I","UK3CB_Factions_MEI_O","UK3CB_Factions_NAP_B","UK3CB_Factions_NAP_I","UK3CB_Factions_NAP_O","UK3CB_Factions_NFA_B","UK3CB_Factions_NFA_I","UK3CB_Factions_NFA_O","UK3CB_Factions_TKA_B","UK3CB_Factions_TKA_I","UK3CB_Factions_TKA_O","UK3CB_Factions_TKM_B","UK3CB_Factions_TKM_I","UK3CB_Factions_TKM_O","UK3CB_Factions_TKP_B","UK3CB_Factions_TKP_I","UK3CB_Factions_TKP_O","UK3CB_Factions_UN_B","UK3CB_Factions_UN_I"}; };
};
class cfgVehicles
{
 class Bag_Base;
 class B_Bergen_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_Bag_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_anarc210: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_rt1523g: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_rt1523g_big: TFAR_rt1523g
 {
  maximumLoad = 1000;
 };
 class TFAR_mr3000: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_anprc155: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Invisible: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Alice_D: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Alice_Bedroll_K: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Alice_Medic_Bedroll_K: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Alice_Bedroll_2_K: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Alice_Medic_Bedroll_2_K: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Hiker: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Fieldpack: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_US_Medic_Backpack: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_US_Backpack: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_rt1523g_Base: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Radio_Backpack: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Radio_Backpack: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Radio_Backpack: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Bedroll_Shovel_Backpack_KHK: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Alice_Radio_Backpack: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Alice_Radio_Backpack: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Alice_Radio_Backpack: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Assault_camo_Radio: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Assault_camo_Radio: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Assault_camo_Radio: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Tactical_Backpack: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Tactical_Backpack_Radio: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Tactical_Backpack_Radio: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Tactical_Backpack_Radio: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Small_Pack: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Largepack: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Largepack_Des: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Largepack_Med: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Largepack_Med_Des: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Backpack_Med: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Backpack_Med_OLI: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Backpack_Pocket: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Backpack_Pocket_OLI: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Backpack_Radio_Chem: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Backpack_Radio_Chem: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Backpack_Radio_Chem: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Backpack_Radio_Chem_OLI: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Backpack_Radio_Chem_OLI: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Backpack_Radio_Chem_OLI: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class B_TacticalPack_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_TacticalPack_oli: B_TacticalPack_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_TacticalPack_Oli: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_TacticalPack_Med_Oli: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class B_AssaultPack_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class rhsusf_assault_eagleaiii_ucp: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class B_RadioBag_01_base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_RadioBag_01_black_F: B_RadioBag_01_base_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_RadioBag_BLK: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_RadioBag_GRN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_RadioBag_KHK: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_RadioBag_TAN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_RadioBag_WIN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Bedroll_Backpack_KHK: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Alice_pack_01: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_B_Alice_pack_frame_radio_01: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_I_Alice_pack_frame_radio_01: TFAR_anprc155
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_O_Alice_pack_frame_radio_01: TFAR_mr3000
 {
  maximumLoad = 1000;
 };
 class B_Kitbag_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_FieldPack_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_Carryall_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_OutdoorPack_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_HuntingBackpack: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_AssaultPackG: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_BergenG: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_BergenC_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_AssaultPack_mcamo: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class B_AssaultPack_Kerry: B_AssaultPack_mcamo
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Kitbag_Base: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Kitbag_blk: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Kitbag_aaf: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Carryall_blk: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Carryall_wh: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Carryall_wood: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Carryall_JSDF: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Kitbag_Base_JSDF: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Coyotebackpack: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Coyotebackpack_OD: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Coyotebackpack_BLK: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Coyotebackpack_WH: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Alicepack: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Medbag: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Medbag_OD: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Medbag_BK: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Medbag_ucp: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_BLK: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_CYT: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_tan: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_br: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_GR: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_AOR1: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_Belt_AOR2: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_BAF_BAG_BLK: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_BAF_BAG_CYT: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_BAF_BAG_OD: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_BAF_BAG_rgr: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_BAF_BAG_mcamo: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_tube_cyt: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_tube_od: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_tube_blk: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_B_FieldPack_Wood: B_FieldPack_Base
 {
  maximumLoad = 1000;
 };
 class TRYK_Winter_pack: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_AssaultPack_rgr: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_DPM_68: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_DPM_85: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_DPM_95: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_DPM_ARID: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_DPM_SA: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_ERDL_AFG: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_GRK_LIZ: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_MAR: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_RHB: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_TRK: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_VEG: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_WDL_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_WDL_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_AssaultPack_WDL_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class B_Kitbag_cbr: B_Kitbag_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_DPM_68: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_DPM_85: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_DPM_95: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_DPM_ARID: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_DPM_SA: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_ERDL_AFG: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_GRK_LIZ: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_MAR: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_RHB: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_TRK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_VEG: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_WDL_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_WDL_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Kitbag_WDL_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class B_Carryall_khk: B_Carryall_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_DPM_68: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_DPM_85: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_DPM_95: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_DPM_ARID: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_DPM_SA: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_ERDL_AFG: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_GRK_LIZ: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_MAR: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_RHB: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_TRK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_VEG: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_WDL_01: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_WDL_02: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_B_Carryall_WDL_03: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class B_Bergen_Base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_ViperHarness_base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_ViperLightHarness_base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_FieldPack_khk: B_FieldPack_Base
 {
  maximumLoad = 1000;
 };
 class O_mas_chi_Kitbag_m: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class O_mas_chi_Kitbag_m2: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class B_Messenger_Base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_LegStrapBag_base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_CombinationUnitRespirator_01_Base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class vtf_kf_O_FieldPack_RPG_AT_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class vtf_kf_O_FieldPack_AA_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class vtf_kf_O_FieldPack_HAT_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class B_CivilianBackpack_01_Base_F: Bag_Base
 {
  maximumLoad = 1000;
 };
 class rhs_assault_umbts: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class rhs_rpg: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class rhs_sidor: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class rhs_medic_bag: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class rhs_rd54: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class rhs_r148: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class rhsusf_assault_eagleaiii_ocp: rhsusf_assault_eagleaiii_ucp
 {
  maximumLoad = 1000;
 };
 class rhsusf_assault_eagleaiii_ocp_engineer: rhsusf_assault_eagleaiii_ocp
 {
  maximumLoad = 1000;
 };
 class B_rhsusf_BACKPACK: B_Kitbag_Base
 {
  maximumLoad = 1000;
 };
 class B_rhsusf_B_BACKPACK: rhsusf_assault_eagleaiii_ocp
 {
  maximumLoad = 1000;
 };
 class UK3CB_BAF_B_Bergen_Base: B_Bergen_Base
 {
  maximumLoad = 1000;
 };
 class tf_rt1523g_big: TFAR_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class UK3CB_BAF_B_rt1523g_Base: tf_rt1523g_big
 {
  maximumLoad = 1000;
 };
 class tf_anarc210: TFAR_anarc210
 {
  maximumLoad = 1000;
 };
 class UK3CB_BAF_B_anarc210_Base: tf_anarc210
 {
  maximumLoad = 1000;
 };
 class ACE_FakeBackpack: Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_anarc164: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_bussole: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_mr6000l: TFAR_Bag_Base
 {
  maximumLoad = 1000;
 };
 class TFAR_rt1523g_sage: TFAR_rt1523g
 {
  maximumLoad = 1000;
 };
 class rhssaf_Kitbag_base: B_Kitbag_Base
 {
  maximumLoad = 1000;
 };
 class rhssaf_alice_md2camo: Bag_Base
 {
  maximumLoad = 1000;
 };
 class rhssaf_alice_smb: Bag_Base
 {
  maximumLoad = 1000;
 };
 class ace_gunbag: Bag_Base
 {
  maximumLoad = 1000;
 };
 class rhsgref_hidf_alicepack: Bag_Base
 {
  maximumLoad = 1000;
 };
 class rhs_rpg_empty: rhs_rpg
 {
  maximumLoad = 1000;
 };
 class UK3CB_AAF_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_AAF_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADA_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADA_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADA_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADE_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADE_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADG_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADG_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADG_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADM_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADM_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADM_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADP_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADP_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADP_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADR_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADR_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ADR_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ANA_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ANP_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_ASS_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_ASS_BLU_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_ASS_EKAM_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_ASS_EKAM_BLU_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_RIF_EKAM_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_RIF_MED_EKAM_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_RIF_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_RIF_MED_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_ENG_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_B_B_ENG_EKAM_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_ASS_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_ASS_BLU_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_ASS_EKAM_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_ASS_EKAM_BLU_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_RIF_EKAM_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_RIF_MED_EKAM_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_RIF_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_RIF_MED_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_ENG_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_I_B_ENG_EKAM_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_ASS_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_ASS_BLU_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_ASS_EKAM_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_ASS_EKAM_BLU_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_RIF_EKAM_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_RIF_MED_EKAM_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_RIF_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_RIF_MED_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_ENG_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_APD_O_B_ENG_EKAM_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ARD_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ARD_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_ARD_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CHD_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CHD_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CHD_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CHD_W_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CHD_W_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CHD_W_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_A_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_ASS: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_A_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class B_Carryall_oli: B_Carryall_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_A_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_ENG: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_ENG_BLK: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_ENG_BRN: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_ENG_KHK: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_ENG_GRN: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class B_FieldPack_blk: B_FieldPack_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_A_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_FIELDPACK: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_A_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_TACPACK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class B_RadioBag_01_eaf_F: B_RadioBag_01_base_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_A_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_B_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_G_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_M_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_N_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_RadioBag: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_ASS_UCP: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_RIF_UCP: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_ENG_UCP: B_Carryall_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_FIELDPACK_UCP: B_FieldPack_blk
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_TACPACK_UCP: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_F_O_B_RadioBag_UCP: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_UMBTS: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class rhs_assault_umbts_engineer: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class rhs_assault_umbts_engineer_empty: rhs_assault_umbts_engineer
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_UMBTS_ENG: rhs_assault_umbts_engineer_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_S_O_B_UMBTS_RADIO: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_UMBTS: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_UMBTS_ENG: rhs_assault_umbts_engineer_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_U_O_B_UMBTS_RADIO: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_UMBTS: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_UMBTS_ENG: rhs_assault_umbts_engineer_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_W_O_B_UMBTS_RADIO: rhs_assault_umbts
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_O_B_TACPACK_BLK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_O_B_TACPACK_BRN: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_O_B_TACPACK_KHK: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_O_B_TACPACK_GRN: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CSAT_O_B_TACPACK_OLI: B_TacticalPack_oli
 {
  maximumLoad = 1000;
 };
 class UK3CB_CW_SOV_O_EARLY_B_VDV_RIF: rhs_rd54
 {
  maximumLoad = 1000;
 };
 class UK3CB_CW_SOV_O_EARLY_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_CW_SOV_O_LATE_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_B_B_ASS_OLI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class B_AssaultPack_khk: B_AssaultPack_Base
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_B_B_ASS_KHK: B_AssaultPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_I_B_ASS_OLI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_I_B_ASS_KHK: B_AssaultPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_O_B_ASS_OLI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_O_B_ASS_KHK: B_AssaultPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_FIA_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class rhsusf_assault_eagleaiii_coy: rhsusf_assault_eagleaiii_ucp
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_MED_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_MED_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_MED_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_Radio_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_Radio_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RIF_Radio_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ASS_DIGI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ASS_OLI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ASS_TAN: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ASS_MULTICAM_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ASS_MULTICAM_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ENG_DIGI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ENG_OLI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ENG_TAN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ENG_MULTICAM_01: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_B_B_ENG_MULTICAM_02: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_MED_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_MED_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_MED_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_Radio_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_Radio_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RIF_Radio_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ASS_DIGI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ASS_OLI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ASS_TAN: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ASS_MULTICAM_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ASS_MULTICAM_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ENG_DIGI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ENG_OLI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ENG_TAN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ENG_MULTICAM_01: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_I_B_ENG_MULTICAM_02: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_MED_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_MED_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_MED_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_Radio_DIGI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_Radio_OLI: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RIF_Radio_TAN: rhsusf_assault_eagleaiii_coy
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ASS_DIGI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ASS_OLI: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ASS_TAN: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ASS_MULTICAM_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ASS_MULTICAM_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ENG_DIGI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ENG_OLI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ENG_TAN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ENG_MULTICAM_01: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_GAF_O_B_ENG_MULTICAM_02: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_BLK_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_BLK_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_BLK_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_MED_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_BLK_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_BLK_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ENG_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RadioBag_BLK: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_DES_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_DES_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_DES_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_MED_DES: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_DES_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_DES_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_DES_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ENG_DES: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RadioBag_DES: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_BRN_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_BRN_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_BRN_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_OLI_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_OLI_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_OLI_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_MED_BRN: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_MED_OLI: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_OLI_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_OLI_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_OLI_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_BRN_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_BRN_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_BRN_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ENG_BRN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ENG_OLI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RadioBag_BRN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RadioBag_OLI: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_WIN_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_WIN_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_WIN_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RIF_MED_WIN: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_WIN_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_WIN_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ASS_WIN_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_ENG_WIN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_RadioBag_WIN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class B_LegStrapBag_black_F: B_LegStrapBag_base_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_B_B_LegStrapBag_win: B_LegStrapBag_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_BLK_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_BLK_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_BLK_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_MED_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_BLK_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_BLK_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ENG_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RadioBag_BLK: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_DES_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_DES_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_DES_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_MED_DES: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_DES_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_DES_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_DES_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ENG_DES: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RadioBag_DES: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_BRN_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_BRN_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_BRN_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_OLI_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_OLI_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_OLI_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_MED_BRN: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_MED_OLI: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_OLI_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_OLI_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_OLI_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_BRN_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_BRN_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_BRN_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ENG_BRN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ENG_OLI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RadioBag_BRN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RadioBag_OLI: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_WIN_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_WIN_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_WIN_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RIF_MED_WIN: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_WIN_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_WIN_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ASS_WIN_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_ENG_WIN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_RadioBag_WIN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_I_B_LegStrapBag_win: B_LegStrapBag_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_BLK_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_BLK_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_BLK_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_MED_BLK: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_BLK_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_BLK_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_BLK_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ENG_BLK: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RadioBag_BLK: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_DES_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_DES_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_DES_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_MED_DES: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_DES_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_DES_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_DES_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ENG_DES: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RadioBag_DES: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_BRN_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_BRN_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_BRN_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_OLI_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_OLI_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_OLI_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_MED_BRN: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_MED_OLI: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_OLI_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_OLI_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_OLI_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_BRN_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_BRN_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_BRN_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ENG_BRN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ENG_OLI: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RadioBag_BRN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RadioBag_OLI: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_WIN_01: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_WIN_02: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_WIN_03: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RIF_MED_WIN: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_WIN_01: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_WIN_02: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ASS_WIN_03: B_AssaultPack_rgr
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_ENG_WIN: B_Carryall_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_RadioBag_WIN: B_RadioBag_01_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_ION_O_B_LegStrapBag_win: B_LegStrapBag_black_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_B_B_Sidor_RIF_OLI: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_B_B_Sidor_MD_OLI: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_B_B_Sidor_RIF_VSR: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_B_B_Sidor_MD_VSR: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_I_B_Sidor_RIF_OLI: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_I_B_Sidor_MD_OLI: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_I_B_Sidor_RIF_VSR: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_I_B_Sidor_MD_VSR: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_O_B_Sidor_RIF_OLI: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_O_B_Sidor_MD_OLI: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_O_B_Sidor_RIF_VSR: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_O_B_Sidor_MD_VSR: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_KDF_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_B_B_FieldPack_RIF: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_B_B_FieldPack_MED: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_B_B_FieldPack_SF_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_B_B_FieldPack_SF_MED: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_B_B_Radio: UK3CB_B_B_Radio_Backpack
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_I_B_FieldPack_RIF: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_I_B_FieldPack_MED: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_I_B_FieldPack_SF_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_I_B_FieldPack_SF_MED: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_I_B_Radio: UK3CB_B_I_Radio_Backpack
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_O_B_FieldPack_RIF: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_O_B_FieldPack_MED: B_FieldPack_khk
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_O_B_FieldPack_SF_RIF: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_O_B_FieldPack_SF_MED: B_Kitbag_cbr
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_KRG_O_B_Radio: UK3CB_B_O_Radio_Backpack
 {
  maximumLoad = 1000;
 };
 class UK3CB_LDF_B_B_RadioBag_GEO: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class B_RadioBag_01_tropic_F: B_RadioBag_01_base_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LDF_B_B_RadioBag_OLI: B_RadioBag_01_tropic_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LDF_I_B_RadioBag_GEO: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LDF_I_B_RadioBag_OLI: B_RadioBag_01_tropic_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LDF_O_B_RadioBag_GEO: B_RadioBag_01_eaf_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LDF_O_B_RadioBag_OLI: B_RadioBag_01_tropic_F
 {
  maximumLoad = 1000;
 };
 class B_Messenger_Olive_F: B_Messenger_Base_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_B_B_MESSENGER_OLI: B_Messenger_Olive_F
 {
  maximumLoad = 1000;
 };
 class B_Messenger_Coyote_F: B_Messenger_Base_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_B_B_MESSENGER_BRN: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_B_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_I_B_MESSENGER_OLI: B_Messenger_Olive_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_I_B_MESSENGER_BRN: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_I_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_O_B_MESSENGER_OLI: B_Messenger_Olive_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_O_B_MESSENGER_BRN: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LFR_O_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_LNM_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_LNM_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_LNM_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_PART_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_TIG_STRIPE_01_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_TIG_STRIPE_02_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_WDL_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_PART_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_TIG_STRIPE_01_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_TIG_STRIPE_02_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_Sidor_WDL_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_PART_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_TIG_STRIPE_01_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_TIG_STRIPE_02_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_WDL_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_PART_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_TIG_STRIPE_01_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_TIG_STRIPE_02_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_Sidor_WDL_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_PART_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_TIG_STRIPE_01_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_WDL_RIF: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_PART_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_TIG_STRIPE_01_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_Sidor_WDL_MD: rhs_sidor
 {
  maximumLoad = 1000;
 };
 class UK3CB_LSM_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEC_B_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEC_C_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEC_I_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEC_O_B_MESSENGER_MED: B_Messenger_Coyote_F
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEE_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEE_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEI_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEI_B_B_RPG2: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEI_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEI_I_B_RPG2: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEI_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_MEI_O_B_RPG2: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_NAP_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_NAP_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_NAP_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_NFA_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_NFA_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_NFA_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKA_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKA_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKA_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKM_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKM_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKM_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKP_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKP_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_TKP_O_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_UN_B_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
 class UK3CB_UN_I_B_RPG: rhs_rpg_empty
 {
  maximumLoad = 1000;
 };
};
