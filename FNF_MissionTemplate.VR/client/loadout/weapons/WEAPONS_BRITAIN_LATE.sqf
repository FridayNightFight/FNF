//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "fow_w_leeenfield_no4mk1";
phx_loadout_rifle_mag_tracer = "";
phx_loadout_rifle_mag = "fow_10Rnd_303:15";

phx_loadout_sidearm_weapon = "fow_w_webley";
phx_loadout_sidearm_mag = "fow_6Rnd_455:2";

phx_loadout_grenade = "LIB_MillsBomb:2";
phx_loadout_CEGrenade = "LIB_No82:2";
phx_loadout_smoke = "fow_e_no79:2";

if (pRole == ROLE_PL || pROLE == ROLE_SL) then {
  phx_loadout_rifle_weapon = "fow_w_sten_mk5";
  phx_loadout_rifle_mag_tracer = "";
  phx_loadout_rifle_mag = "fow_32Rnd_9x19_sten:11";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "fow_w_bren";
  phx_loadout_rifle_mag = "fow_30Rnd_303_bren:15";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "fow_w_bren";
  phx_loadout_rifle_mag = "fow_30Rnd_303_bren:20";
};

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "fow_30Rnd_303_bren:6";
phx_loadout_am_mag = "fow_30Rnd_303_bren:10";

//Light AT
phx_loadout_antitank_weapon = "";
phx_loadout_antitank_mag = "";

//Medium AT
phx_loadout_mediumantitank_weapon = "LIB_PIAT";
phx_loadout_mediumantitank_mag = "LIB_1Rnd_89m_PIAT:2";

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
  case ROLE_AAT: {phx_loadout_mediumantitank_mag = "LIB_1Rnd_89m_PIAT:2"}; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_grenade = ""; phx_loadout_smoke = "";
    phx_loadout_rifle_weapon = "";
    phx_loadout_rifle_mag = "";
    phx_loadout_rifle_mag_tracer = "";
    phx_loadout_sidearm_mag = "fow_6Rnd_455:3";
    }; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "LIB_LeeEnfield_No4_Scoped";
    phx_loadout_rifle_mag = "LIB_10Rnd_770x56:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_UK";
