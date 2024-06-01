/*
	Author: Mallen

	Description:
		Adds a Zone to a Restriction group

	Parameter(s):
		0: STRING -	The name of the group the zone should be put into
		1: STRING -	The zone prefix used by the zone

	Returns:
		None
*/

params["_groupName", "_zonePrefix"];

_groupIndex = -1;
_zoneData = [];

{
	if (_x select 0 isEqualTo _zonePrefix) then
	{
		_zoneData = _x;
		break;
	};
} forEach fnf_zoneList;

{
	if (_x select 0 isEqualTo _groupName) then
	{
		_groupIndex = _forEachIndex;
		break;
	};
} forEach fnf_zoneRestrictionGroupsList;

if (_groupIndex isNotEqualTo -1) then
{
	fnf_zoneRestrictionGroupsList select _groupIndex select 1 pushBack _zoneData;
};
