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

		if (isNull _object) then
		{
			continue;
		};

		//check if object is in any of the hiding zones it is assigned to
		_zoneHiddenInside = "";
		{
			_result = [_object, _x] call FNF_ClientSide_fnc_isObjectInZone;
			if (_result) then
			{
				_zoneHiddenInside = _x;
				break;
			};
		} forEach _hidingZonesPrefixs;

		//if it is not in any hiding zone simpley set the OBJ on the object
		if (_zoneHiddenInside isEqualTo "") then
		{
			_task setSimpleTaskDestination (getPos _object);
			continue;
		};

		//if the zone the objective is in is known, make sure that is shown correctly
		if (_zoneKnown) then
		{
			_validPoint = [_zoneHiddenInside] call FNF_ClientSide_fnc_getVisualCenter;
			_task setSimpleTaskDestination _validPoint;
		} else {
			cancelSimpleTaskDestination _task;
		};
	} forEach fnf_objectsToHide;
}, 1] call CBA_fnc_addPerFrameHandler;
