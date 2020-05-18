if (phx_customLoadouts) exitWith {missionNamespace setVariable ["phx_loadoutAssigned", true]};

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
if (_pClass == UNIT_OPFOR_P || _pClass == UNIT_BLUFOR_P || _pClass == UNIT_INDFOR_P) then {pRole = ROLE_P};

if (isNil "pRole") exitWith {hint "Player role not set correctly. Alert the mission maker and join another slot."; [] spawn {player enableSimulation false; sleep 5; endMission "END1"}};

phx_loadout_unitLevel = 0;
//Shared
phx_loadout_aid = "FirstAidKit:4";
phx_loadout_smoke = "SmokeShell:4";
phx_loadout_grenade = "HandGrenade:2";
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
//Binos
phx_loadout_binocular = "Binocular";
phx_loadout_vector = "ACE_VectorDay";

call phx_fnc_removeGear;
call phx_fnc_setUniform;
call phx_fnc_setWeapons;
call phx_fnc_addUniform;

player linkItem "ItemGPS";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

switch (pRole) do {
  case ROLE_PL: {call compile preprocessFileLineNumbers format["client\loadout\units\PL.sqf"]};
  case ROLE_SL: {call compile preprocessFileLineNumbers format["client\loadout\units\SL.sqf"]};
  case ROLE_TL: {call compile preprocessFileLineNumbers format["client\loadout\units\TL.sqf"]};
  case ROLE_MGTL: {call compile preprocessFileLineNumbers format["client\loadout\units\MGTL.sqf"]};
  case ROLE_TL: {call compile preprocessFileLineNumbers format["client\loadout\units\TL.sqf"]};
  case ROLE_CLS: {call compile preprocessFileLineNumbers format["client\loadout\units\CLS.sqf"]};
  case ROLE_AR: {call compile preprocessFileLineNumbers format["client\loadout\units\AR.sqf"]};
  case ROLE_AAR: {call compile preprocessFileLineNumbers format["client\loadout\units\AAR.sqf"]};
  case ROLE_MG: {call compile preprocessFileLineNumbers format["client\loadout\units\MG.sqf"]};
  case ROLE_AM: {call compile preprocessFileLineNumbers format["client\loadout\units\AM.sqf"]};
  case ROLE_RAT: {call compile preprocessFileLineNumbers format["client\loadout\units\RAT.sqf"]};
  case ROLE_CE: {call compile preprocessFileLineNumbers format["client\loadout\units\CE.sqf"]};
  case ROLE_AT: {call compile preprocessFileLineNumbers format["client\loadout\units\AT.sqf"]};
  case ROLE_AAT: {call compile preprocessFileLineNumbers format["client\loadout\units\AAT.sqf"]};
  case ROLE_R: {call compile preprocessFileLineNumbers format["client\loadout\units\R.sqf"]};
  case ROLE_CR: {call compile preprocessFileLineNumbers format["client\loadout\units\CR.sqf"]};
  case ROLE_MK: {call compile preprocessFileLineNumbers format["client\loadout\units\MK.sqf"]};
  case ROLE_P: {call compile preprocessFileLineNumbers format["client\loadout\units\P.sqf"]};
};

if (phx_loadout_unitLevel > 0) then {
  player addItem "ACE_microDAGR";
};
