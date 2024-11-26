/*
	Author: Mallen

	Description:
		Removes a zone, does not delete the zone from any restriction groups

	Parameter(s):
		0: STRING -	The zone prefix used by the zone

	Returns:
		None
*/
params ["_zonePrefix"];

_data = fnf_zoneList get _zonePrefix;

deleteMarkerLocal (_data select 1);
deleteMarkerLocal (_data select 2);

[_zonePrefix] call FNF_ClientSide_fnc_unShadeZone;
fnf_zoneList deleteAt _zonePrefix;
