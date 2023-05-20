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

if (isNil "fnf_objectsToHide") then
{
  call FNF_ClientSide_fnc_initHidingZones;
};

_zonePrefixs = [];

{
  _prefix = _x getVariable "fnf_prefix";
  _result = [_prefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_prefix, true, false] call FNF_ClientSide_fnc_addZone;
  };
  _zonePrefixs pushBack _prefix;
} forEach _hidingZoneModules;

fnf_objectsToHide pushBack [_object, _task, _zoneKnown, _zonePrefixs];