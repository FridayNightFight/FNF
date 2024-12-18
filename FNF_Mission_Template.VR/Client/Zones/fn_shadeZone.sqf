/*
	Author: Mallen

	Description:
		Takes a list of positions forming a regular polygon and shades it on the map

	Parameter(s):
		1: ARRAY -	An array of positions forming a regular polygon
		2: STRING -	The zone prefix used by the zone
		3: BOOLEAN -	Whether the shading should be inverted
		4: STRING -	Marker colour

	Returns:
		None
*/

params["_posList","_zonePrefix","_inverted","_colour"];

_workingData = +_posList;

_exclusions = [];

if (_inverted) then
{
	_result = [_workingData] call FNF_ClientSide_fnc_invertPolygon;
	_workingData = _result select 0;
	_exclusions = _result select 1;
};

_output = [];

[_workingData, _output] call FNF_ClientSide_fnc_triangulatePolygon;

_output = [_output, _exclusions] call FNF_ClientSide_fnc_combineOffsetPoints;

_colourRGBA = (configfile >> "CfgMarkerColors" >> _colour >> "color") call BIS_fnc_colorConfigToRGBA;

_colourRGBA set [3, 0.3];

fnf_trianglesToDraw set [_zonePrefix, [_output, _colourRGBA]];

