bluforAttackList = [
["B_Quadbike_01_F",1],
["rhsusf_M1078A1P2_WD_fmtv_usarmy",2],
["rhsusf_M1078A1P2_D_fmtv_usarmy",2],
["rhsusf_m1025_w",2],
["rhsusf_m1025_d",2],
["rhsusf_m998_w_4dr",2],
["rhsusf_m998_d_4dr",2],
["rhsusf_m113_usarmy_unarmed",4],
["rhsusf_m113d_usarmy_unarmed",4],
["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy",5],
["rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy",5],
["rhsusf_m1043_w_m2",6],
["rhsusf_m1043_d_m2",6],
["RHS_MELB_MH6M",6],
["rhsusf_m1240a1_m2_usarmy_wd",8],
["rhsusf_m1240a1_m2_usarmy_d",8],
["rhsusf_M1230_M2_usarmy_wd",9],
["rhsusf_M1230_M2_usarmy_d",9],
["rhsusf_M1237_M2_usarmy_wd",10],
["rhsusf_M1237_M2_usarmy_wd",10],
["rhsusf_m113_usarmy",10],
["rhsusf_m113d_usarmy",10],
["RHS_UH60M",12],
["RHS_CH_47F",12],
["RHS_MELB_AH6M",14],
["rhsusf_m1a1aimwd_usarmy",18],
["rhsusf_m1a1aimd_usarmy",18]
];

bluforDefenseList = [
["B_Quadbike_01_F",2],
["rhsusf_m1025_w",4],
["rhsusf_m1025_d",4],
["rhsusf_m998_w_4dr",4],
["rhsusf_m998_d_4dr",4],
["RHS_M2StaticMG_WD",4],
["RHS_M2StaticMG_MiniTripod_WD",4],
["rhsusf_m113_usarmy_unarmed",6],
["rhsusf_m113d_usarmy_unarmed",6],
["rhsusf_m1043_w_m2",8],
["rhsusf_m1043_d_m2",8],
["rhsusf_m1240a1_m2_usarmy_wd",12],
["rhsusf_m1240a1_m2_usarmy_d",12],
["rhsusf_m113_usarmy",14],
["rhsusf_m113d_usarmy",14]
];

opforAttackList = [
["O_Quadbike_01_F",1],
["rhs_tigr_msv",2],
["rhs_tigr_3camo_msv",2],
["rhs_kamaz5350_msv",2],
["rhsgref_ins_uaz_dshkm",4],
["rhsgref_BRDM2UM_msv",4],
["rhsgref_BRDM2_msv",6],
["rhs_ka60_c",6],
["rhs_btr80_msv",8],
["RHS_Mi8mt_vdv",8],
["rhs_tigr_sts_msv",11],
["rhs_tigr_sts_3camo_msv",11],
["rhs_bmp1d_tv",12],
["RHS_Mi24Vt_vvsc",12],
["rhs_t72ba_tv",14],
["rhs_t90a_tv",18]
];

opforDefenseList = [
["O_Quadbike_01_F",2],
["rhs_tigr_msv",3],
["rhs_tigr_3camo_msv",3],
["rhs_kamaz5350_msv",3],
["rhsgref_BRDM2UM_msv",4],
["rhs_KORD_VDV",4],
["rhs_KORD_high_VMF",4],
["rhsgref_ins_uaz_dshkm",6],
["rhsgref_BRDM2_msv",8],
["rhs_btr80_msv",12]
];

if (count bluforAssetList == 0) then {
  if (attackingSide == west) then {
    bluforAssetList = bluforAttackList;
  } else {
    bluforAssetList = bluforDefenseList;
  };
};

if (count opforAssetList == 0) then {
  if (attackingSide == east) then {
    opforAssetList = opforAttackList;
  } else {
    opforAssetList = opforDefenseList;
  };
};

if (activeMode isEqualTo "connection" || activeMode isEqualTo "neutralSector") then {
  if (count opforAssetList == 0) then {
    opforAssetList = opforAttackList;
  };
  if (count bluforAssetList == 0) then {
    bluforAssetList = bluforAttackList;
  };
};

if (activeMode isEqualTo "ctf") then {
  if (count opforAssetList == 0) then {
    opforAssetList = opforDefenseList;
  };
  if (count bluforAssetList == 0) then {
    bluforAssetList = bluforDefenseList;
  };
};
