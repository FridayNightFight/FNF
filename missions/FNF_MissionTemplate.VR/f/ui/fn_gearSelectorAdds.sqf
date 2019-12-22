disableSerialization;

_display = findDisplay 2000;

_opticListboxControl = _display displayCtrl 2001;
_grenadeListboxControl = _display displayCtrl 2002;

_opticListboxControl lbAdd "Iron Sights";

switch (side player) do {
  case east: {
    opticMag = ["phx_loadout_opfor_optics",1] call BIS_fnc_getParamValue;
  };
  case west: {
    opticMag = ["phx_loadout_blufor_optics",1] call BIS_fnc_getParamValue;
  };
  case independent: {
    opticMag = ["phx_loadout_indfor_optics",1] call BIS_fnc_getParamValue;
  };
};

switch (opticMag) do {
  case 0: {
    allowedOptics = [];
  };
  case 1: {
    allowedOptics = ["optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_Yorris","optic_MRD","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","optic_Holosight_smg_khk_F","optic_Holosight_lush_F","optic_Holosight_arid_F","optic_MRD_black","rhs_acc_pkas","rhs_acc_pkas_asval","rhs_acc_pkas_pkp","rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_ekp8_02","rhs_acc_ekp8_02b","rhs_acc_ekp8_02c","rhs_acc_ekp8_02d","rhs_acc_ekp8_18","rhs_acc_ekp8_18b","rhs_acc_ekp8_18c","rhs_acc_ekp8_18d","rhs_acc_1p87","rhs_acc_okp7_base","rhs_acc_okp7_dovetail","rhs_acc_okp7_picatinny","rhs_acc_npz","rhsusf_acc_compm4","rhsusf_acc_T1_high","rhsusf_acc_T1_low","rhsusf_acc_T1_low_fwd","rhsusf_acc_T1_low_fwd_ak","rhsusf_acc_RX01","rhsusf_acc_RX01_tan","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RM05","rhsusf_acc_RM05_fwd","rhsusf_acc_RM05_fwd_ak","rhsusf_acc_mrds","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_fwd_ak","rhsusf_acc_mrds_c","rhsusf_acc_mrds_fwd_c","rhsusf_acc_mrds_fwd_c_ak","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_EOTECH","rhsusf_acc_M2A1","rhsusf_acc_eotech_xps3","rhsgref_acc_RX01_camo","rhsgref_acc_RX01_NoFilter_camo","rhsgref_mg42_acc_AAsight"];
  };
  case 2: {
    allowedOptics = ["optic_Arco","optic_Hamr","optic_MRCO","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr_khk_F","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco_lush_F","optic_Arco_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_lush_F","optic_Arco_AK_arid_F","rhs_acc_sniper_base","rhs_acc_1p29","rhs_acc_1p29_pkp","rhs_acc_1p29_asval","rhs_acc_1p29_3d","rhs_acc_1p29_pkp_3d","rhs_acc_1p29_asval_3d","rhs_acc_1p78","rhs_acc_1p78_3d","rhs_acc_pkas","rhs_acc_pkas_asval","rhs_acc_pkas_pkp","rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_ekp8_02","rhs_acc_ekp8_02b","rhs_acc_ekp8_02c","rhs_acc_ekp8_02d","rhs_acc_ekp8_18","rhs_acc_ekp8_18b","rhs_acc_ekp8_18c","rhs_acc_ekp8_18d","rhs_acc_1p87","rhs_acc_okp7_base","rhs_acc_okp7_dovetail","rhs_acc_okp7_picatinny","rhs_acc_pso1m2","rhs_acc_pso1m2_ironsight","rhs_acc_pso1m2_ads","rhs_acc_pso1m2_ak","rhs_acc_pso1m2_ak_ironsight","rhs_acc_pso1m2_pkp","rhs_acc_pso1m2_pkp_ironsight","rhs_acc_pso1m2_asval","rhs_acc_pso1m2_asval_ironsight","rhs_acc_pso1m21","rhs_acc_pso1m21_ironsight","rhs_acc_pso1m21_ads","rhs_acc_pso1m21_ak","rhs_acc_pso1m21_svd","rhs_acc_pso1m21_pkp","rhs_acc_pso1m21_ak_ironsight","rhs_acc_pso1m21_svd_ironsight","rhs_acc_pso1m21_pkp_ironsight","rhs_acc_nita","rhs_acc_nita_3d","rhs_acc_npz","rhs_acc_pgo7v","rhs_acc_pgo7v2","rhs_acc_pgo7v3","rhs_acc_pgo7v_ak","rhs_acc_pgo7v2_ak","rhs_acc_pgo7v3_ak","rhs_acc_pgo7v_asval","rhs_acc_pgo7v2_asval","rhs_acc_pgo7v3_asval","rhs_acc_pgo7v_pkp","rhs_acc_pgo7v2_pkp","rhs_acc_pgo7v3_pkp","rhs_acc_1pn93_base","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhs_acc_1pn34","rhs_acc_rakursPM","rhsusf_acc_sniper_base","rhsusf_acc_compm4","rhsusf_acc_T1_high","rhsusf_acc_T1_low","rhsusf_acc_T1_low_fwd","rhsusf_acc_T1_low_fwd_ak","rhsusf_acc_RX01","rhsusf_acc_RX01_tan","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RM05","rhsusf_acc_RM05_fwd","rhsusf_acc_RM05_fwd_ak","rhsusf_acc_mrds","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_fwd_ak","rhsusf_acc_mrds_c","rhsusf_acc_mrds_fwd_c","rhsusf_acc_mrds_fwd_c_ak","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_ard","rhsusf_acc_elcan_3d","rhsusf_acc_elcan_ard_3d","rhsusf_acc_ELCAN_pip","rhsusf_acc_ELCAN_ard_pip","rhsusf_acc_su230_base","rhsusf_acc_su230_base_3d","rhsusf_acc_su230_mrds_base","rhsusf_acc_su230_mrds_base_3d","rhsusf_acc_su230","rhsusf_acc_su230_3d","rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_3d","rhsusf_acc_su230a","rhsusf_acc_su230a_3d","rhsusf_acc_su230a_mrds","rhsusf_acc_su230a_mrds_3d","rhsusf_acc_su230_c","rhsusf_acc_su230_c_3d","rhsusf_acc_su230_mrds_c","rhsusf_acc_su230_mrds_c_3d","rhsusf_acc_su230a_c","rhsusf_acc_su230a_c_3d","rhsusf_acc_su230a_mrds_c","rhsusf_acc_su230a_mrds_c_3d","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR_D","rhsusf_acc_SpecterDR_OD","rhsusf_acc_SpecterDR_CX","rhsusf_acc_SpecterDR_A","rhsusf_acc_SpecterDR_3d","rhsusf_acc_SpecterDR_D_3D","rhsusf_acc_SpecterDR_OD_3D","rhsusf_acc_SpecterDR_A_3d","rhsusf_acc_SpecterDR_CX_3D","rhsusf_acc_SpecterDR_pvs27","rhsusf_acc_ACOG","rhsusf_acc_ACOG_wd","rhsusf_acc_ACOG_d","rhsusf_acc_ACOG_sa","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_USMC","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_RMR","rhsusf_acc_ACOG_3d","rhsusf_acc_ACOG_wd_3d","rhsusf_acc_ACOG_d_3d","rhsusf_acc_ACOG_sa_3d","rhsusf_acc_ACOG2_3d","rhsusf_acc_ACOG3_3d","rhsusf_acc_ACOG_USMC_3d","rhsusf_acc_ACOG2_USMC_3d","rhsusf_acc_ACOG3_USMC_3d","rhsusf_acc_ACOG_RMR_3d","rhsusf_acc_ACOG_pip","rhsusf_acc_ACOG_wd_pip","rhsusf_acc_ACOG_d_pip","rhsusf_acc_ACOG_sa_pip","rhsusf_acc_ACOG2_pip","rhsusf_acc_ACOG3_pip","rhsusf_acc_ACOG_USMC_pip","rhsusf_acc_ACOG2_USMC_pip","rhsusf_acc_ACOG3_USMC_pip","rhsusf_acc_ACOG_RMR_pip","rhsusf_acc_M2A1","rhsusf_acc_g33_xps3","rhsusf_acc_g33_xps3_tan","rhsusf_acc_g33_T1","rhs_weap_optic_smaw","rhs_weap_optic_smaw_1","rhs_weap_optic_smaw_2","rhs_weap_optic_smaw_3","rhs_weap_optic_smaw_4","rhs_weap_optic_smaw_5","rhs_weap_optic_smaw_6","rhs_weap_optic_smaw_7","rhs_weap_optic_smaw_8","rhs_weap_optic_smaw_9","rhs_weap_optic_smaw_10","ACE_optic_Hamr_2D","ACE_optic_Hamr_PIP","ACE_optic_Arco_2D","ACE_optic_Arco_PIP","ACE_optic_MRCO_2D","ACE_optic_MRCO_PIP","rhs_acc_scope_base","rhsgref_acc_RX01_camo","rhsgref_acc_RX01_NoFilter_camo","rhs_acc_mtz","rhsgref_mg42_acc_AAsight","rhsgref_acc_l2a2","rhsgref_acc_l2a2_3d","rhsgref_acc_l1a1_l2a2","rhsgref_acc_l1a1_l2a2_3d","rhsgref_acc_l1a1_anpvs2"];
  };
};

