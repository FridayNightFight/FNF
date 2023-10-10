/*
	Author: Mallen

	Description:
		Sets up the required play zones specified by modules for spectators

	Parameter(s):
		0: ARRAY -  An array of all playzone modules

	Returns:
		None
*/

params ["_modules"];

_playZonesReported = 0;
_mainPlayZones = [];

{
  _syncedObjects = synchronizedObjects _x;
  _zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];

  if (_zonePrefix == "FAILED") then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Play zone does not have marker prefix set, play zone will NOT function"
    };
    continue;
  };

  //set playzone to be created
  _playZonesReported = _playZonesReported + 1;
  _mainPlayZones pushBack _zonePrefix;
} forEach _modules;

{
  _zonePrefix = _x;

  _shadePlayZone = true;
  if (_playZonesReported > 1) then
  {
    _shadePlayZone = false;
  };

  _result = [_zonePrefix, "", _shadePlayZone, true] call FNF_ClientSide_fnc_addZone;

  if (not _result) then
  {
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
