/*
	Author: Mallen

	Description:
		init a destroy objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: INTEGER -	The index of the objective to intialise

	Returns:
		None
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_createTask = {
	params["_objType", "_module", "_objectiveIndex", "_targetObject", "_hidingZonesAssigned", "_preRequisiteIndexs", "_alliedTask"];

	//get objects name and picture
	_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
	_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
	_targetName = getText (_targetConfig >> "DisplayName");

	//if parent task for my tasks doesnt exist create it
	if (isNil "fnf_myTasksParentTask") then
	{
		fnf_myTasksParentTask = player createSimpleTask ["My Tasks"];
		fnf_myTasksParentTask setSimpleTaskType "documents";
	};

	_parentTask = fnf_myTasksParentTask;
	_customTitle = _module getVariable ["fnf_customObjectiveTitle", ""];
	_customTaskDescription = _module getVariable ["fnf_customObjectiveDescription", ""];
	_descriptionPointOne = "<t>To complete this objective, ";

	_taskTitle = format["%1: Defend the %2", (_objectiveIndex + 1), _targetName];
	if (_objType isEqualTo "des") then
	{
		_taskTitle = format["%1: Destroy the %2", (_objectiveIndex + 1), _targetName];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	_futureTask setSimpleTaskType "defend";
	_descriptionPointTwo = format["the %1 cannot be allowed to be destroyed<br/><br/>", _targetName];
	_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
	if (count _hidingZonesAssigned isNotEqualTo 0) then
	{
		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above, the objective can be hidden in one of the hiding zones provided";
	};
	if (_objType isEqualTo "des") then
	{
		_futureTask setSimpleTaskType "destroy";
		_descriptionPointTwo = format["the %1 must be destroyed<br/><br/>", _targetName];

		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
		if (count _hidingZonesAssigned isNotEqualTo 0) then
		{
			_helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' button above";
			_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
			if (not _zoneKnown) then
			{
				_helperString = "The location of the objective may be in a hiding zone, if it is, you will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on your map, or you can find it by hitting the 'Locate' button above";
			};
		};
	};

	_preRequisiteText = "";
	if (count _preRequisiteIndexs isNotEqualTo 0) then
	{
		_preRequisiteText = format["<br/><br/>This objective will be activated after objective %1 has been completed", ((_preRequisiteIndexs select 0) + 1)];
		if (count _preRequisiteIndexs isEqualTo 2) then
		{
			_preRequisiteText = format["<br/><br/>This objective will be activated after objectives %1 and %2 have been completed", ((_preRequisiteIndexs select 0) + 1), ((_preRequisiteIndexs select 1) + 1)];
		};
		if (count _preRequisiteIndexs > 2) then
		{
			_preRequisiteArray = ["<br/><br/>This objective will be activated after objectives "];
			{
				_preRequisiteArray pushBack (format["%1, ", _x + 1]);
			} forEach _preRequisiteIndexs;
			_preRequisiteArray set [-1, (format["and %1 ", ((_preRequisiteIndexs select -1) + 1)])];
			_preRequisiteArray pushBack "have been completed";
			_preRequisiteText = _preRequisiteArray joinString "";
		};
	};

	_taskDescription = [(format["<img width='300' image='%1'/><br/><br/>", _targetPic]), _descriptionPointOne, _descriptionPointTwo, _helperString, _preRequisiteText] joinString "";
	if (_customTaskDescription isNotEqualTo "") then
	{
		_taskDescription = _customTaskDescription;
	};

	_futureTask setSimpleTaskDescription [_taskDescription, _taskTitle, _taskTitle];
	_futureTask;
};

switch (_objState) do {
	//Obj has in no way been created
	case 0: {
		_objType = _module getVariable ["fnf_objectiveType", "des"];
		_syncedObjects = synchronizedObjects _module;

		_hidingZonesAssigned = [];
		_sequentialPlannersAssigned = [];
		_targetObject = objNull;
		{
			_typeOfObject = typeOf _x;
			if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F") then
			{
				continue;
			};

			if (_typeOfObject isEqualTo "fnf_module_hidingZone") then
			{
				_hidingZonesAssigned pushBack _x;
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
			} else {
				if (fnf_debug) then
				{
					systemChat "WARNING: Destroy objective has more than one possible objects as target";
				};
			};
		} forEach _syncedObjects;

		//[objStateToUse, [PreRequisuteIndexs]]
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned, false] call FNF_ClientSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		if (_objStateToUse isEqualTo 1) then {_objStateToUse = 2;};

		//programatically check if objective is secondary OBJ module and first should be watched
		_isSecondaryObj = [_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective;

		_markerPrefix = "(Inactive) Destroy OBJ";

		_task = taskNull;

		_futureTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createTask;

		//hide object
		_futureTask setSimpleTaskTarget [_targetObject, true];
		if (count _hidingZonesAssigned isNotEqualTo 0) then
		{
			{
				_prefix = _x getVariable ["fnf_prefix", "FAILED"];

				if (_prefix isEqualTo "FAILED") then
				{
					if (fnf_debug) then
					{
						systemChat "WARNING: Hiding zone does not have a valid zone prefix and will not function";
					};
					continue;
				};

				_result = [_prefix] call FNF_ClientSide_fnc_verifyZone;
				if (not _result) then
				{
					[_prefix, "", true, false] call FNF_ClientSide_fnc_addZone;
				};
			} forEach _hidingZonesAssigned;
		};

		_task = _futureTask;

		if (_objStateToUse isEqualTo 3) then
		{
			_markerPrefix = "Destroy OBJ";
		};

		_marker = createMarkerLocal [format["FNF_LOCAL%1:DestroyOBJ", _objectiveIndex], _targetObject];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerTextLocal _markerPrefix;
		_marker setMarkerAlphaLocal 0;
		if (_isSecondaryObj) then
		{
			_marker setMarkerAlphaLocal 1;
		};

		fnf_updateMarkerList pushBack _objectiveIndex;

		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_objectives set [_objectiveIndex, [_objStateToUse, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _marker]]];
	};
	//Obj has been created and is known
	case 2: {
		_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
		_marker setMarkerTextLocal "(Active) Destroy OBJ";
		fnf_objectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, _params]];
	};
	default { };
};

