class CfgPatches
{
	class fnf_backpacks
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F","A3_Weapons_F","rhs_main","rhs_c_troops","rhsusf_c_troops","rhsgref_c_troops","rhssaf_c_troops","rhssaf_backpacks","tfar_backpacks","uk3cb_factions_Common","uk3cb_factions_Vehicles_common","uk3cb_factions_Equipment","uk3cb_factions_TKA","uk3cb_factions_ANA"};
	};
};
class cfgVehicles
{
	/* Begin Vanilla, RHS and TFAR */

	class Bag_Base;
	class B_AssaultPack_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_AssaultPack_blk: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_AssaultPack_eaf_F: B_AssaultPack_Base
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
	class B_TacticalPack_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_TacticalPack_blk: B_TacticalPack_Base
	{
		maximumLoad = 1000;
	};
	class B_TacticalPack_oli: B_TacticalPack_Base
	{
		maximumLoad = 1000;
	};
	class rhsusf_assault_eagleaiii_ucp: B_AssaultPack_Base
	{
		maximumLoad = 1000;
	};
	class B_FieldPack_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_FieldPack_blk: B_FieldPack_Base
	{
		maximumLoad = 1000;
	};
	class rhs_medic_bag: B_AssaultPack_Base
	{
		maximumLoad = 1000;
	};
	class rhs_rpg;
	class rhs_rpg_empty: rhs_rpg
	{
		maximumLoad = 1000;
	};
	class rhs_sidor: B_AssaultPack_Base
	{
		maximumLoad = 1000;
	};
	class rhs_assault_umbts: B_AssaultPack_Base
	{
		maximumLoad = 1000;
	};
	class rhs_assault_umbts_engineer: rhs_assault_umbts
	{
		maximumLoad = 1000;
	};
	class B_Kitbag_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_Carryall_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_Bergen_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_Bergen_Base_F: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_BergenC_Base: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_BergenG: Bag_Base
	{
		maximumLoad = 1000;
	};
	class rhsgref_hidf_alicepack: Bag_Base
	{
		maximumLoad = 1000;
	};
	class rhsgref_wdl_alicepack: rhsgref_hidf_alicepack
	{
		maximumLoad = 1000;
	};
	class rhsgref_ttsko_alicepack: rhsgref_hidf_alicepack
	{
		maximumLoad = 1000;
	};
	class rhssaf_alice_smb: Bag_Base
	{
		maximumLoad = 1000;
	};
	class rhssaf_alice_md2camo: Bag_Base
	{
		maximumLoad = 1000;
	};
	class rhssaf_Kitbag_base: B_Kitbag_Base
	{
		maximumLoad = 1000;
	};
	class B_ViperHarness_base_F: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_ViperHarness_blk_F: B_ViperHarness_base_F
	{
		maximumLoad = 1000;
	};
	class B_ViperLightHarness_base_F: Bag_Base
	{
		maximumLoad = 1000;
	};
	class B_ViperLightHarness_blk_F: B_ViperLightHarness_base_F
	{
		maximumLoad = 1000;
	};
	class TFAR_Bag_Base;
	class TFAR_mr3000: TFAR_Bag_Base
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
	class TFAR_rt1523g_sage: TFAR_rt1523g
	{
		maximumLoad = 1000;
	};
	class TFAR_anprc155: TFAR_Bag_Base
	{
		maximumLoad = 1000;
	};

	/* End Vanilla, RHS and TFAR */

	/* Begin 3CB Factions */

	class UK3CB_B_Alice_Bedroll_K: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Alice_Bedroll_2_K: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Alice_Medic_Bedroll_K: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Alice_Medic_Bedroll_2_K: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Alice_D: B_Bergen_Base
	{
		maximumLoad = 1000;
	};

	//Radio backpacks (don't actually work as TFAR radios)
	class UK3CB_B_I_Alice_Radio_Backpack: TFAR_anprc155
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_O_Alice_Radio_Backpack: TFAR_mr3000
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_B_Alice_Radio_Backpack: TFAR_rt1523g_big
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
	class UK3CB_B_B_Assault_camo_Radio: TFAR_rt1523g_big
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
	class UK3CB_B_B_Radio_Backpack: TFAR_rt1523g_big
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
	class UK3CB_B_B_Backpack_Radio_Chem: TFAR_rt1523g_big
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
	class UK3CB_B_B_Tactical_Backpack_Radio: TFAR_rt1523g_big
	{
		maximumLoad = 1000;
	};
	//End radios

	class UK3CB_B_US_Backpack: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_US_Medic_Backpack: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Bedroll_Backpack: B_Bergen_Base
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
	class UK3CB_KDF_B_B_Sidor_MD_OLI: rhs_sidor
	{
		maximumLoad = 1000;
	};
	class UK3CB_KDF_B_B_Sidor_MD_VSR: rhs_sidor
	{
		maximumLoad = 1000;
	};
	class UK3CB_KDF_B_B_Sidor_RIF_OLI: rhs_sidor
	{
		maximumLoad = 1000;
	};
	class UK3CB_KDF_B_B_Sidor_RIF_VSR: rhs_sidor
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Backpack_Pocket: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Backpack_Med: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Small_Pack: B_Bergen_Base
	{
		maximumLoad = 1000;
	};
	class UK3CB_B_Tactical_Backpack: B_Bergen_Base
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

	/* End 3CB Factions */
};
