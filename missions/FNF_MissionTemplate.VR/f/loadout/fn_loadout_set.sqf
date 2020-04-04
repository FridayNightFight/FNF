if (!hasInterface) exitWith {};

_bluforCustomLoadouts = false;
_opforCustomLoadouts = false;
_indforCustomLoadouts = false;

switch (playerSide) do {
  case east: {
    if (_opforCustomLoadouts) then {
      phx_loadoutAssigned = true;
    };
  };
  case west: {
    if (_bluforCustomLoadouts) then {
      phx_loadoutAssigned = true;
    };
  };
  case independent: {
    if (_indforCustomLoadouts) then {
      phx_loadoutAssigned = true;
    };
  };
};

// Ensure script is run only once.
if (!isNil "phx_loadoutAssigned") exitWith {};
phx_loadoutAssigned = false;

#include "cfgLoadouts.hpp"

private _char = toLower (typeOf player);

//Get radio and map parameters from the slot screen. If the parameters don't exist then they default to giving everybody a map and radio.
phx_loadout_radio = ["phx_loadout_radio",0] call BIS_fnc_getParamValue;
phx_loadout_map = ["phx_loadout_map",0] call BIS_fnc_getParamValue;
phx_loadout_gps = ["phx_loadout_gps",0] call BIS_fnc_getParamValue;
phx_loadout_watch = ["phx_loadout_watch",0] call BIS_fnc_getParamValue;
phx_loadout_compass = ["phx_loadout_compass",0] call BIS_fnc_getParamValue;
phx_loadout_aid = "FirstAidKit:4";
phx_loadout_smoke = "SmokeShell:4";
phx_loadout_grenade = "HandGrenade:2";
phx_loadout_cuffs = "ACE_CableTie:2";
phx_loadout_explosives = "SatchelCharge_Remote_Mag:2";
phx_loadout_explosives_1 = "";
phx_loadout_explosives_2 = "";
phx_loadout_defusalkit = "ACE_DefusalKit";
phx_loadout_trigger = "ACE_M26_Clacker";
phx_loadout_PAK = "ACE_personalAidKit";
phx_loadout_bandage = "ACE_fieldDressing:32";
phx_loadout_morphine = "ACE_morphine:16";
phx_loadout_epinephrine = "ACE_epinephrine:8";
phx_loadout_blood = "ACE_bloodIV:6";
phx_loadout_splint = "ACE_splint";
phx_loadout_maptools = "ACE_MapTools";
phx_loadout_entrenching = "ACE_EntrenchingTool";

//CE charge loadout (configured via mission params)
call phx_fnc_handleCECharges;

/*
    Acceptable Values for unit level:
    0 - Regular unit
    1 - Team Leader
    2 - Squad Leader or Higher

    Set the default unit level          */
phx_loadout_unitLevel = 0;

private _loadout = ["phx_loadout_modSet",1] call BIS_fnc_getParamValue;
_loadout = switch (_loadout) do {
    case 0: {"Vanilla"}; // Vanilla A3
    case 1: {"RHS"}; // RHS
    default {"Vanilla"};
};

