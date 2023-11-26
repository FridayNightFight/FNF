/*
	Author: Mallen

	Description:
		gets the calculated visual center of the polygon

	Parameter(s):
		0: STRING -  The zone prefix used by the zone

	Returns:
		Position Array in format [x,y,z]
*/
params["_zonePrefix"];
_output = [0,0,0];

//find zone described above
{
	if (_x select 0 isEqualTo _zonePrefix) then
	{
		_output = _x select 4;
		break;
	};
} forEach fnf_zoneList;

_output;
