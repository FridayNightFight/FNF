/*
	Author: Mallen

	Description:
		Upgrades spectator enviroment when a player that could be reinserted cannot be anymore

	Parameter(s):
		None

	Returns:
		None
*/

[[west, east, independent, civilian], []] call ace_spectator_fnc_updateSides;
[[0,1,2], []] call ace_spectator_fnc_updateCameraModes;

//show Mission Details button
call FNF_ClientSide_fnc_missionDetailsButton;

[{!isNil "fnf_objectives"}, {

	_indexsToDrawIcon = [];

	{
		_x params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];
		_type = typeOf _module;
		//if OBJ is one without a physical object then move to next OBJ
		if (_type isEqualTo "fnf_module_sectorCaptureObj") then
		{
			continue;
		};

		if (_type isEqualTo "fnf_module_sectorHoldObj") then
		{
			continue;
		};

		if (_type isEqualTo "fnf_module_destroyObj") then
		{
			_indexsToDrawIcon pushBack _forEachIndex;
		};

		if (_type isEqualTo "fnf_module_terminalObj") then
		{
			_indexsToDrawIcon pushBack _forEachIndex;
		};

		if (_type isEqualTo "fnf_module_assassinObj") then
		{
			_indexsToDrawIcon pushBack _forEachIndex;
		};

		if (_type isEqualTo "fnf_module_stealObj") then
		{
			_indexsToDrawIcon pushBack _forEachIndex;
		};
	} forEach fnf_objectives;

	[{
		params ["_objectiveIndexs"];
		{
			_objEntry = fnf_objectives select _x;

			_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

			if (_objState > 3) then
			{
				continue;
			};

			_type = typeOf _module;
			//if OBJ is one without a physical object then move to next OBJ
			if (_type isEqualTo "fnf_module_sectorCaptureObj") then
			{
				continue;
			};

			if (_type isEqualTo "fnf_module_sectorHoldObj") then
			{
				continue;
			};

			if (_type isEqualTo "fnf_module_destroyObj") then
			{
				_params params ["_targetObject"];
				drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
			};

			if (_type isEqualTo "fnf_module_terminalObj") then
			{
				_params params ["_targetObject"];
				drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
			};

			if (_type isEqualTo "fnf_module_assassinObj") then
			{
				_params params ["_targetObject"];
				if (_targetObject isNotEqualTo objNull) then
				{
					drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
				};
			};

			if (_type isEqualTo "fnf_module_stealObj") then
			{
				_params params ["_targetObject"];
				drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
			};
		} forEach _objectiveIndexs;

		if (!ace_spectator_isSet) then
		{
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
 	}, 0, _indexsToDrawIcon] call CBA_fnc_addPerFrameHandler;

}, [], 60] call CBA_fnc_waitUntilAndExecute;
