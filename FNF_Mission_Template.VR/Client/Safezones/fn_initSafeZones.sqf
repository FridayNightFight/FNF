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
_maxTimeZoneIsDeleted = 0;

{
  _syncedObjects = synchronizedObjects _x;
  _visibleToAllies = _x getVariable ["fnf_visibleToAllies", true];
  _visibleToEnemies = _x getVariable ["fnf_visibleToEnemies", true];
  _zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];

  if (_zonePrefix isEqualTo "FAILED") then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Safe zone does not have marker prefix set, safe zone will NOT function"
    };
    continue;
  };

  _showZone = false;
  _forPlayer = false;
  {
    //check if safezone is for player
    if (_x isEqualTo player) then
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
      ["safeZoneGroup", true, false, true] call FNF_ClientSide_fnc_addRestrictionGroup;
      _safeZoneRestrictionGroupSet = true;
    };
    _result = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
    if (_result) then
    {
      ["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
    };
    continue;
  };

  if (_showZone) then
  {
    _result = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
    if (!_result) then
    {
      if (fnf_debug) then
      {
        systemChat "DANGER: Safe zone failed to be initialised, safe zone will NOT function"
      };
    };
    continue;
  };

  //add zone to remove spare markers if zone is not for player
  _spareSafeZones pushBack _zonePrefix;

} forEach _modules;

//remove all spare safe zones
{
  _zonePrefix = _x;
  _result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_zonePrefix, "", false, false] call FNF_ClientSide_fnc_addZone;
    [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _spareSafeZones;
