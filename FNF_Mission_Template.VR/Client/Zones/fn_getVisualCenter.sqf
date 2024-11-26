/*
	Author: Mallen

	Description:
		gets the calculated visual center of the polygon

	Parameter(s):
		0: STRING -	The zone prefix used by the zone

	Returns:
		Position Array in format [x,y,z]
*/
params["_zonePrefix"];

(fnf_zoneList get _zonePrefix) select 3;
