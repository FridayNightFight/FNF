#include "..\client\loadout\cfgLoadouts.hpp"

class Params {
    // Radios
    // ============================================================================================

    // F3 - Radio Systems Support
    // Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

    // Equipment
    class phx_loadout_blufor_uniform {
      title = "BLUFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_MARPAT_WD;
    };
    class phx_loadout_opfor_uniform {
      title = "OPFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_EMR_SUMMER;
    };
    class phx_loadout_indfor_uniform {
      title = "INDFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_M93_OAKLEAF;
    };
    class phx_loadout_civ_uniform {
      title = "CIV Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_CIVILIAN;
    };
    class spacer2 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    class phx_loadout_blufor_weapons {
      title = "BLUFOR Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST;
    };
    class phx_loadout_opfor_weapons {
      title = "OPFOR Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_AK74M_PKM_PKP_RPG7_RPG32;
    };
    class phx_loadout_indfor_weapons {
      title = "INDFOR Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_AKMN_PKM_PKP_RPG7_RPG32;
    };
    class phx_loadout_civ_weapons {
      title = "CIV Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_UNARMED;
    };
    class spacer3 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    class phx_param_enableRadioPreset {
        title = "Enable Preset Radios:";
        values[] = {true,false};
        texts[] = {"Enabled","Disabled"};
        default = true;
    };
    class spacer4 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    // Loadout Stuff
    class phx_loadout_radio {
        title = "Radio Deployment:";
        values[] = {0,1,2,3};
        texts[] = {"All Players (default)","Team Leaders and above","Squad Leaders and above","No Radios"};
        default = 0;
    };
    class spacer5 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    //Weather & time
	  // Safestart
    class f_param_mission_timer {
        title = "Safe Start (Minutes)";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,12,15,20};
        texts[] = {"Off","1","2","3","4","5","6","7","8","9","10","12","15","20"};
        default = 15;
        code = "f_param_mission_timer = %1";
    };
  //Mission Timer
    class phx_missionTimelimit {
        title = "Time Limit:";
        values[] = {1,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90};
        texts[] = {"1 minute","5 minutes","10 minutes","15 minutes","20 minutes","25 minutes","30 minutes","35 minutes","40 minutes","45 minutes (default)","50 minutes","55 minutes","60 minutes","65 minutes","70 minutes","75 minutes","80 minutes","85 minutes","90 minutes",};
        default = 60;
    };
};
