call phx_fnc_loadout_vars; //sets the variables the loadout system uses

//Set player role from class of their unit
_pClass = typeOf player;
// if (_pClass == UNIT_OPFOR_PL || _pClass == UNIT_BLUFOR_PL || _pClass == UNIT_INDFOR_PL) then {pRole = ROLE_PL};
// if (_pClass == UNIT_OPFOR_SL || _pClass == UNIT_BLUFOR_SL || _pClass == UNIT_INDFOR_SL) then {pRole = ROLE_SL};
// if (_pClass == UNIT_OPFOR_TL || _pClass == UNIT_BLUFOR_TL || _pClass == UNIT_INDFOR_TL) then {pRole = ROLE_TL};
// if (_pClass == UNIT_OPFOR_MGTL || _pClass == UNIT_BLUFOR_MGTL || _pClass == UNIT_INDFOR_MGTL) then {pRole = ROLE_MGTL};
// if (_pClass == UNIT_OPFOR_CLS || _pClass == UNIT_BLUFOR_CLS || _pClass == UNIT_INDFOR_CLS) then {pRole = ROLE_CLS};
// if (_pClass == UNIT_OPFOR_AR || _pClass == UNIT_BLUFOR_AR || _pClass == UNIT_INDFOR_AR) then {pRole = ROLE_AR};
// if (_pClass == UNIT_OPFOR_AAR || _pClass == UNIT_BLUFOR_AAR || _pClass == UNIT_INDFOR_AAR) then {pRole = ROLE_AAR};
// if (_pClass == UNIT_OPFOR_MG || _pClass == UNIT_BLUFOR_MG || _pClass == UNIT_INDFOR_MG) then {pRole = ROLE_MG};
// if (_pClass == UNIT_OPFOR_AM || _pClass == UNIT_BLUFOR_AM || _pClass == UNIT_INDFOR_AM) then {pRole = ROLE_AM};
// if (_pClass == UNIT_OPFOR_RAT || _pClass == UNIT_BLUFOR_RAT || _pClass == UNIT_INDFOR_RAT) then {pRole = ROLE_RAT};
// if (_pClass == UNIT_OPFOR_CE || _pClass == UNIT_BLUFOR_CE || _pClass == UNIT_INDFOR_CE) then {pRole = ROLE_CE};
// if (_pClass == UNIT_OPFOR_AT || _pClass == UNIT_BLUFOR_AT || _pClass == UNIT_INDFOR_AT) then {pRole = ROLE_AT};
// if (_pClass == UNIT_OPFOR_AAT || _pClass == UNIT_BLUFOR_AAT || _pClass == UNIT_INDFOR_AAT) then {pRole = ROLE_AAT};
// if (_pClass == UNIT_OPFOR_R || _pClass == UNIT_BLUFOR_R || _pClass == UNIT_INDFOR_R) then {pRole = ROLE_R};
// if (_pClass == UNIT_OPFOR_CR || _pClass == UNIT_BLUFOR_CR || _pClass == UNIT_INDFOR_CR) then {pRole = ROLE_CR};
// if (_pClass == UNIT_OPFOR_MK || _pClass == UNIT_BLUFOR_MK || _pClass == UNIT_INDFOR_MK) then {pRole = ROLE_MK};
// if (_pClass == UNIT_OPFOR_P || _pClass == UNIT_BLUFOR_P || _pClass == UNIT_INDFOR_P) then {pRole = ROLE_P};
// if (_pClass == UNIT_CIV_R) then {pRole = ROLE_CIV};

#define LOADOUTROLE(_str) (player getVariable ["phxLoadout", ""] isEqualTo _str)

if (LOADOUTROLE("PL")) then {pRole = ROLE_PL};
if (LOADOUTROLE("SL")) then {pRole = ROLE_SL};
if (LOADOUTROLE("TL")) then {pRole = ROLE_TL};
if (LOADOUTROLE("AR")) then {pRole = ROLE_AR};
if (LOADOUTROLE("ARA")) then {pRole = ROLE_AAR};
if (LOADOUTROLE("GR")) then {pRole = ROLE_GR};
if (LOADOUTROLE("GRIR")) then {pRole = ROLE_GRIR};
if (LOADOUTROLE("MG")) then {pRole = ROLE_MG};
if (LOADOUTROLE("MGA")) then {pRole = ROLE_AM};
if (LOADOUTROLE("CE")) then {pRole = ROLE_CE};
if (LOADOUTROLE("LAT")) then {pRole = ROLE_RAT};
if (LOADOUTROLE("MAT")) then {pRole = ROLE_AT};
if (LOADOUTROLE("MATA")) then {pRole = ROLE_AAT};
if (LOADOUTROLE("RI")) then {pRole = ROLE_R};
if (LOADOUTROLE("DM")) then {pRole = ROLE_MK};
if (LOADOUTROLE("SNP")) then {pRole = ROLE_SNP};
if (LOADOUTROLE("CR")) then {pRole = ROLE_CR};
if (LOADOUTROLE("PI")) then {pRole = ROLE_P};
if (LOADOUTROLE("MED")) then {pRole = ROLE_CLS};



