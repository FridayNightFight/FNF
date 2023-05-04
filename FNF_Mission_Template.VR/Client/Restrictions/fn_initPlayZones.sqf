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

{
  _syncedObjects = synchronizedObjects _x;
  _zonePrefix = _x getVariable "fnf_prefix";

  _forPlayer = false;
  {
    if (_x == player) then
    {
      _forPlayer = true;
      break;
    };
  } forEach _syncedObjects;

  if (_forPlayer) then
  {
    _playZonesReported = _playZonesReported + 1;
    if (not _playZoneRestrictionGroupSet) then
    {
      ["playZoneGroup", false, true] call FNF_ClientSide_fnc_addRestrictionGroup;
      _playZoneRestrictionGroupSet = true;
    };
    [_zonePrefix] call FNF_ClientSide_fnc_addZone;
    ["playZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
    continue;
  };

  [_zonePrefix] call FNF_ClientSide_fnc_addZone;
  [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
} forEach _modules;

if (_playZonesReported > 1 and fnf_debug) then
{
  systemChat "WARNING: Multiple play zones does not support complex shading, no shading has been applied";
};
