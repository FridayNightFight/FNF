//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "LIB_M9130";
phx_loadout_rifle_mag_tracer = "LIB_5Rnd_762x54_t46:5";
phx_loadout_rifle_mag = "LIB_5Rnd_762x54:15";

phx_loadout_sidearm_weapon = "LIB_TT33";
phx_loadout_sidearm_mag = "LIB_8Rnd_762x25:2";

phx_loadout_grenade = "LIB_F1:2";
phx_loadout_CEGrenade = "LIB_Rpg6:2";

if (pRole == ROLE_PL) then {
  phx_loadout_rifle_weapon = "LIB_M38";
};

if (pRole == ROLE_SL) then {
  phx_loadout_rifle_weapon = "LIB_SVT_40";
  phx_loadout_rifle_mag_tracer = "LIB_10Rnd_762x54_t46:5";
  phx_loadout_rifle_mag = "LIB_10Rnd_762x54:10";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "LIB_PPSh41_m";
  phx_loadout_rifle_mag_tracer = "LIB_35Rnd_762x25_t:4";
  phx_loadout_rifle_mag = "LIB_35Rnd_762x25:7";
};

if (pRole == ROLE_GR) then {
  phx_loadout_grenade = "LIB_F1:8";
  phx_loadout_vest = "V_LIB_SOV_RAZV_MGBelt_Kit";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "LIB_PPSh41_m";
  phx_loadout_rifle_mag = "LIB_71Rnd_762x25_t:15";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LIB_DP28";
  phx_loadout_rifle_mag = "LIB_47Rnd_762x54d:18";
};

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "LIB_71Rnd_762x25_t:8";
phx_loadout_am_mag = "LIB_47Rnd_762x54d:11";

//Light AT
phx_loadout_antitank_weapon = "LIB_PzFaust_30m";

//Medium AT
phx_loadout_mediumantitank_weapon = "LIB_RPzB";
phx_loadout_mediumantitank_mag = "LIB_1Rnd_RPzB";

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
    phx_loadout_sidearm_mag = "LIB_8Rnd_762x25:3";
  }; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "LIB_M9130PU";
    phx_loadout_rifle_mag = "LIB_5Rnd_762x54_t46:10";
  }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_SU";
