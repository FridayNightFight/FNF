/*
	Author: Mallen

	Description:
		changes the colour of a zone to the one requested

	Parameter(s):
		0: STRING -	The zone prefix used by the zone
		1: STRING -	Marker colour

	Returns:
		None
*/

params["_zonePrefix","_colour"];

_zoneListData = fnf_zoneList get _zonePrefix;
(_zoneListData select 1) setMarkerColorLocal _colour;

_colourRGBA = (configfile >> "CfgMarkerColors" >> _colour >> "color") call BIS_fnc_colorConfigToRGBA;
_colourRGBA set [3, 0.3];

_triangleData = fnf_trianglesToDraw get _zonePrefix;
_triangleData set [1, _colourRGBA];
fnf_trianglesToDraw set [_zonePrefix, _triangleData];
