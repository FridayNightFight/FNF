/*
RPK weapon config fix
*/

class CfgPatches
{
	class fnf_rpkfix
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_compat_rhs_afrf3"};
  };
};

class CfgWeapons {
  class rhs_weap_rpk_base;

  class rhs_weap_rpk74_base : rhs_weap_rpk_base {
    ACE_barrelLength = 590.00;
    ACE_barrelTwist = 195.072;
  };

  class rhs_weap_rpk74 : rhs_weap_rpk74_base {};
};
