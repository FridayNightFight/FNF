/*
	Author: Mallen

	Description:
		Removes a zone from a restriction group

	Parameter(s):
		0: STRING -  The name of the group the zone should be put into
		1: STRING -  The zone prefix used by the zone

	Returns:
		None
*/

params["_groupName", "_zonePrefix"];

_groupIndex = -1;
_zoneIndex = -1;

{
	if (_x select 0 == _groupName) then
	{
		_groupIndex = _forEachIndex;
		{
			if (_x select 0 == _zonePrefix) then
			{
				_zoneIndex = _forEachIndex;
				break;
			};
		} forEach (_x select 1);
		break;
	};
} forEach fnf_zoneRestrictionGroupsList;

if (_groupIndex != -1 and _zoneIndex != -1) then
{
	if (fnf_zoneRestrictionGroupsList select _groupIndex select 2) then
	{
		if ([player ,_zonePrefix] call FNF_ClientSide_fnc_isObjectInZone) then
		{
			(fnf_zoneRestrictionGroupsList select _groupIndex select 0) call FNF_ClientSide_fnc_endRequestWeaponDisable;
		};
	};
	if (fnf_zoneRestrictionGroupsList select _groupIndex select 3) then 
	{
		_posToTPTo = [0,0,0];
		if (_zoneIndex == 0) then
		{
			_posToTPTo = (fnf_zoneRestrictionGroupsList select _groupIndex select 1 select (_zoneIndex + 1) select 0) call FNF_ClientSide_fnc_findValidPointWithinZone;
		} else
		{
			_posToTPTo = (fnf_zoneRestrictionGroupsList select _groupIndex select 1 select (_zoneIndex - 1) select 0) call FNF_ClientSide_fnc_findValidPointWithinZone;
		};
		player setPos _posToTPTo;
	};
	fnf_zoneRestrictionGroupsList select _groupIndex select 1 deleteAt _zoneIndex;
};