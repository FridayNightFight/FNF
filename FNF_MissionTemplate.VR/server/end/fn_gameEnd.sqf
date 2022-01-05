params ["_sideWon", "_condition"];


private _sideWonStr = str _sideWon;
private _sideWonName = _sideWon call BIS_fnc_sideName;
_colorStr = format["Color%1", _sideWonStr];
private _flagStr = "";
private _facColor = [];

switch (_sideWon) do {
	case west: {
		_flagStr = "Faction_BLUFOR_EP1";
		_facColor = [west, false] call BIS_fnc_sideColor;
	};
	case east: {
		_flagStr = "Faction_OPFOR_EP1";
		_facColor = [east, false] call BIS_fnc_sideColor;
	};
	case independent: {
		_flagStr = "Faction_INDFOR_EP1";
		_facColor = [independent, false] call BIS_fnc_sideColor;
	};
};

// {
// 	_facColor pushback (call compile _x);
// } forEach (getArray(configfile >> "CfgMarkerColors" >> _colorStr >> "color"));

{if (!isNull player) then {player allowDamage false};} remoteExec ["call", -2];

[format [
  "<t align='center'><br/><img image='%1' size='5'/><br/><br/><t size='1.5'>%2 %3</t></t>",
  getText(configfile >> "CfgMarkers" >> _flagStr >> "texture"),
  _sideWonName,
  _condition
  ],
  "info",
  20
] remoteExec ["phx_ui_fnc_notify", 0];

[format["%1 %2", _sideWonName, _condition]] call phx_fnc_webhook_roundEnd;

sleep 10;
["end1", [
  format ["%1 wins!", _sideWonName], // title
  format ["%1 %2", _sideWonName, _condition], // description
  format ["Game mode: %1", toUpper phx_gameMode], // subtitle
  getMissionPath "description\images\fnf.paa" // title image
  // getMissionPath "description\images\fnf_bg1.paa" // background image
]] remoteExecCall ["setDebriefingText", 0];

if (isClass (configFile >> "CfgPatches" >> "OCAP")) then {
  [_sideWon, format["%1 %2", _sideWonName, _condition]] call ocap_fnc_exportData;
};

"end1" call BIS_fnc_endMissionServer;
