/*
	Weapon configs
*/

class CfgPatches
{
	class fnf_weapons
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_compat_rhs_afrf3","ace_compat_rhs_usf3"};
	};
};

class CfgWeapons
{
	class rhs_weap_rsp30_white;
	class fnf_weap_reinsert_flare : rhs_weap_rsp30_white
	{
		author = "FNF";
		baseWeapon = "fnf_weap_reinsert_flare";
		descriptionShort = "Used to reinsert dead squadmates";
		displayname = "Reinsert Flare";
		displaynameShort = "Reinsert Flare";
	};
	class fnf_weap_reinsert_flare_used : fnf_weap_reinsert_flare
	{
		magazines[] = {};
		scope = 1;
	};
};
