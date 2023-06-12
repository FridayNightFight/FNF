/*
	Author: Mallen

	Description:
		Adds a Restriction group that is used by initZones

	Parameter(s):
		0: STRING -  The name of the group to be created
		1: BOOLEAN -  whether the group should restrict the use of weapons in their zones
		2: BOOLEAN -  whether the group should teleport back the player if it loses one of their zones

	Returns:
		None
*/

params ["_groupName", "_restrictWeapons", "_teleportBack"];
_duplicate = false;
{
	if (_x select 0 == _groupName) then
	{
		_duplicate = true;
		break;
	};
} forEach fnf_zoneRestrictionGroupsList;
if (!_duplicate) then
{
	fnf_zoneRestrictionGroupsList pushBack [_groupName, [], _restrictWeapons, _teleportBack];
};