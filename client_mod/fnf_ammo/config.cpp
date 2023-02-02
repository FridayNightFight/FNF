class CfgPatches
{
	class fnf_ammo
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_compat_rhs_afrf3","ace_compat_rhs_usf3"};
	};
};

#define deflectionModifier 0.2

class CfgAmmo {
  class SmokeShell;
  class SmokeShellRed;
  class SmokeShellGreen;
  class SmokeShellYellow;
  class rhs_g_vog25;

  class G_40mm_Smoke: SmokeShell {
    deflectionSlowDown = deflectionModifier;
    simulation = "shotSmoke";
  };
  class rhs_40mm_m713_red: SmokeShellRed {
    deflectionSlowDown = deflectionModifier;
    simulation = "shotSmoke";
  };
  class rhs_40mm_m714_white: SmokeShell {
    deflectionSlowDown = deflectionModifier;
    simulation = "shotSmoke";
  };
  class rhs_40mm_m715_green: SmokeShellGreen {
    deflectionSlowDown = deflectionModifier;
    simulation = "shotSmoke";
  };
  class rhs_40mm_m716_yellow: SmokeShellYellow {
    deflectionSlowDown = deflectionModifier;
    simulation = "shotSmoke";
  };
  class rhs_g_vg40md_white: rhs_g_vog25 {
    deflectionSlowDown = deflectionModifier;
    simulation = "shotSmoke";
  };
};
