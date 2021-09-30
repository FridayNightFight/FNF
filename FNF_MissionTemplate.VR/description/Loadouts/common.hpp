// RADIOS
#define RADIO_SR "ACRE_PRC343"
#define RADIO_MR "ACRE_PRC148"
#define RADIO_LR "ACRE_PRC117F"

// GEAR
#define GRUNT_MEDICAL "FirstAidKit:4"
#define MEDIC_MEDICAL "ACE_fieldDressing:32","ACE_morphine:16","ACE_epinephrine:8","ACE_tourniquet:4","ACE_bloodIV_500:12","ACE_bloodIV_250:4","ACE_personalAidKit"
#define LINKED "ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","TFAR_microdagr"
#define TOOLS "ACE_MapTools","ACE_CableTie:2"
#define LEADER_TOOLS "ACE_microDAGR"
#define SPOTTER_TOOLS "ACE_SpottingScope"
#define SNIPER_TOOLS "ACE_Tripod","ACE_RangeCard"

#define SMOKE_GRENADES "SmokeShell:2"
#define FRAG_GRENADES "rhs_mag_m67:2"
#define BASE_GRENADES FRAG_GRENADES,SMOKE_GRENADES
#define MEDIC_SMOKES "SmokeShellBlue:3"
#define LEADER_SMOKES "SmokeShellGreen:2","SmokeShellPurple:2", "SmokeShellRed:2"
#define INCENDIARY_GRENADES "ACE_M14:2"

#define BASE_UGL_HUNTIR ACE_HuntIR_M203

#define GL_BASE_WEST "1Rnd_HE_Grenade_shell:6", "1Rnd_Smoke_Grenade_shell:3", "UGL_FlareWhite_F:3"
#define GL_GR_WEST "1Rnd_HE_Grenade_shell:15", "1Rnd_Smoke_Grenade_shell:6", "UGL_FlareWhite_F:2"
#define GL_GRIR_WEST "1Rnd_HE_Grenade_shell:10", "1Rnd_Smoke_Grenade_shell:4", "UGL_FlareWhite_F:2", "ACE_HuntIR_M203:4"
#define GL_BASE_EAST "rhs_VOG25:6", "rhs_GRD40_White:3", "rhs_VG40OP_white:3"
#define GL_GR_EAST "rhs_VOG25:15", "rhs_GRD40_White:6", "rhs_VG40OP_white:2"
#define GL_GRIR_EAST "rhs_VOG25:10", "rhs_GRD40_White:4", "rhs_VG40OP_white:2", "ACE_HuntIR_M203:4"

#define HUNTIR_MONITOR "ACE_HuntIR_monitor:1"

#define CE_TRIGGER "ACE_M26_Clacker"
#define CE_DEFUSE "ACE_DefusalKit"
#define CE_DETECTOR "MineDetector"
#define CE_DIGTOOL "ACE_EntrenchingTool"
#define CE_SATCHEL "SatchelCharge_Remote_Mag:2"
#define CE_MINEAP "APERSTripMine_Wire_Mag:2","rhs_mine_sm320_red_mag:2"
#define CE_MINEAT "ATMine_Range_Mag:2"
#define CE_DEMOCHARGE "DemoCharge_Remote_Mag:4"

#define BINOCULARS "Binocular"
#define RANGEFINDER "ACE_Yardage450"
#define VECTOR "ACE_VectorDay"
#define NVG "NVGoggles_OPFOR"


// OPTICS
#define STD_OPTICS "optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high", "rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas"
#define MAG_OPTICS "rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230_mrds", "optic_MRCO", "optic_Hamr", "optic_Arco_blk_F", "rhsusf_acc_ELCAN", "rhs_acc_1p29", "rhs_acc_1p78", "rhs_acc_nita", "rhs_acc_pso1m2_ak"

#if phx_magnifiedOptics
#define MISSION_OPTICS STD_OPTICS##,##MAG_OPTICS
#else
#define MISSION_OPTICS STD_OPTICS
#endif

#define SNP_OPTICS "rhsusf_acc_M8541", "rhsusf_acc_M8541_wd"

// FUNCTIONS
#define SAM_GEAR(BACKPACK,MAG) backpack[] = {BACKPACK}; backpackItems[] = {}; magazines[] += {MAG}; items[] += {BASE_MEDICAL};
#define MORTAR_GEAR(BACKPACK) backpack[] = {BACKPACK}; items[] += {BASE_ARTILLERY};
