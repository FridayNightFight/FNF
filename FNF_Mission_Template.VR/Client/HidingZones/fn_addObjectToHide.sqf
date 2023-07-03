/*
	Author: Mallen

	Description:
    add an object and its task which will be hidden if inside a hiding zone

	Parameter(s):
		0: OBJECT -  The object to be hidden in the zones
    1: TASK -  The task associated with the object to set destination for
    2: BOOLEAN -  Whether the zone the object is in should be known
    3: ARRAY -  The hiding zone modules to hide the object in

	Returns:
		None
*/

params["_object", "_task", "_zoneKnown", "_hidingZoneModules"];

//if hiding zones have not been inited, init it
if (isNil "fnf_objectsToHide") then
{
  call FNF_ClientSide_fnc_initHidingZones;
};

_zonePrefixs = [];

//for each hiding zone, make sure it exists, if it doesnt create it and add the zone for the object to be hidden in
{
  _prefix = _x getVariable "fnf_prefix";
  _result = [_prefix] call FNF_ClientSide_fnc_verifyZone;
  _resultaddZone = true;
  if (not _result) then
  {
    _resultaddZone = [_prefix, "", true, false] call FNF_ClientSide_fnc_addZone;
  };
  if (_resultaddZone) then
  {
    _zonePrefixs pushBack _prefix;
  };
} forEach _hidingZoneModules;

//add the zones for object to hide in for overall hiding zone system
if (count _zonePrefixs > 0) then
{
  fnf_objectsToHide pushBack [_object, _task, _zoneKnown, _zonePrefixs];
} else {
  //if no zones, let player know if debug enabled
  if (fnf_debug) then
  {
    systemChat "WARNING: No valid hiding zones detected, objective will not be hidden"
  };
};
