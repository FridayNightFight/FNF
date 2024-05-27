/*
	Author: Mallen

	Description:
		Checks if an object is within a zone

	Parameter(s):
		0: OBJECT -	The object being checked
		1: STRING -	The zone prefix used by the zone

	Returns:
		Boolean
*/

params["_object", "_zonePrefix"];
_result = false;

{
	if (_x select 0 isEqualTo _zonePrefix) then
	{
		if ((getPos _object) inPolygon (_x select 1)) then
		{
			_result = true;
			break;
		};
	};
} forEach fnf_zoneList;

_result;
