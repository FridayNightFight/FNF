/*
	Author: Mallen

	Description:
		Sets up the required safe zones specified by modules

	Parameter(s):
		0: ARRAY -  An array of all safezone modules

	Returns:
		None
*/

params ["_modules"];

//safe zones require weapon disabling
call FNF_ClientSide_fnc_initWeaponDisable;

_safeZoneRestrictionGroupSet = false;
_spareSafeZones = [];

{
  _syncedObjects = synchronizedObjects _x;
  _visibleToAllies = _x getVariable "fnf_visibleToAllies";
  _visibleToEnemies = _x getVariable "fnf_visibleToEnemies";
  _zonePrefix = _x getVariable "fnf_prefix";

  _showZone = false;
  _forPlayer = false;
  {
    //check if safezone is for player
    if (_x == player) then
    {
      _forPlayer = true;
      break;
    };
    //check if player should see safezone for other reasons
    if (isPlayer _x and not _showZone) then
    {
      _zoneSide = side _x;
      if ([playerSide, _zoneSide] call BIS_fnc_sideIsFriendly) then
      {
        if (_visibleToAllies) then
        {
          _showZone = true;
        };
      } else {
        if (_visibleToEnemies) then
        {
          _showZone = true;
        };
      };
    };
  } forEach _syncedObjects;

  //if for the player setup the safe zone
  if (_forPlayer) then
  {
    //check if the safezone group has been created, if not create it
    if (not _safeZoneRestrictionGroupSet) then
    {
      ["safeZoneGroup", true, true] call FNF_ClientSide_fnc_addRestrictionGroup;
      _safeZoneRestrictionGroupSet = true;
    };
    [_zonePrefix] call FNF_ClientSide_fnc_addZone;
    ["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
    continue;
  };

  if (_showZone) then
  {
    [_zonePrefix] call FNF_ClientSide_fnc_addZone;
    continue;
  };

  //add zone to remove spare markers if zone is not for player
  _spareSafeZones pushBack _zonePrefix;

} forEach _modules;

{
  _zonePrefix = _x;
  _result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_zonePrefix] call FNF_ClientSide_fnc_addZone;
    [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _spareSafeZones;
