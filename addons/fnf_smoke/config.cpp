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
		moveVelocity[]={0.2,0.3,0.1};//{0.2,0.1,0.1}
		size[]={0.36,3.5,13};//{0.1,2,6}
		MoveVelocityVar[]={0.5,0.3,0.5};//{0.25,0.25,0.25}
  };
};
