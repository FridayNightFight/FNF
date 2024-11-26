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

_data = fnf_zoneList get _zonePrefix;
_center = _data select 3;
_distance = _data select 4;

if ((_center distance2D _object) <= _distance) then
{
	if ((getPos _object) inPolygon (_data select 0)) then
	{
		_result = true;
	};
};

_result;
