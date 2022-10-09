class CfgPatches
{
	class fnf_smoke
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_compat_rhs_afrf3","ace_compat_rhs_usf3"};
	};
};

#define UGL_SMOKE_LIFETIME 45
#define HAND_SMOKE_LIFETIME 75

class CfgAmmo {
  class GrenadeHand;
	class SmokeShellRed;
	class SmokeShellGreen;
	class SmokeShellYellow;
	class rhs_g_vog25;

  class SmokeShell: GrenadeHand {
    timeToLive = HAND_SMOKE_LIFETIME;
  };
	class G_40mm_Smoke: SmokeShell {
		timeToLive = UGL_SMOKE_LIFETIME;
	};

	class rhs_40mm_m713_red: SmokeShellRed {
		timeToLive = UGL_SMOKE_LIFETIME;
	};
	class rhs_40mm_m714_white: SmokeShell {
		timeToLive = UGL_SMOKE_LIFETIME;
	};
	class rhs_40mm_m715_green: SmokeShellGreen {
		timeToLive = UGL_SMOKE_LIFETIME;
	};
	class rhs_40mm_m716_yellow: SmokeShellYellow {
		timeToLive = UGL_SMOKE_LIFETIME;
	};

	class rhs_g_vg40md_white: rhs_g_vog25 {
		timeToLive = UGL_SMOKE_LIFETIME;
	};
};

class CfgCloudlets {
  class Default;

  class SmokeShellWhite: Default {
		sizeCoef = 1.3; //default 1
		lifeTime = 27; //default 20
		weight = 1.2779; //default 1.2777
		rubbing = 0.03; //default 0.05
  };
};
