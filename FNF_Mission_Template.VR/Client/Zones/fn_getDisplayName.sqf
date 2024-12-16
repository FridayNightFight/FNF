/*
	Author: Mallen

	Description:
		Returns the display name of a zone

	Parameter(s):
		0: STRING -	The zone prefix used by the zone

	Returns:
		String
*/
params ["_zonePrefix"];

markerText ((fnf_zoneList getOrDefault [_zonePrefix,""]) select 2);
