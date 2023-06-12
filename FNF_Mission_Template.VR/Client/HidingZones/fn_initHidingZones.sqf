/*
	Author: Mallen

	Description:
		Sets up the hiding zone system

	Parameter(s):
		None

	Returns:
		None
*/

fnf_objectsToHide = [];
//[_object, _task, _zoneKnown, _hidingZonesPrefixs]

[{
  {
    _object = _x select 0;
    _task = _x select 1;
    _zoneKnown = _x select 2;
    _hidingZonesPrefixs = _x select 3;

    _zoneHiddenInside = "";
    {
      _result = [_object, _x] call FNF_ClientSide_fnc_isObjectInZone;
      if (_result) then
      {
        _zoneHiddenInside = _x;
        break;
      };
    } forEach _hidingZonesPrefixs;

    if (_zoneHiddenInside == "") then
    {
      _task setSimpleTaskDestination (getPos _object);
      continue;
    };

    if (_zoneKnown) then
    {
      _validPoint =[ _zoneHiddenInside] call FNF_ClientSide_fnc_findValidPointWithinZone;
      _task setSimpleTaskDestination _validPoint;
    } else {
      cancelSimpleTaskDestination _task;
    };
  } forEach fnf_objectsToHide;
}, 1] call CBA_fnc_addPerFrameHandler;
