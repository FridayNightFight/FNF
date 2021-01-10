#include "cfgLoadouts.hpp"

//Set player role from class of their unit
_pClass = typeOf player;
if (_pClass == UNIT_OPFOR_PL || _pClass == UNIT_BLUFOR_PL || _pClass == UNIT_INDFOR_PL) then {pRole = ROLE_PL};
if (_pClass == UNIT_OPFOR_SL || _pClass == UNIT_BLUFOR_SL || _pClass == UNIT_INDFOR_SL) then {pRole = ROLE_SL};
if (_pClass == UNIT_OPFOR_TL || _pClass == UNIT_BLUFOR_TL || _pClass == UNIT_INDFOR_TL) then {pRole = ROLE_TL};
if (_pClass == UNIT_OPFOR_MGTL || _pClass == UNIT_BLUFOR_MGTL || _pClass == UNIT_INDFOR_MGTL) then {pRole = ROLE_MGTL};
if (_pClass == UNIT_OPFOR_CLS || _pClass == UNIT_BLUFOR_CLS || _pClass == UNIT_INDFOR_CLS) then {pRole = ROLE_CLS};
if (_pClass == UNIT_OPFOR_AR || _pClass == UNIT_BLUFOR_AR || _pClass == UNIT_INDFOR_AR) then {pRole = ROLE_AR};
if (_pClass == UNIT_OPFOR_AAR || _pClass == UNIT_BLUFOR_AAR || _pClass == UNIT_INDFOR_AAR) then {pRole = ROLE_AAR};
if (_pClass == UNIT_OPFOR_MG || _pClass == UNIT_BLUFOR_MG || _pClass == UNIT_INDFOR_MG) then {pRole = ROLE_MG};
if (_pClass == UNIT_OPFOR_AM || _pClass == UNIT_BLUFOR_AM || _pClass == UNIT_INDFOR_AM) then {pRole = ROLE_AM};
if (_pClass == UNIT_OPFOR_RAT || _pClass == UNIT_BLUFOR_RAT || _pClass == UNIT_INDFOR_RAT) then {pRole = ROLE_RAT};
if (_pClass == UNIT_OPFOR_CE || _pClass == UNIT_BLUFOR_CE || _pClass == UNIT_INDFOR_CE) then {pRole = ROLE_CE};
if (_pClass == UNIT_OPFOR_AT || _pClass == UNIT_BLUFOR_AT || _pClass == UNIT_INDFOR_AT) then {pRole = ROLE_AT};
if (_pClass == UNIT_OPFOR_AAT || _pClass == UNIT_BLUFOR_AAT || _pClass == UNIT_INDFOR_AAT) then {pRole = ROLE_AAT};
if (_pClass == UNIT_OPFOR_R || _pClass == UNIT_BLUFOR_R || _pClass == UNIT_INDFOR_R) then {pRole = ROLE_R};
if (_pClass == UNIT_OPFOR_CR || _pClass == UNIT_BLUFOR_CR || _pClass == UNIT_INDFOR_CR) then {pRole = ROLE_CR};
if (_pClass == UNIT_OPFOR_MK || _pClass == UNIT_BLUFOR_MK || _pClass == UNIT_INDFOR_MK) then {pRole = ROLE_MK};
if (_pClass == UNIT_OPFOR_SP || _pClass == UNIT_BLUFOR_SP || _pClass == UNIT_INDFOR_SP) then {pRole = ROLE_SP};
if (_pClass == UNIT_OPFOR_P || _pClass == UNIT_BLUFOR_P || _pClass == UNIT_INDFOR_P) then {pRole = ROLE_P};

if (isNil "pRole") exitWith {
  hint "Player role not set correctly. Alert the mission maker and join another slot.";
  player enableSimulation false;
  endMission "END1"
};

phx_loadout_unitLevel = 0;
//Shared
phx_loadout_aid = "FirstAidKit:4";
phx_loadout_smoke = "SmokeShell:2";
phx_loadout_grenade = "rhs_mag_m67:2";
phx_loadout_maptools = "ACE_MapTools";
//CE
phx_loadout_explosives = "SatchelCharge_Remote_Mag:2";
phx_loadout_defusalkit = "ACE_DefusalKit";
phx_loadout_trigger = "ACE_M26_Clacker";
phx_loadout_entrenching = "ACE_EntrenchingTool";
phx_loadout_detector = "MineDetector";
//Medic
phx_loadout_PAK = "ACE_personalAidKit";
phx_loadout_bandage = "ACE_fieldDressing:32";
phx_loadout_morphine = "ACE_morphine:16";
phx_loadout_epinephrine = "ACE_epinephrine:8";
phx_loadout_blood = "ACE_bloodIV:6";
//Range
phx_loadout_binocular = "Binocular";
phx_loadout_vector = "ACE_VectorDay";
phx_loadout_sswt = "ACE_Tripod";
phx_loadout_rifle_optic = "optic_DMS";
phx_allowedOptics = ["optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high", "rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas"];

call phx_fnc_setUniform;
call phx_fnc_setWeapons;