if (pRole == 16) then {
  allowedOptics pushBack "optic_SOS";
};
_optics = [];
opticsIndexes = [];
opticArraySelectedIndex = 0;
_index = 1;
/*
_configClasses = "true" configClasses (configfile >> "CfgWeapons") apply {configName _x};
_configClasses apply {
  if (((configName (configfile >> "CfgWeapons" >> _x) call BIS_fnc_itemType) select 1) isEqualTo "AccessorySights" && !isNull (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "OpticsModes" >> "ACO")) then {
    _allowedOptics pushBack _x;
  };
};*/

_compatibleOptics = [primaryWeapon player, "optic"] call CBA_fnc_compatibleItems;

{
  if (_x in _compatibleOptics) then {
    _optics pushBack _x;
    opticsIndexes pushBack [_x, _index];
    _index = _index + 1;
  };
} forEach allowedOptics;

{
  _opticListboxControl lbAdd _x;
} forEach _optics;

if !(opticFirstSel) then {
  lbSetCurSel [2001, opticSelected];
  opticFirstSel = true;
} else {
  lbSetCurSel [2001, opticSelected];
};

_opticListboxSelect =  _opticListboxControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];
  {
    if !(_x find _selectedIndex == -1) then {
    opticArraySelectedIndex = _x;
    };
  } forEach opticsIndexes;

  if (_selectedIndex == 0) then {
    _optic = primaryWeaponItems player select 2;
    player removePrimaryWeaponItem _optic;
  } else {
    player addPrimaryWeaponItem (opticArraySelectedIndex select 0);
  };

  opticSelected = _selectedIndex;
}];

