configfile >> "CfgWeapons" >> "optic_Aco" >> "ItemInfo" >> "OpticsModes" >> "ACO"
configfile >> "CfgWeapons" >> "rhsusf_acc_ELCAN" >> "ItemInfo" >> "opticType"


_val = getNumber (configfile >> "CfgWeapons" >> "optic_Aco" >> "ItemInfo" >> "opticType");

_optics = [];
_useableOptics = [];
_configClasses = "true" configClasses (configfile >> "CfgWeapons") apply {configName _x};
_optics = _configClasses apply {
  if (((configName (configfile >> "CfgWeapons" >> _x) call BIS_fnc_itemType) select 1) isEqualTo "AccessorySights" && !isNull (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "OpticsModes" >> "ACO")) then {
    _useableOptics pushBack _x;
  };
};

copyToClipboard str _useableOptics;

copyToClipboard str _configClasses;

[configfile >> "CfgWeapons" >> "optic_Aco" >> "ItemInfo" >> "opticType","idc"] call BIS_fnc_returnConfigEntry;

["optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_Yorris","optic_MRD","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","optic_Holosight_smg_khk_F","optic_Holosight_lush_F","optic_Holosight_arid_F","optic_MRD_black","rhs_acc_pkas","rhs_acc_pkas_asval","rhs_acc_pkas_pkp","rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_ekp8_02","rhs_acc_ekp8_02b","rhs_acc_ekp8_02c","rhs_acc_ekp8_02d","rhs_acc_ekp8_18","rhs_acc_ekp8_18b","rhs_acc_ekp8_18c","rhs_acc_ekp8_18d","rhs_acc_1p87","rhs_acc_okp7_base","rhs_acc_okp7_dovetail","rhs_acc_okp7_picatinny","rhs_acc_npz","rhsusf_acc_compm4","rhsusf_acc_T1_high","rhsusf_acc_T1_low","rhsusf_acc_T1_low_fwd","rhsusf_acc_T1_low_fwd_ak","rhsusf_acc_RX01","rhsusf_acc_RX01_tan","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RM05","rhsusf_acc_RM05_fwd","rhsusf_acc_RM05_fwd_ak","rhsusf_acc_mrds","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_fwd_ak","rhsusf_acc_mrds_c","rhsusf_acc_mrds_fwd_c","rhsusf_acc_mrds_fwd_c_ak","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_EOTECH","rhsusf_acc_M2A1","rhsusf_acc_eotech_xps3","rhsgref_acc_RX01_camo","rhsgref_acc_RX01_NoFilter_camo","rhsgref_mg42_acc_AAsight"]


_configClasses = "true" configClasses (configfile >> "CfgWeapons") apply {configName _x};
_configClasses apply {
  if (((configName (configfile >> "CfgWeapons" >> _x) call BIS_fnc_itemType) select 1) isEqualTo "AccessorySights" && ((configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "opticType") call BIS_fnc_getCfgData) == 2) then {
    _allowedOptics pushBack _x;
  };
};

