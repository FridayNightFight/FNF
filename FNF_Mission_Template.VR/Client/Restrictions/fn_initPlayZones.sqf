/*
	Author: Mallen

	Description:
		Sets up the required play zones specified by modules

	Parameter(s):
		0: ARRAY -  An array of all playzone modules

	Returns:
		None
*/

params ["_modules"];

_playZoneRestrictionGroupSet = false;
_playZonesReported = 0;
_sparePlayZones = [];
_mainPlayZones = [];

{
  _syncedObjects = synchronizedObjects _x;
  _zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];

  if (_zonePrefix isEqualTo "FAILED") then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Play zone does not have marker prefix set, play zone will NOT function"
    };
    continue;
  };

  //check if this playzone module applies to the player
  _forPlayer = false;
  {
    _objType = typeOf _x;
    _zoneSide = sideUnknown;
    switch (_objType) do {
      case "SideBLUFOR_F":
      {
        _zoneSide = west;
      };
      case "SideOPFOR_F":
      {
        _zoneSide = east;
      };
      case "SideResistance_F":
      {
        _zoneSide = independent;
      };
      default
      {
        if (_x isEqualTo player) then
        {
          _forPlayer = true;
          break;
        };
      };
    };

    if (_zoneSide isEqualTo playerSide) then
    {
      _forPlayer = true;
      break;
    };
  } forEach _syncedObjects;

  //if it does set playzone to be created
  if (_forPlayer) then
  {
    _playZonesReported = _playZonesReported + 1;
    _mainPlayZones pushBack _zonePrefix;
    continue;
  };

  //add zone to remove spare markers if zone is not for player
  _sparePlayZones pushBack _zonePrefix;
} forEach _modules;

{
  _zonePrefix = _x;
  _result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_zonePrefix, "", false, false] call FNF_ClientSide_fnc_addZone;
    [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _sparePlayZones;

{
  _zonePrefix = _x;
  //check if the playzone group has been created, if not create it
  if (not _playZoneRestrictionGroupSet) then
  {
    ["playZoneGroup", false, true, false] call FNF_ClientSide_fnc_addRestrictionGroup;
    _playZoneRestrictionGroupSet = true;
  };
  _shadePlayZone = true;
  if (_playZonesReported > 1) then
  {
    _shadePlayZone = false;
  };
  _result = [_zonePrefix, "", _shadePlayZone, true] call FNF_ClientSide_fnc_addZone;
  if (_result) then
  {
    ["playZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
  } else {
    if (fnf_debug) then
    {
      systemChat "DANGER: Play zone failed to be initialised, play zone will NOT function"
    };
  };

} forEach _mainPlayZones;

//warn mission maker if more than one play zone is reported
if (_playZonesReported > 1 and fnf_debug) then
{
  systemChat "WARNING: Multiple play zones does not support complex shading, no shading has been applied";
};
