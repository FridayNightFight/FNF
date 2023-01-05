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
		size[]={0.2,3,9};//{0.1,2,6}
		MoveVelocityVar[]={0.5,0.3,0.5};//{0.25,0.25,0.25}
  };
  class SmokeShellRed: SmokeShellWhite {
    color[] = {{0.6,0.6,0.6,0.5},{0.6,0.6,0.6,0.25},{0.6,0.6,0.6,0}};
    particleFSFrameCount = 4;
    particleFSIndex = 12;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    size[] = {0.1,1,5};
    interval = 0.03;
  };
  class SmokeShellGreen: SmokeShellWhite {
    color[] = {{0.6,0.6,0.6,0.5},{0.6,0.6,0.6,0.25},{0.6,0.6,0.6,0}};
    particleFSFrameCount = 4;
    particleFSIndex = 12;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    size[] = {0.1,1,5};
    interval = 0.03;
  };
  class SmokeShellYellow: SmokeShellWhite {
    color[] = {{0.6,0.6,0.6,0.5},{0.6,0.6,0.6,0.25},{0.6,0.6,0.6,0}};
    particleFSFrameCount = 4;
    particleFSIndex = 12;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    size[] = {0.1,1,5};
    interval = 0.03;
  };
  class SmokeShellPurple: SmokeShellWhite {
    color[] = {{0.6,0.6,0.6,0.5},{0.6,0.6,0.6,0.25},{0.6,0.6,0.6,0}};
    particleFSFrameCount = 4;
    particleFSIndex = 12;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    size[] = {0.1,1,5};
    interval = 0.03;
  };
  class SmokeShellBlue: SmokeShellWhite {
    color[] = {{0.6,0.6,0.6,0.5},{0.6,0.6,0.6,0.25},{0.6,0.6,0.6,0}};
    particleFSFrameCount = 4;
    particleFSIndex = 12;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    size[] = {0.1,1,5};
    interval = 0.03;
  };
  class SmokeShellOrange: SmokeShellWhite {
    color[] = {{0.6,0.6,0.6,0.5},{0.6,0.6,0.6,0.25},{0.6,0.6,0.6,0}};
    particleFSFrameCount = 4;
    particleFSIndex = 12;
    particleFSLoop = 0;
    particleFSNtieth = 16;
    size[] = {0.1,1,5};
    interval = 0.03;
  };
};

class SmokeShellRedEffect {
  class SmokeShell {
    type = "SmokeShellRed";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
  class SmokeShell2 {
    type = "SmokeShellRed";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
};

class SmokeShellGreenEffect {
  class SmokeShell {
    type = "SmokeShellGreen";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
  class SmokeShell2 {
    type = "SmokeShellGreen";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
};

class SmokeShellYellowEffect {
  class SmokeShell {
    type = "SmokeShellYellow";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
  class SmokeShell2 {
    type = "SmokeShellYellow";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
};

class SmokeShellPurpleEffect {
  class SmokeShell {
    type = "SmokeShellPurple";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
  class SmokeShell2 {
    type = "SmokeShellPurple";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
};

class SmokeShellBlueEffect {
  class SmokeShell {
    type = "SmokeShellBlue";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
  class SmokeShell2 {
    type = "SmokeShellBlue";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
};

class SmokeShellOrangeEffect {
  class SmokeShell {
    type = "SmokeShellOrange";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
  class SmokeShell2 {
    type = "SmokeShellOrange";
    simulation = "particles";
    position[] = {0, 0, 0};
    intensity = 1;
  };
};
