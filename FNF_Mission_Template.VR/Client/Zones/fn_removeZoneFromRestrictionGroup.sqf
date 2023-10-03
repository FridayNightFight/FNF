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

//gets restriction group and zone mentioned
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
  //if zone currently has a weapondisable request end that request
	if (fnf_zoneRestrictionGroupsList select _groupIndex select 2) then
	{
		if ([player ,_zonePrefix] call FNF_ClientSide_fnc_isObjectInZone) then
		{
			(fnf_zoneRestrictionGroupsList select _groupIndex select 0) call FNF_ClientSide_fnc_endRequestWeaponDisable;
		};
	};
  //if zone is part of group supposed to be containing a player move that player to next valid zone so they continue to satisy condition
	if (fnf_zoneRestrictionGroupsList select _groupIndex select 3) then
	{
    [{
      params["_groupName", "_groupIndex"];
      if (([_groupName] call FNF_ClientSide_fnc_areAnyZonesInRestrictionGroup)) then
      {
        player setPos (fnf_zoneRestrictionGroupsList select _groupIndex select 1 select 0 select 0) call FNF_ClientSide_fnc_getVisualCenter;
      };
    },[_groupName, _groupIndex, _zoneIndex],1] call CBA_fnc_waitAndExecute
	};
  fnf_zoneRestrictionGroupsList select _groupIndex select 1 deleteAt _zoneIndex;
};
