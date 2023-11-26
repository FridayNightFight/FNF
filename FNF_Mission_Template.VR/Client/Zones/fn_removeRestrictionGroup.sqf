/*
	Author: Mallen

	Description:
		Removes a restriction group, does not delete the zones in that group

	Parameter(s):
		0: STRING -  The group name

	Returns:
		None
*/

params ["_groupName"];
_index = -1;
{
	if (_x select 0 isEqualTo _groupName) then
	{
		_index = _forEachIndex;
		break;
	};
} forEach fnf_zoneRestrictionGroupsList;
if (_index != -1) then
{
	if (fnf_zoneRestrictionGroupsList select _index select 2) then
	{
		(fnf_zoneRestrictionGroupsList select _index select 0) call FNF_ClientSide_fnc_endRequestWeaponDisable;
	};
	fnf_zoneRestrictionGroupsList deleteAt _index;
};