_grenadeListboxControl lbAdd "None";
_grenadeListboxControl lbAdd "M84 Flash Grenade";
_grenadeListboxControl lbAdd "Incendiary Grenade";

if !(grenadeFirstSel) then {
  lbSetCurSel [2002, grenadeSelected];
  grenadeFirstSel = true;
} else {
  lbSetCurSel [2002, grenadeSelected];
};

_grenadeListboxSelect =  _grenadeListboxControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];
  _magazines = magazines player;
  switch (_selectedIndex) do {
    case 1:{
      if !(player canAdd "ACE_M84") exitWith {hintSilent "Not enough space"};
      for "_i" from 1 to 2 do {
        if ("rhs_mag_an_m14_th3" in _magazines) then {
          [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
        };
      };
      if !("ACE_M84" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "ACE_M84"] call CBA_fnc_addItem;
        };
        hintSilent "Flash grenades added";
      };
    };
    case 2:{
      if !(player canAdd "rhs_mag_an_m14_th3") exitWith {hintSilent "Not enough space"};
      for "_i" from 1 to 2 do {
        if ("ACE_M84" in _magazines) then {
          [player, "ACE_M84"] call CBA_fnc_removeItem;
        };
      };
      if !("rhs_mag_an_m14_th3" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "rhs_mag_an_m14_th3"] call CBA_fnc_addItem;
        };
        hintSilent "Incendiary grenades added";
      };
    };
    case 0: {
      if ("ACE_M84" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "ACE_M84"] call CBA_fnc_removeItem;
        };
      };
      if ("rhs_mag_an_m14_th3" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
        };
      };
      hintSilent "";
    };
  };
  grenadeSelected = _selectedIndex;
  }];

  [_opticListboxControl,_grenadeListboxControl] spawn phx_fnc_removeSelectorHandlers;

  //CE Only

  if (pRole == 7 && !("phx_loadout_allowCESelector" call BIS_fnc_getParamValue isEqualTo 1) && explosivesSelectorEnabled) then {

    _explosivesListboxControl = _display displayCtrl 2003;

    _explosivesListboxControl lbAdd "2x Satchel Charges";
    _explosivesListboxControl lbAdd "4x Demo Block";
    _explosivesListboxControl lbAdd "2x Demo, 1x Trip Mine";
    _explosivesListboxControl lbAdd "2x Trip Mine";
    _explosivesListboxControl lbAdd "1x Satchel, 2x SLAM Mine, 1x M15 AT Mine";

    /*if !(explosiveFirstSel) then {
      lbSetCurSel [2003, explosiveSelected];
      explosiveFirstSel = true;
    } else {
      lbSetCurSel [2003, explosiveSelected];
    };*/

    hintyHint = {
      hintSilent "You have selected your explosives loadout.\nYou will not be able to change it when you exit the Gear Selector."
    };

    _explosivesListboxSelect =  _explosivesListboxControl ctrlAddEventHandler  ["LBSelChanged",{
      params ["_control", "_selectedIndex"];

      {
        _chargeClass = _x;
        for "_i" from 1 to ({_chargeClass == _x} count (magazines player)) do {
          player removeItem _chargeClass;
        };
      } forEach explosivesClasses;

      switch (_selectedIndex) do {
        case 0:{
          player addItem "SatchelCharge_Remote_Mag";
          player addItem "SatchelCharge_Remote_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 1:{
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 2: {
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          player addItem "APERSTripMine_Wire_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 3:{
          player addItem "APERSTripMine_Wire_Mag";
          player addItem "APERSTripMine_Wire_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 4:{
          player addItem "SatchelCharge_Remote_Mag";
          player addItem "SLAMDirectionalMine_Wire_Mag";
          player addItem "SLAMDirectionalMine_Wire_Mag";
          player addItem "ATMine_Range_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
      };
      explosiveSelected = _selectedIndex;
      }];

      [_explosivesListboxControl] spawn phx_fnc_removeSelectorHandlers;
  };
