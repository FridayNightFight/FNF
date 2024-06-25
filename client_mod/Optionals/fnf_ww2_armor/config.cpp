class CfgPatches
{
 class fnf_ww2_armor
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"UK3CB_Factions_Equipment_Vests","rhs_c_troops","rhsgref_c_troops","rhsusf_c_troops","A3_Characters_F","A3_Characters_F_Enoch_Vests","UK3CB_Factions_Equipment_CW_SOV_Vests","WBK_NewMeleeWEaponsTier2","A3_Characters_F_Mark","tfar_core","ace_medical_vitals","EAW_Chinese_Infantry","EAW_Japanese_Infantry","EAW_RJ_IJA","EAW_SNLF_Infantry","NORTH_Finnish_Gear","NORTH_Norwegian_Gear","NORTH_Soviet_Gear","A3_Characters_F_Exp_Vests","A3_Characters_F_Jets_Vests","A3_Characters_F_Orange_Vests","WW2_Assets_c_Characters_Germans_c_GER_FSJ_Gear","WW2_Assets_c_Characters_Germans_c_GER_TankTroops_Gear","WW2_Assets_c_Characters_Germans_c_GER_Wehrmacht_Gear","WW2_Assets_c_Characters_Polish_c_GUER_PolishTroops_Gear","WW2_Assets_c_Characters_Soviets_c_SOV_RKKA_Gear","fow_characters_c","WW2_Assets_c_Characters_Americans_c_US_Airborne_Gear","WW2_Assets_c_Characters_Americans_c_US_Airforce_Gear","WW2_Assets_c_Characters_Americans_c_US_Army_Gear","WW2_Assets_c_Characters_British_c_UK_Army_Gear","rhssaf_c_gear","UK3CB_Factions_ANP_B","UK3CB_Factions_TKA_B","UK3CB_Factions_TKP_B"}; };
};
class ItemInfo;
class cfgWeapons
{
 class Vest_NoCamo_Base;
 class Vest_Camo_Base;
 class V_LIB_Vest_Camo_Base;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class GoG_HolsterSwordVest: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class GoG_HolsterSwordVestBack: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Bandolier2_Rifle: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Bandolier2_Rifle_Grey: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Bandolier_Rifle: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Bandolier_Rifle_Grenadier: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Bandolier_Rifle_Grenade: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Bandolier_Rifle_Alt_Grenade: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_ZB_Bandolier: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_C96_Vest: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_MP28_Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_C96_Vest_Dao: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_MP28_Kit_Dao: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Chinese_Medic_Bag: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_RifleKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_RifleKit_Alt: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_RifleKit_Medic: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_Belt: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type11_Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type11_AmmoBearer_Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_IJA_LMG_AmmoBearer_Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_IJA_LMG_Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_IJA_SMG_Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_IJA_SwordBelt: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_Belt_Type95: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_RifleKit_Type95: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Type90_GrenadierKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Jyuban_RifleKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Jyuban_LMGKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Jyuban_LMG_BearerKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Jyuban_GrenadierKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Jyuban_Type11Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_Jyuban_MedicKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_RJ_RifleKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_SNLF_RifleKit_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_SNLF_Type11Kit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_SNLF_Type11Kit_Bearer: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_SNLF_GrenadierKit: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class EAW_SNLF_LMGKit_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_FIN_Generic_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_Nor_Belt: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_Nor_Belt_Krag: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_Nor_Belt_Officer: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_Nor_Belt_Madsen22: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_Nor_Belt_Madsen14: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SMG: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SMG_2: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SMG_3: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SMG_4: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SMG_5: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_SMG: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_SMG_2: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_SMG_3: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_SMG_4: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SVT: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_SVT_2: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_SVT: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_SVT_2: V_NORTH_SOV_Belt_SMG
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_2: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_3: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_4: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_5: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Mosin_1: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Mosin_2: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Mosin_3: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Mosin_4: V_NORTH_SOV_Belt_Mosin
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_2: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_3: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_4: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_Assault: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_Assault_2: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_Assault_3: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Officer_Assault_4: V_NORTH_SOV_Belt_Officer
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_Imperial: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_Imperial_2: V_NORTH_SOV_Belt_Mosin_Imperial
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_Imperial_3: V_NORTH_SOV_Belt_Mosin_Imperial
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Mosin_Imperial_4: V_NORTH_SOV_Belt_Mosin_Imperial
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Marine_Pouch_Mosin_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Marine_Pouch_Mosin_2: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Marine_Pouch_Imperial_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Marine_Pouch_SVT_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Marine_Pouch_SMG_1: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Marine_Pouch_SMG_2: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Pistol: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Pistol_2: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Pistol_3: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Pistol_4: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Pistol_5: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_SN42: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Pistol: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Pistol_2: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_NORTH_SOV_Belt_Late_Pistol_3: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_FSJ_VestKar98: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_TankPrivateBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_VestMP40: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_VestSTG: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_VestKar98: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_VestG43: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_SniperBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_VestMG: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_VestUnterofficer: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_FieldOfficer: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_OfficerVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_OfficerBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_PrivateBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_PistolBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_GER_PioneerVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_MP40Vest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_STGVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_Kar98Vest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_G43Vest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_SniperBela: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_MGVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_WP_OfficerVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_IShBrVestMG: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_OfficerVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_SniperVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_Belt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_TankOfficerSet: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_PPShBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_PPShBelt_Mag: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_MosinBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_SVTBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_MGBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RA_MGBelt_Kit: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RAZV_SVTBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RAZV_OfficerVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RAZV_MGBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RAZV_MGBelt_Kit: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RAZV_PPShBelt: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_SOV_RAZV_PPShBelt_Mag: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class fow_v_base: Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Bar: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_M1919: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Asst_MG: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Carbine: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Carbine_eng: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Carbine_nco: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Garand: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Grenadier: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Thompson: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_Thompson_nco: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_AB_Vest_45: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_LifeVest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Bar: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_M1919: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Asst_MG: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Carbine: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Carbine_eng: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Carbine_nco: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Garand: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Grenadier: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Medic: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Medic2: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Thompson: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_Thompson_nco: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Vest_45: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_US_Assault_Vest: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
 class V_LIB_UK_P37_Rifleman: V_LIB_Vest_Camo_Base
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
     passThrough = 0.1;
    };
    class Diaphragm
    {
     hitpointName = "HitDiaphragm";
     armor = 15;
     passThrough = 0.1;
    };
    class Abdomen
    {
     hitpointName = "HitAbdomen";
     armor = 15;
     passThrough = 0.1;
    };
    class Pelvis
    {
     hitpointName = "HitPelvis";
     armor = 0;
     passThrough = 0.1;
    };
    class Body
    {
     hitpointName = "HitBody";
     armor = 0;
     passThrough = 0.1;
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