//====================================================================================================
// Get the default gear settings for each side
switch (side group player) do {
    case west: {
      pUniform = ["phx_loadout_blufor_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["phx_loadout_blufor_weapons",0] call BIS_fnc_getParamValue;
      phx_loadout_addAttachment = ["phx_loadout_blufor_attachments",""] call BIS_fnc_getParamValue;
    };
    case east: {
      pUniform = ["phx_loadout_opfor_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["phx_loadout_opfor_weapons",0] call BIS_fnc_getParamValue;
      phx_loadout_addAttachment = ["phx_loadout_opfor_attachments",""] call BIS_fnc_getParamValue;
    };
    case independent: {
      pUniform = ["phx_loadout_indfor_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["phx_loadout_indfor_weapons",0] call BIS_fnc_getParamValue;
      phx_loadout_addAttachment = ["phx_loadout_indfor_attachments",""] call BIS_fnc_getParamValue;
    };
    case civilian: {
      pUniform = ["phx_loadout_civ_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["phx_loadout_civ_weapons",0] call BIS_fnc_getParamValue;
      phx_loadout_addAttachment = ["phx_loadout_civ_attachments",""] call BIS_fnc_getParamValue;
      phx_loadout_radio = 3; // Don't give civs radios
    };
    default {
      pUniform = 0;
      pWeapons = 0;
    };
};

// Default role is rifleman
pRole = ROLE_R;

if (_char == UNIT_SPECTATOR) then {
      pRole = ROLE_SPECTATOR;
} else {

if (_char == UNIT_OPFOR_PL ||
    _char == UNIT_BLUFOR_PL ||
    _char == UNIT_INDFOR_PL) then {
      pRole = ROLE_PL;
} else {

if (_char == UNIT_OPFOR_CLS ||
    _char == UNIT_BLUFOR_CLS ||
    _char == UNIT_INDFOR_CLS) then {
      pRole = ROLE_CLS;
} else {

if (_char == UNIT_OPFOR_SL ||
    _char == UNIT_BLUFOR_SL ||
    _char == UNIT_INDFOR_SL) then {
      pRole = ROLE_SL;
} else {

if (_char == UNIT_OPFOR_TL ||
    _char == UNIT_BLUFOR_TL ||
    _char == UNIT_INDFOR_TL) then {
      pRole = ROLE_TL;
} else {

if (_char == UNIT_OPFOR_AR ||
    _char == UNIT_BLUFOR_AR ||
    _char == UNIT_INDFOR_AR) then {
      pRole = ROLE_AR;
} else {

if (_char == UNIT_OPFOR_AAR ||
    _char == UNIT_BLUFOR_AAR ||
    _char == UNIT_INDFOR_AAR) then {
      pRole = ROLE_AAR;
} else {

if (_char == UNIT_OPFOR_RAT ||
    _char == UNIT_BLUFOR_RAT ||
    _char == UNIT_INDFOR_RAT) then {
      pRole = ROLE_RAT;
} else {

if (_char == UNIT_OPFOR_CE ||
    _char == UNIT_BLUFOR_CE ||
    _char == UNIT_INDFOR_CE) then {
      pRole = ROLE_CE;
} else {

if (_char == UNIT_OPFOR_R ||
    _char == UNIT_BLUFOR_R ||
    _char == UNIT_INDFOR_R ||
    _char == UNIT_CIV_R) then {
      pRole = ROLE_R;
} else {

if (_char == UNIT_OPFOR_MG ||
    _char == UNIT_BLUFOR_MG ||
    _char == UNIT_INDFOR_MG) then {
      pRole = ROLE_MG;
} else {

if (_char == UNIT_OPFOR_AM ||
    _char == UNIT_BLUFOR_AM ||
    _char == UNIT_INDFOR_AM) then {
      pRole = ROLE_AM;
} else {

if (_char == UNIT_OPFOR_MGTL ||
    _char == UNIT_BLUFOR_MGTL ||
    _char == UNIT_INDFOR_MGTL) then {
      pRole = ROLE_MGTL;
} else {

if (_char == UNIT_OPFOR_AT ||
    _char == UNIT_BLUFOR_AT ||
    _char == UNIT_INDFOR_AT) then {
      pRole = ROLE_AT;
} else {

if (_char == UNIT_OPFOR_AAT ||
    _char == UNIT_BLUFOR_AAT ||
    _char == UNIT_INDFOR_AAT) then {
      pRole = ROLE_AAT;
} else {

if (_char == UNIT_OPFOR_P ||
    _char == UNIT_BLUFOR_P ||
    _char == UNIT_INDFOR_P) then {
      pRole = ROLE_P;
} else {

if (_char == UNIT_OPFOR_CR ||
    _char == UNIT_BLUFOR_CR ||
    _char == UNIT_INDFOR_CR) then {
      pRole = ROLE_CR;
} else {

if (_char == UNIT_OPFOR_MK ||
    _char == UNIT_BLUFOR_MK ||
    _char == UNIT_INDFOR_MK) then {
      pRole = ROLE_MK;
};

}; //end ROLE_CR
}; //end ROLE_P
}; //end ROLE_AAT
}; //end ROLE_AT
}; //end ROLE_MGTL
}; //end ROLE_AM
}; //end ROLE_MG
}; //end ROLE_R
}; //end ROLE_CE
}; //end ROLE_RAT
}; //end ROLE_AAR
}; //end ROLE_AR
}; //end ROLE_TL
}; //end ROLE_SL
}; //end ROLE_CLS
}; //end ROLE_PL
}; //end ROLE_SPECTATOR

// Determine uniform and weapons
[] call compile preprocessFileLineNumbers format["f\loadout\fn_loadout_uniforms.sqf"];
[] call compile preprocessFileLineNumbers format["f\loadout\fn_loadout_weapons.sqf"];

// Add stuff
[{
params ["_args", "_handle"];
_args params ["_addGearTime","_frameAdded","_char", "_loadout"];

if (diag_tickTime > _addGearTime && {diag_frameNo-10 > _frameAdded}) then {

removeAllWeapons player;
removeGoggles player;

[_handle] call CBA_fnc_removePerFrameHandler;

switch (pRole) do {
    //----------------------------------------
    // REDFOR - CSAT/EAST - OPF_F
    case ROLE_PL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\PL.sqf"]
    };
    case ROLE_AR: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AR.sqf"]
    };
    case ROLE_CLS: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\CLS.sqf"]
    };
    case ROLE_AAR: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AAR.sqf"]
    };
    case ROLE_SL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\SL.sqf"]
    };
    case ROLE_R: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\R.sqf"]
    };
    case ROLE_TL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\TL.sqf"]
    };
    case ROLE_CE: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\CE.sqf"]
    };
    case ROLE_MG: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\MG.sqf"]
    };
    case ROLE_RAT: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\RAT.sqf"]
    };
    case ROLE_AM: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AM.sqf"]
    };
    case ROLE_MGTL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\MGTL.sqf"]
    };
    case ROLE_AT: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AT.sqf"]
    };
    case ROLE_AAT: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AAT.sqf"]
    };
    case ROLE_P: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\P.sqf"]
    };
    case ROLE_CR: {
      [] call compile preprocessFileLineNumbers format["f\loadout\units\CR.sqf"]
    };
    case ROLE_MK: {
      [] call compile preprocessFileLineNumbers format["f\loadout\units\MK.sqf"]
    };

    // Error message - Classname not found in list
    default {diag_log format["PHX fn_loadout_set: Unable to find player classname in list: %1",_char];};
};

// Generate loadout briefing page.
call phx_fnc_loadout_notes;
};
}, 0, [(diag_tickTime+2.5),diag_frameno,_char,_loadout]] call CBA_fnc_addPerFrameHandler;
