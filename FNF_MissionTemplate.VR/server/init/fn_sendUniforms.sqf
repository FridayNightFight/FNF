/*
Sends base uniform and helmet classes to clients for each present side
*/

if (isNil "pRole") then {pRole = 99999;};

_sidePresent = {
  _this countSide (call BIS_fnc_listPlayers) > 0
};

if (east call _sidePresent) then {
  _incStr = "client\loadout\uniforms\" + phx_opforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _eastUniform = phx_loadout_uniform;
  _eastHead = phx_loadout_headgear;

  missionNamespace setVariable ["phx_briefing_east_uniform", _eastUniform, true];
  missionNamespace setVariable ["phx_briefing_east_headgear", _eastHead, true];

  _incStr = "client\loadout\weapons\" + phx_opforWeapons + ".sqf";
  call compile preprocessFileLineNumbers _incStr;
  _loadout = missionNamespace getVariable format["%1_LOADOUT", phx_opforWeapons];
  missionNamespace setVariable ["phx_briefing_east_loadout", _loadout, true];
};

if (west call _sidePresent) then {
  _incStr = "client\loadout\uniforms\" + phx_bluforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _westUniform = phx_loadout_uniform;
  _westHead = phx_loadout_headgear;

  missionNamespace setVariable ["phx_briefing_west_uniform", _westUniform, true];
  missionNamespace setVariable ["phx_briefing_west_headgear", _westHead, true];

  _incStr = "client\loadout\weapons\" + phx_bluforWeapons + ".sqf";
  call compile preprocessFileLineNumbers _incStr;
  _loadout = missionNamespace getVariable format["%1_LOADOUT", phx_bluforWeapons];
  missionNamespace setVariable ["phx_briefing_west_loadout", _loadout, true];
};

if (independent call _sidePresent) then {
  _incStr = "client\loadout\uniforms\" + phx_indforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _indUniform = phx_loadout_uniform;
  _indHead = phx_loadout_headgear;

  missionNamespace setVariable ["phx_briefing_ind_uniform", _indUniform, true];
  missionNamespace setVariable ["phx_briefing_ind_headgear", _indHead, true];

  _incStr = "client\loadout\weapons\" + phx_indforWeapons + ".sqf";
  call compile preprocessFileLineNumbers _incStr;
  _loadout = missionNamespace getVariable format["%1_LOADOUT", phx_indforWeapons];
  missionNamespace setVariable ["phx_briefing_ind_loadout", _loadout, true];
};
