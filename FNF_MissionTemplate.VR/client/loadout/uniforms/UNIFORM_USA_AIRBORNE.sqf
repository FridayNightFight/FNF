//Global customization - will be applied to every role
phx_loadout_uniform = "fow_u_us_m42_ab_01_101_private";
phx_loadout_vest = "fow_v_us_ab_carbine";
phx_loadout_backpack = "B_LIB_US_M36";
phx_loadout_headgear = selectRandom ["H_LIB_US_AB_Helmet_Jump_1", "H_LIB_US_AB_Helmet_Jump_2", "H_LIB_US_AB_Helmet", "H_LIB_US_AB_Helmet_2"];

if (pRole == ROLE_PL) then {
  phx_loadout_uniform = "U_LIB_US_AB_Uniform_M42_506";
  phx_loadout_headgear = "H_LIB_US_Helmet_First_lieutenant";
  phx_loadout_vest = "fow_v_us_ab_garand_bandoleer";
};

if (pRole == ROLE_SL) then {
  phx_loadout_uniform = "fow_u_us_m42_ab_01_101_sergeant";
  phx_loadout_headgear = "H_LIB_US_Helmet_NCO";
  phx_loadout_vest = "fow_v_us_ab_garand_bandoleer";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_uniform = "fow_u_us_m42_ab_01_101_corporal";
};

if (pRole == ROLE_AR) then {phx_loadout_vest = "V_LIB_US_Vest_Bar"};
if (pRole == ROLE_MG) then {phx_loadout_vest = "V_LIB_US_Vest_M1919"; phx_loadout_backpack = "B_LIB_US_M36_Rocketbag_Empty";};

if (pRole == ROLE_AAR || pRole == ROLE_R) then {phx_loadout_vest = "V_LIB_US_Vest_Garand"};

if (pRole == ROLE_CLS) then {phx_loadout_vest = "V_LIB_US_Vest_Medic2"; phx_loadout_headgear = "H_LIB_US_AB_Helmet_Medic_1"; phx_loadout_uniform = "U_LIB_US_AB_Uniform_M42_Medic"; phx_loadout_backpack = "B_LIB_US_M36_Rocketbag_Empty";};

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {phx_loadout_backpack = "B_LIB_US_M36_Rocketbag_Empty";}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {
    phx_loadout_backpack = "B_LIB_US_M36_Rocketbag_Empty";
    }; //Medium Anti-tank
  case ROLE_AAT: {
    phx_loadout_backpack = "B_LIB_US_M36_Rocketbag_Empty";
    }; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_uniform = "U_LIB_US_Pilot";
    phx_loadout_vest = "V_LIB_US_LifeVest";
    phx_loadout_backpack = "fow_b_parachute";
    phx_loadout_headgear = "H_LIB_US_Helmet_Pilot";
    }; //Pilot
  case ROLE_CR: {
    phx_loadout_uniform = "U_LIB_US_Tank_Crew";
    phx_loadout_backpack = "";
    phx_loadout_vest = "V_LIB_US_Vest_45";
    }; //Crewman
  case ROLE_MK: {}; //Marksman
};