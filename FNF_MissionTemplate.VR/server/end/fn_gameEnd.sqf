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
		_flagStr = "Faction_OPFFOR_EP1";
		_facColor = [east, false] call BIS_fnc_sideColor;
	};
	case independent: {
		_flagStr = "Faction_INDFOR_EP1";
		_facColor = [independent, false] call BIS_fnc_sideColor;
	};
};

{
	_facColor pushback (call compile _x);
} forEach (getArray(configfile >> "CfgMarkerColors" >> _colorStr >> "color"));


[[getText(configfile >> "CfgMarkers" >> _flagStr >> "texture"), 2],[_sideWonName, 1.5], [_condition, 1, [1, 1, 1, 1]], false] remoteExec ["CBA_fnc_notify", 0];
// [[getText(configfile >> "CfgMarkers" >> _flagStr >> "texture"), 2],[_sideWonName, 1.5, _facColor], [_condition, 1, [1, 1, 1, 1]], false] remoteExec ["CBA_fnc_notify", 0];

[_sideWon, format["%1 %2", _sideWonName, _condition]] call ocap_fnc_exportData;

sleep 10;

"end1" call BIS_fnc_endMissionServer;
