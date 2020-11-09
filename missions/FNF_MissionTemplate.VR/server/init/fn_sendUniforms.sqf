/*
Sends base uniform and helmet classes to clients for each present side
*/

pRole = 999;

if ((east countSide allPlayers) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_opforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _eastUniform = phx_loadout_uniform;
  _eastHeadgear = phx_loadout_headgear;

  missionNamespace setVariable ["phx_briefing_east_uniform", _eastUniform, true];
  missionNamespace setVariable ["phx_briefing_east_headgear", _eastHeadgear, true];
};

if ((west countSide allPlayers) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_bluforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _westUniform = phx_loadout_uniform;
  _westHeadgear = phx_loadout_headgear;

  missionNamespace setVariable ["phx_briefing_west_uniform", _westUniform, true];
  missionNamespace setVariable ["phx_briefing_west_headgear", _westHeadgear, true];
};

if ((independent countSide allPlayers) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_indforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _indUniform = phx_loadout_uniform;
  _indHeadgear = phx_loadout_headgear;

  missionNamespace setVariable ["phx_briefing_ind_uniform", _indUniform, true];
  missionNamespace setVariable ["phx_briefing_ind_headgear", _indHeadgear, true];
};
