/*
	Author: Mallen

	Description:
		Checks if a zone exists

	Parameter(s):
		0: STRING -	The zone prefix used by the zone

	Returns:
		Boolean
*/

params["_zonePrefix"];

_zoneExists = false;
{
	if (_x select 0 isEqualTo _zonePrefix) then
	{
		_zoneExists = true;
		break;
	};
} forEach fnf_zoneList;

_zoneExists;
