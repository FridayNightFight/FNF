phx_loadout_uniform = "U_LIB_SOV_Strelok_w";
phx_loadout_vest = "V_LIB_SOV_RA_MosinBelt";
phx_loadout_backpack = "B_LIB_SOV_RA_Rucksack";
phx_loadout_headgear = "H_LIB_SOV_RA_Helmet_w";

if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_uniform = "U_LIB_SOV_Strelok_2_w";
  phx_loadout_vest = "V_LIB_SOV_RA_OfficerVest";
};

if (pRole == ROLE_SL) then {
  phx_loadout_vest = "V_LIB_SOV_RA_SVTBelt";
};

if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "V_LIB_SOV_RA_PPShBelt_Mag";
};

if (pRole == ROLE_AR) then {phx_loadout_vest = "V_LIB_SOV_RA_PPShBelt"};
if (pRole == ROLE_MG) then {phx_loadout_vest = "V_LIB_SOV_RA_MGBelt_Kit"};

if (pRole == ROLE_CLS) then {phx_loadout_backpack = "B_LIB_SOV_RA_MedicalBag_Big_Empty"};

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {phx_loadout_backpack = "B_LIB_SOV_RA_Rucksack_Gas_Kit_Green"}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {
    phx_loadout_backpack = "B_LIB_SOV_RA_Rucksack_Gas_Kit_Green";
    }; //Medium Anti-tank
  case ROLE_AAT: {
    }; //Assistant anti-tank
  case ROLE_P: {
    phx_loadout_uniform = "U_LIB_SOV_Pilot";
    phx_loadout_vest = "";
    phx_loadout_backpack = "fow_b_parachute";
    phx_loadout_headgear = "H_LIB_SOV_PilotHelmet";
    }; //Pilot
  case ROLE_CR: {
    phx_loadout_uniform = "U_LIB_SOV_Tank_ryadovoi";
    phx_loadout_backpack = "";
    phx_loadout_vest = "V_LIB_SOV_RAZV_MGBelt";
    phx_loadout_headgear = "H_LIB_SOV_TankHelmet";
    }; //Crewman
  case ROLE_MK: {}; //Marksman
};
