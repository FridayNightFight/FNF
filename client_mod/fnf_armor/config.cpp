class CfgPatches
{
 class fnf_armor
 {
	units[] = {};
	weapons[] = {};
	requiredVersion = 0.5;
	requiredAddons[] = {"A3_Weapons_F","A3_Weapons_F_Items","UK3CB_Factions_Equipment_Vests","rhs_c_troops","rhsgref_c_troops","rhsusf_c_troops","A3_Characters_F","A3_Characters_F_Enoch_Vests","UK3CB_Factions_Equipment_CW_SOV_Vests","A3_Characters_F_Mark","tfar_core","ace_medical_vitals","sfp_police","A3_VME_PLA_Men","A3_Characters_F_Exp_Vests","min_rf_units","A3_Characters_F_Jets_Vests","A3_Characters_F_Orange_Vests","fnf_armor","UK3CB_BAF_Equipment_Vests","Swedish_Forces_Pack","Finnish_Forces_Pack","rhssaf_c_gear","sfp_characters","UK3CB_Factions_ANP_B","UK3CB_Factions_TKA_B","UK3CB_Factions_TKP_B","UK3CB_Factions_TPD_B","UK3CB_Factions_TPD_I","UK3CB_Factions_TPD_O"}; };
};
class ItemInfo;
class cfgWeapons
{
 class Vest_NoCamo_Base;
 class Vest_Camo_Base;
 class V_PlateCarrier1_rgr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_V_Chestrig_Base: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_PASGT_Vest_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_Falcon_Vest_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_Pilot_Vest_02_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_Eagle_Vest_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_Eagle_Vest_GL_Base: UK3CB_Eagle_Vest_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Pocketed_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_chestrig: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_chicom: rhsgref_chestrig
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ocp_base: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_mbav: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_mbav_light: rhsusf_mbav
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_mbav_grenadier: rhsusf_mbav_light
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrier1_blk: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_V_Carrier_Rig_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_V_Carrier_Rig_Heavy_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_CarrierRigKBT_01_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_CarrierRigKBT_01_heavy_base_F: V_CarrierRigKBT_01_base_F
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_V_SOV_CHICOM_BASE: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Rangemaster_belt: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_BandollierB_khk: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrier2_rgr: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrier3_rgr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrierGL_rgr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrierSpec_rgr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Chestrig_khk: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Chestrig_oli: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacVest_khk: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacVest_camo: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacVest_blk_POLICE: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacVestIR_blk: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacVestCamo_khk: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_HarnessO_brn: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_HarnessOGL_brn: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrierIA1_dgtl: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrierIA2_dgtl: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_PlateCarrierIAGL_dgtl: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_RebreatherB: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Press_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacVest_blk: V_TacVest_khk
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_police_tacVest: V_TacVest_blk
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_kroppsskydd_police: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class PLA_T15Vest: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class PLA_T15Vest_RF: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class PLA_T15Vest_RD: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class PLA_B04_MG: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class PLA_B04_RF: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_TacChestrig_grn_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_GL_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_GL_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_GL_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_GL_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_GL_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_GL_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_AR_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_AR_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_AR_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_AR_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_AR_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_AR_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_M_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_M_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_M_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_M_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_M_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_armor_vest_M_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_GL_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_GL_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_GL_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_GL_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_GL_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_GL_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_AR_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_AR_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_AR_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_AR_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_AR_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_AR_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_M_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_M_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_M_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_M_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_M_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_lite_vest_M_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_GL_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_GL_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_GL_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_GL_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_GL_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_GL_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_AR_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_AR_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_AR_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_AR_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_AR_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_AR_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_M_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_M_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_M_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_M_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_M_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_tactical_vest_M_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_vest_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_vest_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_vest_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_vest_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_vest_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_vest_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_GL_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_GL_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_GL_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_GL_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_GL_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_highcapacity_special_GL_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_belt_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_belt_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_combat_belt_flora: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_combat_belt_surpat: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_combat_belt_vsr: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_combat_belt_multicam: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_combat_belt_black: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class min_rf_combat_belt_green: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_DeckCrew_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Plain_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_Safety_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_LegStrapBag_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_EOD_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class V_SmershVest_01_base_F: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23_6sh92: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23_6sh92_radio: rhs_6b23_6sh92
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6sh46: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_vest_commander: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23_digi: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23_digi_6sh92_Spetsnaz: rhs_6b23_6sh92_radio
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_vydra_3m: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23_vydra_3m: rhs_6b23_6sh92
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b23_6sh116: rhs_6b23_digi
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b13: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b13_6sh92: rhs_6b13
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b43: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6sh92: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b2: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b3: rhs_6b2
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b5: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_chicom: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6b45: rhs_6b43
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhs_6sh117_rifleman: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ocp_Grenadier: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ocp_Rifleman: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ocp_SAW: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ocp_Squadleader: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ocp_Teamleader: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_base: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_Grenadier: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_Medic: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_Repair: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_Rifleman: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_SAW: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_Squadleader: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_iotv_ucp_Teamleader: rhsusf_iotv_ucp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_rifleman: rhsusf_spc
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_iar: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_corpsman: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_crewman: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_light: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_marksman: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_mg: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_sniper: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spc_squadleader: rhsusf_spc_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_spcs_ocp: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_plateframe_sapi: rhsusf_iotv_ocp_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_plateframe_light: rhsusf_plateframe_sapi
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsusf_plateframe_rifleman: rhsusf_plateframe_sapi
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_V_Osprey_Base: V_PlateCarrier2_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_V_Osprey_Light_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_V_Osprey_Mk2_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_V_HiVis: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_Webbing_Base: Vest_NoCamo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_Webbing_Plate_Base: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_V_RebreatherB: V_RebreatherB
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_BAF_V_Rebreather_PlateB: UK3CB_BAF_V_RebreatherB
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsvast08: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_rebreather_old: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class ffp_m05_vest_base: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhssaf_balistic_vest_base: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhssaf_tactical_vest_base: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhssaf_vest_otv_md2camo: rhssaf_balistic_vest_base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_kroppsskydd12: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_kroppsskydd12_crew: sfp_kroppsskydd12
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_kroppsskydd12_tl: sfp_kroppsskydd12
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_kroppsskydd12_holster: sfp_kroppsskydd12
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_kroppsskydd94: V_PlateCarrier1_rgr
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsvast2000: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsvast2000_light: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsvast2000_mg: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsvast2000_gl: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsvast2000_ar: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridssele: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridsbalte_304k: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_holster: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_old_hv_eq: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class sfp_stridssele_belt: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_6b23_khaki: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_6b23_khaki_rifleman: rhsgref_6b23_khaki
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_otv_khaki: rhsgref_6b23_khaki_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_TacVest_ERDL: rhsgref_6b23_khaki_rifleman
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class rhsgref_alice_webbing: rhs_6b23
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_ANP_B_V_GA_LITE_BLK: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_ANP_B_V_GA_HEAVY_BLK: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TKA_B_V_GA_LITE_TAN: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TKA_B_V_GA_HEAVY_TAN: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TKP_B_V_GA_LITE_BLK: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TKP_B_V_GA_HEAVY_BLK: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class Gun_belt_base: Vest_Camo_Base
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_B_V_GIGN_01: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_B_V_GIGN_02: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_B_V_GIGN_03: V_PlateCarrierIAGL_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_I_V_GIGN_01: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_I_V_GIGN_02: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_I_V_GIGN_03: V_PlateCarrierIAGL_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_O_V_GIGN_01: V_PlateCarrierIA1_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_O_V_GIGN_02: V_PlateCarrierIA2_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
 class UK3CB_TPD_O_V_GIGN_03: V_PlateCarrierIAGL_dgtl
 {
	class ItemInfo: ItemInfo
	{
	 class HitpointsProtectionInfo
	 {
		class Neck
		{
		 hitpointName = "HitNeck";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Chest
		{
		 hitpointName = "HitChest";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Diaphragm
		{
		 hitpointName = "HitDiaphragm";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Abdomen
		{
		 hitpointName = "HitAbdomen";
		 armor = 15;
		 passThrough = 0.5;
		};
		class Pelvis
		{
		 hitpointName = "HitPelvis";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Body
		{
		 hitpointName = "HitBody";
		 armor = 0;
		 passThrough = 0.5;
		};
		class Arms
		{
		 hitpointName = "HitArms";
		 armor = 0;
		 passThrough = 0.5;
		};
	 };
	};
 };
};
