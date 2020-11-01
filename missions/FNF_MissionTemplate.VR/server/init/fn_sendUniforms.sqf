/*
Sends base uniform and helmet classes to clients for each present side
*/

pRole = 999;
private _eastUniform = "";
private _eastHeadgear = "";
private _westUniform = "";
private _westHeadgear = "";
private _indUniform = "";
private _indHeadgear = "";

if ((east countSide allPlayers) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_opforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _eastUniform = phx_loadout_uniform;
  _eastHeadgear = phx_loadout_headgear;
};

if ((west countSide allPlayers) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_bluforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _westUniform = phx_loadout_uniform;
  _westHeadgear = phx_loadout_headgear;
};

if ((independent countSide allPlayers) > 0) then {
  _incStr = "client\loadout\uniforms\" + phx_indforUniform + ".sqf";
  call compile preprocessFileLineNumbers _incStr;

  _indUniform = phx_loadout_uniform;
  _indHeadgear = phx_loadout_headgear;
};

["phx_briefing_east_uniform", _eastUniform] call CBA_fnc_publicVariable;
["phx_briefing_east_headgear", _eastHeadgear] call CBA_fnc_publicVariable;

["phx_briefing_west_uniform", _westUniform] call CBA_fnc_publicVariable;
["phx_briefing_west_headgear", _westHeadgear] call CBA_fnc_publicVariable;

["phx_briefing_ind_uniform", _indUniform] call CBA_fnc_publicVariable;
["phx_briefing_ind_headgear", _indHeadgear] call CBA_fnc_publicVariable;
