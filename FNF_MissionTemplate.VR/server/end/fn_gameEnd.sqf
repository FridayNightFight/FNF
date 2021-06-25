params ["_sideWon", "_condition"];

private ["_sideWonStr", "_flagStr"];

_sideWonStr = str _sideWon;
_sideWonName = (_sideWon call BIS_fnc_sideID) call BIS_fnc_sideName;
switch (_sideWon) do {
	case west: {_flagStr = "Faction_BLUFOR_EP1"};
	case east: {_flagStr = "Faction_OPFFOR_EP1"};
	case independent: {_flagStr = "Faction_INDFOR_EP1"};
};
_colorStr = format["Color%1", _sideWonStr];

_facColor = [];
{
	_facColor pushback (call compile _x);
} forEach (getArray(configfile >> "CfgMarkerColors" >> _colorStr >> "color"));

[[getText(configfile >> "CfgMarkers" >> _flagStr >> "texture"), 2],[_sideWonName, 1.5, _facColor], [_condition, 1, [1, 1, 1, 1]], false] remoteExec ["CBA_fnc_notify", 0];

[_sideWon, format["%1 %2", _sideWonName, _condition] call ocap_fnc_exportData;

sleep 10;

"end1" call BIS_fnc_endMissionServer;