["optic_Arco","optic_Hamr","optic_SOS","optic_MRCO","optic_Nightstalker","optic_DMS","optic_LRPS","optic_AMS_base","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_base","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_Arco_blk_F","optic_Arco_ghex_F","optic_DMS_ghex_F","optic_Hamr_khk_F","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_SOS_khk_F","optic_LRPS_tna_F","optic_LRPS_ghex_F","optic_Arco_lush_F","optic_Arco_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_lush_F","optic_Arco_AK_arid_F","optic_DMS_weathered_F","optic_DMS_weathered_Kir_F","rhs_acc_sniper_base","rhs_acc_1p29","rhs_acc_1p29_pkp","rhs_acc_1p29_asval","rhs_acc_1p29_3d","rhs_acc_1p29_pkp_3d","rhs_acc_1p29_asval_3d","rhs_acc_1p78","rhs_acc_1p78_3d","rhs_acc_pkas","rhs_acc_pkas_asval","rhs_acc_pkas_pkp","rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_ekp8_02","rhs_acc_ekp8_02b","rhs_acc_ekp8_02c","rhs_acc_ekp8_02d","rhs_acc_ekp8_18","rhs_acc_ekp8_18b","rhs_acc_ekp8_18c","rhs_acc_ekp8_18d","rhs_acc_1p87","rhs_acc_okp7_base","rhs_acc_okp7_dovetail","rhs_acc_okp7_picatinny","rhs_acc_pso1m2","rhs_acc_pso1m2_ironsight","rhs_acc_pso1m2_ads","rhs_acc_pso1m2_ads_night","rhs_acc_pso1m2_ak","rhs_acc_pso1m2_ak_ironsight","rhs_acc_pso1m2_pkp","rhs_acc_pso1m2_pkp_ironsight","rhs_acc_pso1m2_asval","rhs_acc_pso1m2_asval_ironsight","rhs_acc_pso1m21","rhs_acc_pso1m21_ironsight","rhs_acc_pso1m21_ads","rhs_acc_pso1m21_ads_night","rhs_acc_pso1m21_ak","rhs_acc_pso1m21_svd","rhs_acc_pso1m21_pkp","rhs_acc_pso1m21_ak_ironsight","rhs_acc_pso1m21_svd_ironsight","rhs_acc_pso1m21_pkp_ironsight","rhs_acc_nita","rhs_acc_nita_3d","rhs_acc_npz","rhs_acc_pgo7v","rhs_acc_pgo7v2","rhs_acc_pgo7v3","rhs_acc_pgo7v_ak","rhs_acc_pgo7v2_ak","rhs_acc_pgo7v3_ak","rhs_acc_pgo7v_asval","rhs_acc_pgo7v2_asval","rhs_acc_pgo7v3_asval","rhs_acc_pgo7v_pkp","rhs_acc_pgo7v2_pkp","rhs_acc_pgo7v3_pkp","rhs_acc_1pn93_base","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhs_acc_1pn34","rhs_acc_dh520x56","rhs_acc_rakursPM","rhsusf_acc_sniper_base","rhsusf_acc_compm4","rhsusf_acc_T1_high","rhsusf_acc_T1_low","rhsusf_acc_T1_low_fwd","rhsusf_acc_T1_low_fwd_ak","rhsusf_acc_RX01","rhsusf_acc_RX01_tan","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RM05","rhsusf_acc_RM05_fwd","rhsusf_acc_RM05_fwd_ak","rhsusf_acc_mrds","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_fwd_ak","rhsusf_acc_mrds_c","rhsusf_acc_mrds_fwd_c","rhsusf_acc_mrds_fwd_c_ak","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_anpvs27","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_LEUPOLDMK4_d","rhsusf_acc_LEUPOLDMK4_wd","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_ard","rhsusf_acc_elcan_3d","rhsusf_acc_elcan_ard_3d","rhsusf_acc_ELCAN_pip","rhsusf_acc_ELCAN_ard_pip","rhsusf_acc_su230_base","rhsusf_acc_su230_base_3d","rhsusf_acc_su230_mrds_base","rhsusf_acc_su230_mrds_base_3d","rhsusf_acc_su230","rhsusf_acc_su230_3d","rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_3d","rhsusf_acc_su230a","rhsusf_acc_su230a_3d","rhsusf_acc_su230a_mrds","rhsusf_acc_su230a_mrds_3d","rhsusf_acc_su230_c","rhsusf_acc_su230_c_3d","rhsusf_acc_su230_mrds_c","rhsusf_acc_su230_mrds_c_3d","rhsusf_acc_su230a_c","rhsusf_acc_su230a_c_3d","rhsusf_acc_su230a_mrds_c","rhsusf_acc_su230a_mrds_c_3d","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR_D","rhsusf_acc_SpecterDR_OD","rhsusf_acc_SpecterDR_CX","rhsusf_acc_SpecterDR_A","rhsusf_acc_SpecterDR_3d","rhsusf_acc_SpecterDR_D_3D","rhsusf_acc_SpecterDR_OD_3D","rhsusf_acc_SpecterDR_A_3d","rhsusf_acc_SpecterDR_CX_3D","rhsusf_acc_SpecterDR_pvs27","rhsusf_acc_ACOG","rhsusf_acc_ACOG_wd","rhsusf_acc_ACOG_d","rhsusf_acc_ACOG_sa","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_USMC","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_RMR","rhsusf_acc_ACOG_3d","rhsusf_acc_ACOG_wd_3d","rhsusf_acc_ACOG_d_3d","rhsusf_acc_ACOG_sa_3d","rhsusf_acc_ACOG2_3d","rhsusf_acc_ACOG3_3d","rhsusf_acc_ACOG_USMC_3d","rhsusf_acc_ACOG2_USMC_3d","rhsusf_acc_ACOG3_USMC_3d","rhsusf_acc_ACOG_RMR_3d","rhsusf_acc_ACOG_pip","rhsusf_acc_ACOG_wd_pip","rhsusf_acc_ACOG_d_pip","rhsusf_acc_ACOG_sa_pip","rhsusf_acc_ACOG2_pip","rhsusf_acc_ACOG3_pip","rhsusf_acc_ACOG_USMC_pip","rhsusf_acc_ACOG2_USMC_pip","rhsusf_acc_ACOG3_USMC_pip","rhsusf_acc_ACOG_RMR_pip","rhsusf_acc_ACOG_anpvs27","rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_LEUPOLDMK4_2_mrds","rhsusf_acc_LEUPOLDMK4_2_d","rhsusf_acc_premier","rhsusf_acc_premier_mrds","rhsusf_acc_premier_low","rhsusf_acc_premier_anpvs27","rhsusf_acc_M8541","rhsusf_acc_M8541_mrds","rhsusf_acc_M8541_low","rhsusf_acc_M8541_low_d","rhsusf_acc_M8541_low_wd","rhsusf_acc_M2A1","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_xps3","rhsusf_acc_g33_xps3_tan","rhsusf_acc_g33_T1","rhs_weap_optic_smaw","rhs_weap_optic_smaw_1","rhs_weap_optic_smaw_2","rhs_weap_optic_smaw_3","rhs_weap_optic_smaw_4","rhs_weap_optic_smaw_5","rhs_weap_optic_smaw_6","rhs_weap_optic_smaw_7","rhs_weap_optic_smaw_8","rhs_weap_optic_smaw_9","rhs_weap_optic_smaw_10","optic_Hamr_broken","optic_MRCO_broken","ACE_optic_Hamr_2D","ACE_optic_Hamr_PIP","ACE_optic_Arco_2D","ACE_optic_Arco_PIP","ACE_optic_MRCO_2D","ACE_optic_MRCO_PIP","ACE_optic_SOS_2D","ACE_optic_SOS_PIP","ACE_optic_LRPS_2D","ACE_optic_LRPS_PIP","rhs_acc_scope_base","rhsgref_acc_RX01_camo","rhsgref_acc_RX01_NoFilter_camo","rhs_acc_mtz","rhsgref_mg42_acc_AAsight","rhsgref_acc_l2a2","rhsgref_acc_l2a2_3d","rhsgref_acc_l1a1_l2a2","rhsgref_acc_l1a1_l2a2_3d","rhsgref_acc_anpvs2_base","rhsgref_acc_l1a1_anpvs2"]

configfile >> "CfgWeapons" >> "rhs_weap_m27iar" >> "magazines"
[configfile >> "CfgWeapons" >> "rhs_weap_m27iar","magazines"] call BIS_fnc_returnConfigEntry;

_rifles = [];
_configClasses = "true" configClasses (configfile >> "CfgWeapons") apply {configName _x};
_configClasses apply {
  if (((configName (configfile >> "CfgWeapons" >> _x) call BIS_fnc_itemType) select 1) isEqualTo "AssaultRifle" && ("rhs_mag_30Rnd_556x45_M855A1_Stanag" in ([configfile >> "CfgWeapons" >> _x,"magazines"] call BIS_fnc_returnConfigEntry))) then {
    _rifles pushBack _x;
  };
};
copyToClipboard str _rifles;

"rhs_mag_30Rnd_556x45_M855A1_Stanag"
