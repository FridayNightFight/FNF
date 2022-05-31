//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "fow_w_k98";
phx_loadout_rifle_mag_tracer = "LIB_5Rnd_792x57_t:5";
phx_loadout_rifle_mag = "LIB_5Rnd_792x57:10";

phx_loadout_sidearm_weapon = "LIB_P38";
phx_loadout_sidearm_mag = "LIB_8Rnd_9x19:2";

phx_loadout_grenade = "LIB_Shg24:2";
phx_loadout_CEGrenade = "LIB_Pwm:2";

if (pRole == ROLE_PL || pROLE == ROLE_SL) then {
  phx_loadout_rifle_weapon = "fow_w_mp40";
  phx_loadout_rifle_mag_tracer = "LIB_32rnd_9x19_t:3";
  phx_loadout_rifle_mag = "LIB_32Rnd_9x19:7";
};

if (pRole == ROLE_GR) then {
  phx_loadout_rifle_weapon = "LIB_K98_Late_GW";
  phx_loadout_gr_adapter = "LIB_ACC_GW_SB_Empty";
  phx_loadout_gr_grenade = "LIB_1Rnd_G_SPRGR_30:6";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "LIB_FG42G";
  phx_loadout_rifle_mag = "fow_20Rnd_792x57:14";
};

if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LIB_MG34";
  phx_loadout_rifle_mag = "LIB_50Rnd_792x57:9";
};

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "fow_30Rnd_792x33:5";
phx_loadout_am_mag = "LIB_50Rnd_792x57:3";

//Light AT
phx_loadout_antitank_weapon = "LIB_PzFaust_30m";
phx_loadout_antitank_mag = "";

//Medium AT
phx_loadout_mediumantitank_weapon = "LIB_RPzB";
phx_loadout_mediumantitank_mag = "LIB_1Rnd_RPzB";

//Marksman optic
phx_loadout_rifle_optic = "";

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {
    phx_loadout_rifle_weapon = "LIB_G43";
    phx_loadout_rifle_mag_tracer = "LIB_10Rnd_792x57_T:5";
    phx_loadout_rifle_mag = "LIB_10Rnd_792x57:10";
    }; //Team leader
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_CLS: {}; //Medic
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {}; //Combat engineer
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_AT: {}; //Anti-tank
  case ROLE_AAT: {phx_loadout_mediumantitank_mag = "LIB_1Rnd_RPzB:3"}; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_grenade = ""; phx_loadout_smoke = "";
    phx_loadout_rifle_weapon = "";
    phx_loadout_rifle_mag = "";
    phx_loadout_rifle_mag_tracer = "";
    phx_loadout_sidearm_mag = "LIB_8Rnd_9x19:3";
    }; //Pilot
  case ROLE_CR: {phx_loadout_grenade = "";}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "fow_w_k98_scoped";
    phx_loadout_rifle_mag = "LIB_5Rnd_792x57_t:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_GER";
