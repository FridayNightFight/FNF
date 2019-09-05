#include "cfgLoadouts.hpp"

//this disableTIEquipment true;this setVehicleAmmo 0;this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];reload this

_lrRadio = "";
switch (side group player) do {
    case west: {
      _giveLR = ["phx_loadout_blufor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_rt1523g_black";
      };
    };
    case east: {
      _giveLR = ["phx_loadout_opfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_mr3000_rhs";
      };
    };
    case independent: {
      _giveLR = ["phx_loadout_indfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    case civilian: {
      _giveLR = ["phx_loadout_civ_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    default {
      _lrRadio = "";
    };
};

switch (pUniform) do {
    case UNIFORM_MARPAT_WD: {
        phx_loadout_uniform = "rhs_uniform_FROG01_wd";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsusf_spc_corpsman";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsusf_spc_squadleader";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsusf_spc_teamleader";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_vest = "rhsusf_spc_iar";
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsusf_spc_light";
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_vest = "rhsusf_spc_mg";
          phx_loadout_backpack = "B_Carryall_khk";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "rhsusf_spc";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk";
          phx_loadout_vest = "rhsusf_spc_crewman";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsusf_spc_marksman";
        };
    };
    case UNIFORM_MARPAT_D: {
        phx_loadout_uniform = "rhs_uniform_FROG01_d";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_ess";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsusf_spc_corpsman";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsusf_spc_squadleader";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsusf_spc_teamleader";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_vest = "rhsusf_spc_iar";
          phx_loadout_backpack = "B_Kitbag_tan";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsusf_spc_light";
          phx_loadout_backpack = "B_Kitbag_tan";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_vest = "rhsusf_spc_mg";
          phx_loadout_backpack = "B_Carryall_cbr";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "rhsusf_spc";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_headset";
          phx_loadout_vest = "rhsusf_spc_crewman";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsusf_spc_marksman";
        };
    };
    case UNIFORM_G3_BLACK: {
        phx_loadout_uniform = "rhs_uniform_g3_blk";
        phx_loadout_vest = "V_PlateCarrier2_blk";
        phx_loadout_backpack = "B_AssaultPack_blk";
        phx_loadout_headgear = "rhsusf_opscore_bk_pelt";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "V_PlateCarrier1_blk";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_P) then {
          phx_loadout_backpack = "B_FieldPack_blk";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_FieldPack_blk";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_FieldPack_blk";
        };
    };
    case UNIFORM_TTSKO_FOREST: {
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhsgref_6b23_ttsko_forest";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhsgref_6b23_ttsko_forest";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_EMR_DESERT: {
        phx_loadout_uniform = "rhs_uniform_emr_des_patchless";
        phx_loadout_vest = "rhsgref_6b23_khaki_rifleman";
        phx_loadout_backpack = "B_FieldPack_cbr";
        phx_loadout_headgear = "rhs_6b7_1m_olive";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_officer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_nco";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsgref_6b23_khaki";
          phx_loadout_backpack = "B_Kitbag_tan";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_tan";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_cbr";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhsgref_6b23_khaki";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhsgref_6b23_khaki";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_sniper";
        };
    };
    case UNIFORM_EMR_SUMMER: {
        phx_loadout_uniform = "rhs_uniform_emr_patchless";
        phx_loadout_vest = "rhs_6b23_digi_6sh92_spetsnaz2";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_digi_ess";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhs_6b23_digi_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhs_6b23_digi_6sh92_headset_mapcase";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhs_6b23_digi_rifleman";
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhs_6b23_digi";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhs_6b23_digi";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhs_6b23_digi_sniper";
        };
    };
    case UNIFORM_COLDWAR_ERA_1: {
        phx_loadout_uniform = "rhsgref_uniform_woodland_olive";
        phx_loadout_vest = "rhs_vest_commander";
        phx_loadout_backpack = "B_FieldPack_oli";
        phx_loadout_headgear = "rhs_ssh68";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "rhssaf_kitbag_md2camo";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "rhssaf_kitbag_md2camo";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
    };
    case UNIFORM_M88_MOUNTAIN_LES: {
        phx_loadout_uniform = "rhs_uniform_m88_patchless";
        phx_loadout_vest = "rhs_6b23_ML_engineer";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_ml";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhs_6b23_ML_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhs_6b23_ML_crewofficer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhs_6b23_ML_crew";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhs_6b23_ML_rifleman";
          phx_loadout_backpack = "B_Kitbag_tan";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_tan";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_cbr";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhs_6b23_ML_engineer";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhs_6b23_ML_engineer";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhs_6b23_ML_sniper";
        };
    };
    case UNIFORM_M93_OAKLEAF: {
        phx_loadout_uniform = "rhssaf_uniform_m93_oakleaf_summer";
        phx_loadout_vest = "rhssaf_vest_md99_woodland_rifleman";
        phx_loadout_backpack = "rhssaf_kitbag_smb";
        phx_loadout_headgear = "rhssaf_helmet_m97_oakleaf";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
    };
    case UNIFORM_M93_FLECKTARN: {
        phx_loadout_uniform = selectRandom ["rhsgref_uniform_flecktarn", "rhsgref_uniform_flecktarn_full"];
        phx_loadout_vest = "rhs_6b23_6sh116_od";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_helmet_pasgt_flecktarn";
        phx_loadout_vest = "rhs_6b23_6sh116_vog_od";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
    };
    case UNIFORM_M93_WOODLAND: {
        phx_loadout_uniform = selectRandom ["rhsgref_uniform_woodland", "rhsgref_uniform_woodland_olive"];
        phx_loadout_vest = "rhs_6b13_Flora_6sh92";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_helmet_pasgt_woodland";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "rhssaf_kitbag_md2camo";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "rhssaf_kitbag_md2camo";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
    };
    case UNIFORM_SPECTER_S_FLORA: {
        phx_loadout_uniform = "rhsgref_uniform_specter";
        phx_loadout_vest = "rhs_6sh92_vog";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_green_ess";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_AAF: {
      phx_loadout_uniform = "U_I_CombatUniform";
      phx_loadout_vest = "V_PlateCarrier1_rgr";
      phx_loadout_backpack = "B_AssaultPack_rgr";
      phx_loadout_headgear = "H_HelmetSpecB";
      if (pRole == ROLE_CLS) then {
        phx_loadout_vest = "V_PlateCarrier2_rgr";
      };
      if (pRole == ROLE_PL || pRole == ROLE_SL) then {
        phx_loadout_vest = "V_PlateCarrierSpec_rgr";
        if (!(_lrRadio isEqualTo "")) then {
          _lrRadio = "tf_anprc155";
          phx_loadout_backpack = _lrRadio;
        };
      };
      if (pRole == ROLE_P) then {
        phx_loadout_headgear = "H_PilotHelmetHeli_B";
        phx_loadout_vest = "V_TacVest_oli";
        phx_loadout_backpack = _lrRadio;
      };
      if (pRole == ROLE_CR) then {
        phx_loadout_headgear = "H_HelmetCrew_I";
      };
      if (pRole == ROLE_MK) then {
        phx_loadout_vest = "V_Chestrig_rgr";
        phx_loadout_uniform = "U_I_FullGhillie_lsh";
        phx_loadout_backpack = "";
        phx_loadout_headgear = "";
      };
      if (pRole == ROLE_MG || pRole == ROLE_AM) then {
        phx_loadout_backpack = "B_Carryall_oli";
      };
    };
    case UNIFORM_CSAT_HEX: {
      phx_loadout_uniform = "U_O_CombatUniform_ocamo";
      phx_loadout_vest = "V_PlateCarrier2_blk";
      phx_loadout_backpack = "B_AssaultPack_ocamo";
      phx_loadout_headgear = "H_HelmetSpecO_ocamo";
      if (pRole == ROLE_PL || pRole == ROLE_SL) then {
        phx_loadout_vest = "V_PlateCarrierSpec_blk";
        if (!(_lrRadio isEqualTo "")) then {
          _lrRadio = "tf_mr3000";
          phx_loadout_backpack = _lrRadio;
        };
      };
      if (pRole == ROLE_P) then {
        phx_loadout_headgear = "H_PilotHelmetHeli_O";
        phx_loadout_vest = "V_TacVest_brn";
        phx_loadout_backpack = _lrRadio;
      };
      if (pRole == ROLE_CR) then {
        phx_loadout_headgear = "H_HelmetCrew_O";
      };
      if (pRole == ROLE_MK) then {
        phx_loadout_vest = "V_Chestrig_khk";
        phx_loadout_uniform = "U_O_FullGhillie_sard";
        phx_loadout_backpack = "";
        phx_loadout_headgear = "";
      };
      if (pRole == ROLE_MG || pRole == ROLE_AM) then {
        phx_loadout_backpack = "B_Carryall_khk";
      };
    };
    case UNIFORM_CSAT_URBAN: {
      phx_loadout_uniform = "U_O_CombatUniform_oucamo";
      phx_loadout_vest = "V_PlateCarrier2_blk";
      phx_loadout_backpack = "B_AssaultPack_blk";
      phx_loadout_headgear = "H_HelmetSpecO_blk";
      if (pRole == ROLE_PL || pRole == ROLE_SL) then {
        phx_loadout_vest = "V_PlateCarrierSpec_blk";
        if (!(_lrRadio isEqualTo "")) then {
          _lrRadio = "tf_mr3000";
          phx_loadout_backpack = _lrRadio;
        };
      };
      if (pRole == ROLE_P) then {
        phx_loadout_headgear = "H_PilotHelmetHeli_O";
        phx_loadout_vest = "V_TacVest_blk";
        phx_loadout_backpack = _lrRadio;
      };
      if (pRole == ROLE_CR) then {
        phx_loadout_headgear = "H_HelmetCrew_O";
      };
      if (pRole == ROLE_MK) then {
        phx_loadout_vest = "V_Chestrig_rgr";
        phx_loadout_uniform = "U_O_FullGhillie_lsh";
        phx_loadout_backpack = "";
        phx_loadout_headgear = "";
      };
      if (pRole == ROLE_MG || pRole == ROLE_AM) then {
        phx_loadout_backpack = "B_Carryall_khk";
      };
    };
    case UNIFORM_GUERILLA: {
        phx_loadout_uniform = selectRandom ["U_BG_Guerilla2_2", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_C_HunterBody_grn"];
        phx_loadout_vest = "rhsgref_otv_khaki";
        phx_loadout_backpack = "rhs_sidor";
        phx_loadout_headgear = "";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_backpack = "B_Kitbag_rgr";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_backpack = "B_Carryall_oli";
        };
    };
    case UNIFORM_WETSUIT: {
        phx_loadout_uniform = "U_B_Wetsuit";
        phx_loadout_vest = "V_RebreatherB";
        phx_loadout_backpack = "B_AssaultPack_blk";
        phx_loadout_headgear = "";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_uniform = "rhssaf_uniform_heli_pilot";
          phx_loadout_vest = "V_TacVest_blk";
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_backpack = _lrRadio;
        };
    };
    case UNIFORM_CIVILIAN_TANOA: {
        phx_loadout_uniform = selectRandom ["U_C_Man_casual_2_F", "U_C_Man_casual_3_F", "U_C_Man_casual_1_F", "U_C_Man_casual_6_F", "U_C_Man_casual_4_F", "U_C_Man_casual_5_F"];
        phx_loadout_vest = "";
        phx_loadout_backpack = _lrRadio;
        phx_loadout_headgear = "";
    };
    case UNIFORM_CIVILIAN: {
        phx_loadout_uniform = selectRandom ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_Rangemaster", "U_C_Poor_1", "U_C_Poor_2", "U_C_Poor_shorts_1", "U_C_Poor_shorts_2", "U_C_Commoner_shorts", "U_Marshal"];
        phx_loadout_vest = "";
        phx_loadout_backpack = _lrRadio;
        phx_loadout_headgear = "";
    };
    default {};
};

if (pRole == ROLE_P) then {
  phx_loadout_uniform = "U_I_pilotCoveralls";
  phx_loadout_backpack = "B_Parachute";
  phx_loadout_vest = "V_Chestrig_oli";
  switch ("phx_loadout_pilot_uniform" call BIS_fnc_getParamValue) do {
    case 0: { //rotary
      switch (side player) do {
        case east: {
          phx_loadout_headgear = "rhs_zsh7a_mike_green";
        };
        case west: {
          phx_loadout_headgear = "rhsusf_hgu56p_green";
        };
        case independent: {
        phx_loadout_headgear = "H_PilotHelmetHeli_O";
        };
      };
    };
    case 1: { //fixed
      switch (side player) do {
        case east: {
          phx_loadout_headgear = "rhs_zsh7a";
        };
        case west: {
          phx_loadout_headgear = "RHS_jetpilot_usaf";
        };
        case independent: {
        phx_loadout_headgear = "H_PilotHelmetFighter_I";
        };
      };
    };
  };
};
