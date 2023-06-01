/*
	Author: Mallen

	Description:
		Returns the display name of a zone

	Parameter(s):
		0: STRING -  The zone prefix used by the zone

	Returns:
		String
*/
params ["_zonePrefix"];

_displayName = "";
{
	if (_x select 0 == _zonePrefix) then
	{
		_displayName = markerText (_x select 3);
		break;
	};
} forEach fnf_zoneList;

_displayName;
