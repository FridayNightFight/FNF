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

{
  _syncedObjects = synchronizedObjects _x;
  _zonePrefix = _x getVariable "fnf_prefix";

  //check if this playzone module applies to the player
  _forPlayer = false;
  {
    if (_x == player) then
    {
      _forPlayer = true;
      break;
    };
  } forEach _syncedObjects;

  //if it does create the playzone
  if (_forPlayer) then
  {
    _playZonesReported = _playZonesReported + 1;
    //check if the playzone group has been created, if not create it
    if (not _playZoneRestrictionGroupSet) then
    {
      ["playZoneGroup", false, true] call FNF_ClientSide_fnc_addRestrictionGroup;
      _playZoneRestrictionGroupSet = true;
    };
    [_zonePrefix, true, true] call FNF_ClientSide_fnc_addZone;
    ["playZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
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
    [_zonePrefix, false, false] call FNF_ClientSide_fnc_addZone;
    [_zonePrefix, false, false] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _sparePlayZones;

//warn mission maker if more than one playy zone is reported
if (_playZonesReported > 1 and fnf_debug) then
{
  systemChat "WARNING: Multiple play zones does not support complex shading, no shading has been applied";
};
