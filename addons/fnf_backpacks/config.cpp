class CfgPatches
{
	class fnf_backpacks
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F","A3_Weapons_F","rhs_main","rhs_c_troops","rhsusf_c_troops","rhsgref_c_troops","rhssaf_c_troops","rhssaf_backpacks","tfar_backpacks"};
	};
};
class cfgVehicles
{
	class Bag_Base;
	class B_AssaultPack_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_AssaultPack_blk: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_AssaultPack_eaf_F: B_AssaultPack_Base
	{
		maximumLoad = 850;
	};
	class B_AssaultPack_mcamo: B_AssaultPack_Base
	{
		maximumLoad = 850;
	};
	class B_AssaultPack_Kerry: B_AssaultPack_mcamo
	{
		maximumLoad = 850;
	};
	class B_TacticalPack_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_TacticalPack_blk: B_TacticalPack_Base
	{
		maximumLoad = 850;
	};
	class rhsusf_assault_eagleaiii_ucp: B_AssaultPack_Base
	{
		maximumLoad = 850;
	};
	class B_FieldPack_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_FieldPack_blk: B_FieldPack_Base
	{
		maximumLoad = 850;
	};
	class rhs_medic_bag: B_AssaultPack_Base
	{
		maximumLoad = 850;
	};
	class rhs_rpg;
	class rhs_rpg_empty: rhs_rpg
	{
		maximumLoad = 850;
	};
	class rhs_sidor: B_AssaultPack_Base
	{
		maximumLoad = 850;
	};
	class rhs_assault_umbts: B_AssaultPack_Base
	{
		maximumLoad = 850;
	};
	class rhs_assault_umbts_engineer: rhs_assault_umbts
	{
		maximumLoad = 850;
	};
	class B_Kitbag_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_Carryall_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_Bergen_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_Bergen_Base_F: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_BergenC_Base: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_BergenG: Bag_Base
	{
		maximumLoad = 850;
	};
	class rhsgref_hidf_alicepack: Bag_Base
	{
		maximumLoad = 850;
	};
	class rhsgref_wdl_alicepack: rhsgref_hidf_alicepack
	{
		maximumLoad = 850;
	};
	class rhsgref_ttsko_alicepack: rhsgref_hidf_alicepack
	{
		maximumLoad = 850;
	};
	class rhssaf_alice_smb: Bag_Base
	{
		maximumLoad = 850;
	};
	class rhssaf_alice_md2camo: Bag_Base
	{
		maximumLoad = 850;
	};
	class rhssaf_Kitbag_base: B_Kitbag_Base
	{
		maximumLoad = 850;
	};
	class B_ViperHarness_base_F: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_ViperHarness_blk_F: B_ViperHarness_base_F
	{
		maximumLoad = 850;
	};
	class B_ViperLightHarness_base_F: Bag_Base
	{
		maximumLoad = 850;
	};
	class B_ViperLightHarness_blk_F: B_ViperLightHarness_base_F
	{
		maximumLoad = 850;
	};
	class TFAR_Bag_Base;
	class TFAR_mr3000: TFAR_Bag_Base
	{
		maximumLoad = 850;
	};
	class TFAR_rt1523g: TFAR_Bag_Base
	{
		maximumLoad = 850;
	};
	class TFAR_rt1523g_big: TFAR_rt1523g
	{
		maximumLoad = 850;
	};
	class TFAR_rt1523g_sage: TFAR_rt1523g
	{
		maximumLoad = 850;
	};
	class TFAR_anprc155: TFAR_Bag_Base
	{
		maximumLoad = 850;
	};
};