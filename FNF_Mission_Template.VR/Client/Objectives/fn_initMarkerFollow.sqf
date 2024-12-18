/*
	Author: Mallen

	Description:
		Updates markers of objectives to where they should be on the map

	Parameter(s):
		None

	Returns:
		None
*/

if (not isNil "fnf_updateMarkerList") exitWith {};

fnf_updateMarkerList = [];

[{
	{
		_objectiveIndex = _x;

		_objEntry = fnf_objectives select _objectiveIndex;

		_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

		_objType = typeOf _module;
		switch (_objType) do {
			case "fnf_module_destroyObj":
			{
				_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

				_targetPos = _targetObject;
				if (not isNull _task) then
				{
					_targetPos = taskDestination _task;
				};

				_marker setMarkerPosLocal _targetPos;
			};

			case "fnf_module_terminalObj":
			{
				_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

				_targetPos = _targetObject;
				if (not isNull _task) then
				{
					_targetPos = taskDestination _task;
				};

				_marker setMarkerPosLocal _targetPos;
			};

			case "fnf_module_assassinObj":
			{
				_params params ["_targetObject", "_hidingZonesAssigned", "_marker", "_standardTitle"];

				_targetPos = _targetObject;
				if (_targetPos isEqualTo objNull) then
				{
					_targetPos = _module;
				};
				if (not isNull _task) then
				{
					_targetPos = taskDestination _task;
				};

				_marker setMarkerPosLocal _targetPos;
			};
			default { };
		};
	} forEach fnf_updateMarkerList;
}, 1] call CBA_fnc_addPerFrameHandler;
