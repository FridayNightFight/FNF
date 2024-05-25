class CfgPatches
{
	class fnf_grenades
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_characters_F","ace_compat_rhs_usf3"};
		ammo[] = {"Grenade","GrenadeHand","rhs_ammo_m67"};
	};
};
class cfgAmmo
{
	class Default;
	class Grenade: Default{};
	class GrenadeHand: Grenade
	{
		ace_frag_enabled = 0;
		ace_frag_skip = 1;
		ace_frag_force = 0;
		hit = 13;
		indirectHit = 13;
		indirectHitRange = 7.5;
	};
	class rhs_ammo_m67: GrenadeHand
	{
		ace_frag_enabled = 0;
		ace_frag_skip = 1;
		ace_frag_force = 0;
		hit = 13;
		indirectHit = 13;
		indirectHitRange = 7.5;
	};
  class rhs_ammo_rgd5: GrenadeHand
	{
		ace_frag_enabled = 0;
		ace_frag_skip = 1;
		ace_frag_force = 0;
		hit = 13;
		indirectHit = 13;
		indirectHitRange = 7.5;
	};
  class rhs_ammo_rgn: rhs_ammo_rgd5
	{
		ace_frag_enabled = 0;
		ace_frag_skip = 1;
		ace_frag_force = 0;
		hit = 13;
		indirectHit = 13;
		indirectHitRange = 7.5;
	};
  class rhs_ammo_rgo: rhs_ammo_rgn
	{
		ace_frag_enabled = 0;
		ace_frag_skip = 1;
		ace_frag_force = 0;
		hit = 13;
		indirectHit = 13;
		indirectHitRange = 7.5;
	};
};
