/*
	Author: Mallen

	Description:
		Sets up the zone system to be used by gamemodes

	Parameter(s):
		None

	Returns:
		None
*/

if (not isNil "fnf_zoneList") exitWith {};

//set up a list of all zones
fnf_zoneList = [];

//set up a list of restriction zone groups (if in one, satisfy's condition of all others)
fnf_zoneRestrictionGroupsList = [];

//sets up map shading
call FNF_ClientSide_fnc_initMapShading;

//add handeler to check if player is in any zones
fnf_zoneRestrictionsLastKnownPosition = getPosASL player;
[{
	_playerPos = getPosASL player;
	{
		_restrictionSatisfied = false;
		{
			if (_playerPos inPolygon (_x select 1)) then
			{
				_restrictionSatisfied = true;
				break;
			};
		} forEach (_x select 1);
		if (!_restrictionSatisfied) then
		{
			if (_x select 3) then
			{
				player setPosASL fnf_zoneRestrictionsLastKnownPosition;
			} else {
				if ((_x select 0) call FNF_ClientSide_fnc_getRequestWeaponDisable) then
				{
					(_x select 0) call FNF_ClientSide_fnc_endRequestWeaponDisable;
				};
			};
		} else {
			if (_x select 2) then
			{
				if (!((_x select 0) call FNF_ClientSide_fnc_getRequestWeaponDisable)) then
				{
					(_x select 0) call FNF_ClientSide_fnc_startRequestWeaponDisable;
				};
			};
		};
	} forEach fnf_zoneRestrictionGroupsList;
	fnf_zoneRestrictionsLastKnownPosition = getPosASL player;
}, 1] call CBA_fnc_addPerFrameHandler;
