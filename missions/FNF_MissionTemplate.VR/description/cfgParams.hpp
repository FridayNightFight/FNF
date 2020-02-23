#include "..\f\loadout\cfgLoadouts.hpp"

class Params {
    // Radios
    // ============================================================================================

    // F3 - Radio Systems Support
    // Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

    class phx_param_radios {
      title = "Radio System";
      values[] = {0,1,2};
      texts[] = {"Off","TFAR","ACRE2"};
      default = 1;
    };
    class spacer1 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
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
    class phx_loadout_pilot_uniform {
      title = "Pilot Uniform:";
      values[] = {0,1};
      texts[] = {"Rotary","Fixed"};
      default = 0;
    };
    class phx_loadout_nightvision {
      title = "Nightvision:";
      values[] = {-1,0,1,2,3,4};
      texts[] = {"Mission default","Nobody","Everyone","OPFOR","BLUFOR","INDFOR"};
      default = -1;
    };
    class spacer19 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    class phx_loadout_BLUFORCharges {
      title = "BLUFOR CE Charge Loadout:";
      values[] = {-1,0,1,2,3};
      texts[] = {"2x Satchel (default)","4x Demo block","2x Demo, 1x Trip Mine","2x Trip Mine","1x Satchel, 2x SLAM, 1x M15 AT Mine"};
      default = -1;
    };
    class phx_loadout_OPFORCharges {
      title = "OPFOR CE Charge Loadout:";
      values[] = {-1,0,1,2,3};
      texts[] = {"2x Satchel (default)","4x Demo block","2x Demo, 1x Trip Mine","2x Trip Mine","1x Satchel, 2x SLAM, 1x M15 AT Mine"};
      default = -1;
    };
    class phx_loadout_INDFORCharges {
      title = "INDFOR CE Charge Loadout:";
      values[] = {-1,0,1,2,3};
      texts[] = {"2x Satchel (default)","4x Demo block","2x Demo, 1x Trip Mine","2x Trip Mine","1x Satchel, 2x SLAM, 1x M15 AT Mine"};
      default = -1;
    };
    class phx_loadout_allowCESelector {
      title = "CE Explosives Selector UI";
      values[] = {0,1};
      texts[] = {"Enabled (default)","disabled"};
      default = 0;
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
    class spacer44 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    class phx_loadout_blufor_weaponSelector {
      title = "BLUFOR weapon selector:";
      values[] = {0,1};
      texts[] = {"Disabled","Enabled"};
      default = 1;
    };
    class phx_loadout_opfor_weaponSelector {
      title = "OPFOR weapon selector:";
      values[] = {0,1};
      texts[] = {"Disabled","Enabled"};
      default = 1;
    };
    class spacer67 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    class phx_loadout_blufor_optics {
      title = "BLUFOR Optic Magnification:";
      values[] = {0,1,2};
      texts[] = {"No optics","1x","1x-6x"};
      default = 1;
    };
    class phx_loadout_opfor_optics {
      title = "OPFOR Optic Magnification:";
      values[] = {0,1,2};
      texts[] = {"No optics","1x","1x-6x"};
      default = 1;
    };
    class phx_loadout_indfor_optics {
      title = "INDFOR Optic Magnification:";
      values[] = {0,1,2};
      texts[] = {"No optics","1x","1x-6x"};
      default = 1;
    };
    class phx_loadout_blufor_attachments {
      title = "BLUFOR Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_opfor_attachments {
      title = "OPFOR Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_indfor_attachments {
      title = "INDFOR Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_civ_attachments {
      title = "CIV Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class spacer3 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    class phx_loadout_blufor_lr_radio {
      title = "BLUFOR Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 1;
    };
    class phx_loadout_opfor_lr_radio {
      title = "OPFOR Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 1;
    };
    class phx_loadout_indfor_lr_radio {
      title = "INDFOR Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 1;
    };
    class phx_loadout_civ_lr_radio {
      title = "CIV Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
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
    class phx_loadout_modset{
      title = "Loadout Modset:";
        values[] = {0, 1, 2};
        texts[] = {"Vanilla", "RHS", "IFA/FOW"};
        default = 1;
    };
    class phx_loadout_radio {
        title = "Radio Deployment:";
        values[] = {0,1,2,3};
        texts[] = {"All Players (default)","Team Leaders and above","Squad Leaders and above","No Radios"};
        default = 0;
    };
    class phx_vehicleLocks {
      title = "Vehicle Locking";
      values[] = {-1,0,1};
      texts[] = {"None","Lock to side","Lock to side and crewman"};
      default = -1;
    };
    class phx_indforFriends {
      title = "Side INDFOR is friendly to:";
      values[] = {-1,0,1};
      texts[] = {"Nobody (default)","BLUFOR","OPFOR"};
      default = -1;
    };
    class spacer5 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
    //Weather & time
    class phx_timeOfDay {
      title = "Time of day";
      values[] = {-1,0,1,2,3,4,5};
      texts[] = {"Mission default","Sunrise","Morning","Noon","Evening","Sunset","Midnight"};
      default = -1;
    };
    class phx_weather_overcast {
      title = "Overcast";
      values[] = {-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1};
      texts[] = {"Mission default","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
      default = -1;
    };
    class phx_weather_rain {
      title = "Rain";
      values[] = {-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1};
      texts[] = {"Mission default","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
      default = -1;
    };
    class phx_weather_fog {
      title = "Fog";
      values[] = {-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1};
      texts[] = {"Mission default","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
      default = -1;
    };
    class spacer6 {
      title = "====================================================================================================================================================================================";
      values[] = {0};
      texts[] = {""};
      default = 0;
    };
	  // Safestart
    class f_param_mission_timer {
        title = "Safe Start (Minutes)";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,12,15,20};
        texts[] = {"Off","1","2","3","4","5","6","7","8","9","10","12","15","20"};
        default = 10;
        code = "f_param_mission_timer = %1";
    };
  //Mission Timer
    class phx_missionTimelimit {
        title = "Time Limit:";
        values[] = {1,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90};
        texts[] = {"1 minute","5 minutes","10 minutes","15 minutes","20 minutes","25 minutes","30 minutes","35 minutes","40 minutes","45 minutes (default)","50 minutes","55 minutes","60 minutes","65 minutes","70 minutes","75 minutes","80 minutes","85 minutes","90 minutes",};
        default = 60;
    };
    class phx_zoneRestriction {
      title = "Zone Restriction:";
      values[] = {0,1};
      texts[] = {"Off (default)","On"};
      default = 0;
    };
};