if (isNil "pRole") exitWith {
  hint "Player role not set correctly. Alert the mission maker and join another slot.";
  player enableSimulation false;
  endMission "END1"
};
player linkItem "ItemMap";

if (pRole in [ROLE_PL,ROLE_SL,ROLE_TL,ROLE_MGTL,ROLE_GR]) then {phx_loadout_hasUGL = true} else {phx_loadout_hasUGL = false};
if (pRole in [ROLE_AR,ROLE_MG,ROLE_MK,ROLE_P]) then {phx_loadout_hasSpecial = true} else {phx_loadout_hasSpecial = false};

if (pRole == ROLE_CIV) exitWith {};

phx_loadout_unitLevel = 0;
if (pRole in [ROLE_PL,ROLE_SL]) then {phx_loadout_unitLevel = 2};
if (pRole in [ROLE_TL,ROLE_MGTL]) then {phx_loadout_unitLevel = 1};
//Shared
phx_loadout_aid = "FirstAidKit:4";
phx_loadout_smoke = "SmokeShell:2";
phx_loadout_grenade = ["2x Frag grenades", "rhs_mag_m67:2"];
phx_loadout_thermite = ["2x Thermite grenades", "ACE_M14:2"];
phx_loadout_maptools = "ACE_MapTools";
phx_loadout_cableTie = "ACE_CableTie:2";
phx_loadout_nvg = "NVGoggles_OPFOR";
phx_loadout_uglAmmoEast = ["rhs_VOG25:6", "rhs_GRD40_White:3", "rhs_VG40OP_white:3"];
phx_loadout_uglAmmoEastGR = ["rhs_VOG25:12", "rhs_GRD40_White:6", "rhs_VG40OP_white:2"];
phx_loadout_uglAmmoWest = ["1Rnd_HE_Grenade_shell:6", "1Rnd_Smoke_Grenade_shell:3", "UGL_FlareWhite_F:3"];
phx_loadout_uglAmmoWestGR = ["1Rnd_HE_Grenade_shell:15", "1Rnd_Smoke_Grenade_shell:6", "UGL_FlareWhite_F:2"];
phx_loadout_uglAmmoGRIR = ["1Rnd_HE_Grenade_shell:10", "1Rnd_Smoke_Grenade_shell:4", "UGL_FlareWhite_F:2", "ACE_HuntIR_M203:4"];
//CE
phx_loadout_explosives = ["2x Satchel", "SatchelCharge_Remote_Mag:2"];
phx_loadout_defusalkit = "ACE_DefusalKit";
phx_loadout_trigger = "ACE_M26_Clacker";
phx_loadout_entrenching = "ACE_EntrenchingTool";
phx_loadout_detector = "MineDetector";
//Medic
phx_loadout_PAK = "ACE_personalAidKit";
phx_loadout_bandage = "ACE_fieldDressing:32";
phx_loadout_morphine = "ACE_morphine:16";
phx_loadout_epinephrine = "ACE_epinephrine:8";
phx_loadout_blood_1 = "ACE_bloodIV_500:12";
phx_loadout_blood_2 = "ACE_bloodIV_250:4";
//Range
phx_loadout_binocular = "Binocular";
phx_loadout_vector = "ACE_VectorDay";
phx_loadout_rifle_optic = "optic_DMS";
phx_selector_optics = ["optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high", "rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas"];
phx_selector_magOptics = ["rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230_mrds", "optic_MRCO", "optic_Hamr", "optic_Arco_blk_F", "rhsusf_acc_ELCAN", "rhs_acc_1p29", "rhs_acc_1p78", "rhs_acc_nita", "rhs_acc_pso1m2_ak"];
phx_selector_explosives = [
phx_loadout_explosives,
["2x AP mine, 2x flare mine","APERSTripMine_Wire_Mag:2","rhs_mine_sm320_red_mag:2"],
["2x AT mine", "ATMine_Range_Mag:2"],
["4x Demo charge", "DemoCharge_Remote_Mag:4"]
];
phx_selector_grenades = [
  phx_loadout_thermite,
  phx_loadout_grenade
];

call phx_fnc_setUniform;
call phx_fnc_setWeapons;
