/*
	Author: Mallen

	Description:
		init a destroy objective on server side

	Parameter(s):
		0: INTEGER -	The index of the objective to intialise

	Returns:
		None
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

switch (_objState) do {
	//Obj has in no way been created
	case 0: {
		_syncedObjects = synchronizedObjects _module;

		_sequentialPlannersAssigned = [];
		_targetObject = objNull;
		{
			_typeOfObject = typeOf _x;
			if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F") then
			{
				continue;
			};

			if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
			{
				_sequentialPlannersAssigned pushBack _x;
				continue;
			};

			if (_targetObject isEqualTo objNull) then
			{
				_targetObject = _x;
			};
		} forEach _syncedObjects;

		//[objStateToUse, [PreRequisuteIndexs]]
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned] call FNF_ServerSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		_markerPrefix = "(Inactive) Destroy OBJ";

		switch (_objStateToUse) do {
			case 1: {
				[_targetObject, false] remoteExec ["allowDamage", 0, true];
			};
			case 2: {
				[_targetObject, false] remoteExec ["allowDamage", 0, true];
			};
			case 3: {
				_markerPrefix = "Destroy OBJ";
			};
			default { };
		};

		_marker = createMarkerLocal [format["FNF_SERVER%1:OBJ", _objectiveIndex], _targetObject];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerTextLocal _markerPrefix;
		//fnf_updateMarkerList pushBack _objectiveIndex;

		if (not isDedicated) then {_marker setMarkerAlphaLocal 0};

		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_serverObjectives set [_objectiveIndex, [_objStateToUse, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject, _marker]]];
	};
	//Obj has been created but is not known
	case 1: {
		_params params ["_targetObject", "_marker"];

		_marker setMarkerTextLocal "(Active) Destroy OBJ";
		[_targetObject, true] remoteExec ["allowDamage", 0, true];

		fnf_serverObjectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject, _marker]]];
	};
	//Obj has been created and is known
	case 2: {
		_params params ["_targetObject", "_marker"];

		_marker setMarkerTextLocal "(Active) Destroy OBJ";
		[_targetObject, true] remoteExec ["allowDamage", 0, true];

		fnf_serverObjectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject, _marker]]];
	};
	default { };
};

