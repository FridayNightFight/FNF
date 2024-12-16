/*
	Author: Mallen

	Description:
		Removes a shading from the map by zone index

	Parameter(s):
		0: STRING -	The zone prefix used by the zone

	Returns:
		None
*/

params["_zonePrefix"];

fnf_trianglesToDraw deleteAt _zonePrefix;
