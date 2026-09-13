/*
	Author: Mallen

	Description:
		Hides the current zone from view but does not remove it

	Parameter(s):
		0: STRING -	The zone prefix used by the zone
		1: BOOL -	whether the zone should be hidden or not

	Returns:
		None
*/

params["_zonePrefix","_state"];

_zoneListData = fnf_zoneList get _zonePrefix;
_colour = GetMarkerColor (_zoneListData select 1);

_colourRGBA = (configfile >> "CfgMarkerColors" >> _colour >> "color") call BIS_fnc_colorConfigToRGBA;

if (_state) then
{
	(_zoneListData select 1) setMarkerAlphaLocal 0;
	_colourRGBA set [3, 0];
} else {
	(_zoneListData select 1) setMarkerAlphaLocal 1;
	_colourRGBA set [3, 0.3];
};

_triangleData = fnf_trianglesToDraw get _zonePrefix;
_triangleData set [1, _colourRGBA];
fnf_trianglesToDraw set [_zonePrefix, _triangleData];
