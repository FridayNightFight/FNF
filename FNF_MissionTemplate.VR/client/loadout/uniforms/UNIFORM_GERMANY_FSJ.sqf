//Global customization - will be applied to every role
phx_loadout_uniform = "fow_u_ger_fall_03_private";
phx_loadout_vest = "fow_v_heer_k98";
phx_loadout_backpack = "fow_b_heer_aframe";
phx_loadout_headgear = "fow_h_ger_m40_fall_01";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_uniform = "fow_u_ger_fall_03_corporal";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_uniform = "fow_u_ger_fall_03_lance_corporal";
};

if (pRole == ROLE_AR) then {phx_loadout_vest = "fow_v_fall_bandoleer"};
if (pRole == ROLE_MG) then {phx_loadout_vest = "fow_v_fall_bandoleer"; phx_loadout_backpack = "fow_b_ammoboxes"};
if (pRole == ROLE_AM) then {phx_loadout_backpack = "fow_b_ammoboxes"};

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {phx_loadout_backpack = "B_LIB_GER_MedicBackpack_Empty"; phx_loadout_headgear = "H_LIB_GER_FSJ_M44_Helmet_Medic"}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {phx_loadout_vest = "V_LIB_GER_PioneerVest"; phx_loadout_backpack = "B_LIB_GER_SapperBackpack_empty"}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {phx_loadout_backpack = "B_LIB_GER_SapperBackpack_empty"}; //Medium Anti-tank
  case ROLE_AAT: {
    phx_loadout_backpack = "B_LIB_GER_Panzer_Empty";
    }; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_uniform = "U_LIB_GER_LW_pilot";
    phx_loadout_vest = "V_LIB_DAK_PrivateBelt";
    phx_loadout_headgear = "H_LIB_GER_LW_PilotHelmet";
    phx_loadout_backpack = "fow_b_parachute";
    }; //Pilot
  case ROLE_CR: {
    phx_loadout_uniform = "U_LIB_GER_Tank_crew_private";
    phx_loadout_vest = "V_LIB_GER_PrivateBelt";
    phx_loadout_headgear = "H_LIB_GER_TankPrivateCap";
    }; //Crewman
  case ROLE_MK: {}; //Marksman
};
