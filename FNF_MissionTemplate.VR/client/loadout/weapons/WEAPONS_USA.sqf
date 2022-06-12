//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "fow_w_m1_carbine";
phx_loadout_rifle_mag = "LIB_15Rnd_762x33:10";
phx_loadout_rifle_mag_tracer = "LIB_15Rnd_762x33_t:5";

phx_loadout_sidearm_weapon = "fow_w_m1911";
phx_loadout_sidearm_mag = "LIB_7Rnd_45ACP:2";

phx_loadout_grenade = "LIB_US_Mk_2:2";
phx_loadout_CEGrenade = "fow_e_tnt_halfpound:2";
phx_loadout_smoke = "LIB_US_M18:2";

if (pRole == ROLE_PL || pROLE == ROLE_SL) then {
  phx_loadout_rifle_weapon = "fow_w_m1a1_thompson";
  phx_loadout_rifle_mag_tracer = "fow_30Rnd_45acp_T:4";
  phx_loadout_rifle_mag = "LIB_30Rnd_45ACP:9";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
};

if (pRole == ROLE_R || pRole == ROLE_GR) then {
  phx_loadout_rifle_weapon = "fow_w_m1_garand";
  phx_loadout_rifle_mag_tracer = "LIB_8Rnd_762x63_t:6";
  phx_loadout_rifle_mag = "LIB_8Rnd_762x63:13";

  //phx_loadout_gr_adapter = "LIB_ACC_GL_M7";
  phx_loadout_gr_grenade = "fow_1Rnd_m9a1:6";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "fow_w_m1918a2";
  phx_loadout_rifle_mag = "LIB_20Rnd_762x63:20";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LIB_M1919A6";
  phx_loadout_rifle_mag = "LIB_50Rnd_762x63:16";
};

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "LIB_20Rnd_762x63:12";
phx_loadout_am_mag = "LIB_50Rnd_762x63:12";

//Light AT
phx_loadout_antitank_weapon = "";
phx_loadout_antitank_mag = "";

//Medium AT
phx_loadout_mediumantitank_weapon = "fow_w_m1a1_bazooka";
phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6:3";

//Marksman optic
phx_loadout_rifle_optic = "";

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_CLS: {}; //Medic
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {}; //Combat engineer
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_AT: {}; //Anti-tank
  case ROLE_AAT: {}; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_grenade = ""; phx_loadout_smoke = "";
    phx_loadout_rifle_weapon = "";
    phx_loadout_rifle_mag = "";
    phx_loadout_rifle_mag_tracer = "";
    phx_loadout_sidearm_mag = "fow_7Rnd_45acp:3";
    }; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "fow_w_m1903A1_sniper";
    phx_loadout_rifle_mag = "LIB_5Rnd_762x63_t:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_US";
