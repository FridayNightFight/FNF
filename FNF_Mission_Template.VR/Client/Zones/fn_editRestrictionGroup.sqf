/*
	Author: Mallen

	Description:
		Edits the restrictions on a restriction group

	Parameter(s):
		0: STRING -	The name of the group
		1: BOOLEAN -	whether the group should restrict the use of weapons in their zones
		2: BOOLEAN -	whether the group should teleport back the player if it loses one of their zones
		3: BOOLEAN -	whether the group should teleport back the player if it loses one of their zones while in a helicopter
		4: BOOLEAN -	whether the group should allow selectors only in its zones

	Returns:
		None
*/

params ["_groupName", "_restrictWeapons", "_teleportBack", "_restrictHelicopters", "_showSelectors"];

_groupIndex = -1;

{
	if (_x select 0 isEqualTo _groupName) then
	{
		_groupIndex = _forEachIndex;
		break;
	};
} forEach fnf_zoneRestrictionGroupsList;

if (_groupIndex isNotEqualTo -1) then
{
	fnf_zoneRestrictionGroupsList select _groupIndex set [2, _restrictWeapons];
	fnf_zoneRestrictionGroupsList select _groupIndex set [3, _teleportBack];
	fnf_zoneRestrictionGroupsList select _groupIndex set [4, _restrictHelicopters];
	fnf_zoneRestrictionGroupsList select _groupIndex set [5, _showSelectors];
};
