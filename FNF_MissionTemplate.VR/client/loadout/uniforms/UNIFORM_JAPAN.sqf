//Global customization - will be applied to every role
phx_loadout_uniform = "fow_u_ija_type98_khakibrown";
phx_loadout_vest = "fow_v_ija_rifle";
phx_loadout_backpack = "fow_b_ija_backpack";
phx_loadout_headgear = "fow_h_ija_type90";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "fow_v_ija_nco";
  phx_loadout_headgear = "fow_h_ija_fieldcap_officer";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "fow_v_ija_nco";
  phx_loadout_headgear = "fow_h_ija_fieldcap_neck";
};

if (pRole == ROLE_MK) then {
  phx_loadout_vest = "fow_v_ija_rifle";
  phx_loadout_headgear = "fow_h_ija_type90_foliage";
  phx_loadout_uniform = "fow_u_ija_type98_foliage";
};

if (pRole == ROLE_AR || pRole == ROLE_MG) then {phx_loadout_vest = "fow_v_ija_mg"};

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {phx_loadout_vest = "fow_v_ija_medic"; phx_loadout_backpack = "B_LIB_GER_MedicBackpack_Empty"}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {phx_loadout_backpack = "B_LIB_SOV_RA_Rucksack_Gas_Kit_Green"}; //Combat engineer
  case ROLE_R: {phx_loadout_backpack = ""}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {
    phx_loadout_backpack = "B_LIB_SOV_RA_Rucksack_Green";
    }; //Medium Anti-tank
  case ROLE_AAT: {
    phx_loadout_backpack = "B_LIB_SOV_RA_Rucksack_Green";
    }; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_uniform = "fow_u_ija_pilot";
    phx_loadout_vest = "V_LIB_US_LifeVest";
    phx_loadout_backpack = "fow_b_parachute";
    phx_loadout_headgear = "fow_h_ija_flight_helmet";
    }; //Pilot
  case ROLE_CR: {
    phx_loadout_headgear = "fow_h_ija_tank_helmet";
    }; //Crewman
  case ROLE_MK: {}; //Marksman
};
