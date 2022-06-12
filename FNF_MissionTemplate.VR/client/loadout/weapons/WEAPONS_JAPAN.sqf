//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "fow_w_type99";
phx_loadout_rifle_mag_tracer = "";
phx_loadout_rifle_mag = "fow_5Rnd_77x58:20";

phx_loadout_sidearm_weapon = "fow_w_type14";
phx_loadout_sidearm_mag = "fow_8Rnd_8x22:2";

phx_loadout_grenade = "fow_e_type97:2";
phx_loadout_CEGrenade = "fow_e_type99_at:2";
phx_loadout_smoke = "LIB_US_M18:2";

if (pRole == ROLE_PL || pROLE == ROLE_SL || pROLE == ROLE_TL || pROLE == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "fow_w_type100";
  phx_loadout_rifle_mag_tracer = "";
  phx_loadout_rifle_mag = "fow_32Rnd_8x22:13";
};

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "fow_w_type99_lmg";
  phx_loadout_rifle_mag = "fow_30Rnd_77x58:17";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "fow_w_type99_lmg";
  phx_loadout_rifle_mag = "fow_30Rnd_77x58:22";
};

//Magazine classnames for assistant AR and MMG ammo man roles
phx_loadout_aar_mag = "fow_30Rnd_77x58:12";
phx_loadout_am_mag = "fow_30Rnd_77x58:12";

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
    phx_loadout_sidearm_mag = "fow_8Rnd_8x22:3";
    }; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {
    phx_loadout_rifle_weapon = "fow_w_type99_sniper";
    phx_loadout_rifle_mag = "fow_5Rnd_77x58:10";
    }; //Marksman
  case ROLE_R: {}; //Rifleman
};

phx_loadout_binocular = "LIB_Binocular_SU";
