//Global customization - will be applied to every role
phx_loadout_uniform = "U_LIB_WP_Soldier_camo_1";
phx_loadout_vest = "V_LIB_WP_Kar98Vest";
phx_loadout_backpack = "B_LIB_GER_Backpack";
phx_loadout_headgear = "H_LIB_WP_Helmet";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_uniform = "U_LIB_WP_Soldier_camo_2";
  phx_loadout_vest = "V_LIB_WP_OfficerVest";
};
if (pRole == ROLE_SL) then {
  phx_loadout_uniform = "U_LIB_WP_Soldier_camo_3";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_uniform = "U_LIB_WP_Soldier_camo_3";
  phx_loadout_vest = "V_LIB_WP_OfficerVest";
};

if (pRole == ROLE_CLS) then {
  phx_loadout_headgear = "H_LIB_WP_Helmet_med";
};

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "V_LIB_WP_MGVest"};
//if (pRole == ROLE_MG) then {};

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {phx_loadout_backpack = "fow_b_uk_bergenpack"}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {
    }; //Medium Anti-tank
  case ROLE_AAT: {
    }; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_uniform = "U_LIB_UK_DenisonSmock";
    phx_loadout_vest = "fow_v_us_45";
    phx_loadout_backpack = "fow_b_parachute";
    phx_loadout_headgear = "fow_h_us_flight_helmet";
    }; //Pilot
  case ROLE_CR: {
    phx_loadout_vest = "fow_v_uk_base_green";
    phx_loadout_headgear = "H_LIB_UK_Beret_Tankist";
    phx_loadout_uniform = "fow_u_uk_bd40_seac_02_private";
    }; //Crewman
  case ROLE_MK: {}; //Marksman
};
