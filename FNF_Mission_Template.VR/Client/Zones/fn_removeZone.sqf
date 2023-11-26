/*
	Author: Mallen

	Description:
		Removes a zone, does not delete the zone from any restriction groups

	Parameter(s):
		0: STRING -  The zone prefix used by the zone

	Returns:
		None
*/
params ["_zonePrefix"];

_zoneToBeDeletedIndex = -1;
{
	if (_x select 0 isEqualTo _zonePrefix) then
	{
		_zoneToBeDeletedIndex = _forEachIndex;
		deleteMarkerLocal (_x select 2);
    deleteMarkerLocal (_x select 3);
		break;
	};
} forEach fnf_zoneList;

if (_zoneToBeDeletedIndex != -1) then
{
	fnf_zoneList deleteAt _zoneToBeDeletedIndex;
  [_zonePrefix] call FNF_ClientSide_fnc_unShadeZone;
};
