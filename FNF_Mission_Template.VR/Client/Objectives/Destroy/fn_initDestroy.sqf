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

	//if parent task for ally tasks doesnt exist and its needed create it
	if (isNil "fnf_allyTasksParentTask" and _alliedTask) then
	{
		fnf_allyTasksParentTask = player createSimpleTask ["Ally Tasks"];
		fnf_allyTasksParentTask setSimpleTaskType "documents";
	};

	//change pre-set items based on ally or normal OBJ
	_parentTask = fnf_myTasksParentTask;
	_customTitle = _module getVariable ["fnf_customObjectiveTitle", ""];
	_customTaskDescription = _module getVariable ["fnf_customObjectiveDescription", ""];
	_descriptionPointOne = "<t>To complete this objective, ";
	if (_alliedTask) then
	{
		_parentTask = fnf_allyTasksParentTask;
		_customTitle = _module getVariable ["fnf_customObjectiveAlliedTitle", ""];
		_customTaskDescription = _module getVariable ["fnf_customObjectiveAlliedDescription", ""];
		_descriptionPointOne = "<t>For your allies to complete this objective, ";
	};

	//get task title
	_taskTitle = format["%1: Defend the %2", (_objectiveIndex + 1), _targetName];
	if (_objType isEqualTo "des") then
	{
		_taskTitle = format["%1: Destroy the %2", (_objectiveIndex + 1), _targetName];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "defend";
	_descriptionPointTwo = format["the %1 cannot be allowed to be destroyed<br/><br/>", _targetName];
	_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
	if (count _hidingZonesAssigned isNotEqualTo 0) then
	{
		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above, the objective can be hidden in one of the hiding zones provided";
	};

	//if obj is actually attack re-write above for attack
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

	//if there are any prerequisites then collect and put them in nice words
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

	//final description joining and overwriting
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

		//get relevant objects synced to module
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

		//check status of sequential planners and what must be done
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned] call FNF_ClientSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		//set marker prefix now to be overwritten later
		_markerPrefix = format["(Inactive) Destroy %1", _objectiveIndex + 1];

		_task = taskNull;

		switch (_objStateToUse) do {
			case 2: {
				//create task
				_futureTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createTask;
				[_futureTask, false] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//hide object if it must be hidden
				if (count _hidingZonesAssigned isEqualTo 0) then
				{
					_futureTask setSimpleTaskTarget [_targetObject, true];
				} else {
					if (_objType isEqualTo "des") then
					{
						_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
						[_targetObject, _futureTask, _zoneKnown, _hidingZonesAssigned] call FNF_ClientSide_fnc_addObjectToHide;
					} else {
						_futureTask setSimpleTaskTarget [_targetObject, true];

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
				};

				//set task to the new task
				_task = _futureTask;
			};
			case 3: {
				//create task
				_futureTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createTask;
				[_futureTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//hide object if it must be hidden
				if (count _hidingZonesAssigned isEqualTo 0) then
				{
					_futureTask setSimpleTaskTarget [_targetObject, true];
				} else {
					if (_objType isEqualTo "des") then
					{
						_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
						[_targetObject, _futureTask, _zoneKnown, _hidingZonesAssigned] call FNF_ClientSide_fnc_addObjectToHide;
					} else {
						_futureTask setSimpleTaskTarget [_targetObject, true];

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
				};

				//change marker prefix as not a seq OBJ
				_markerPrefix = format["Destroy %1", _objectiveIndex + 1];;

				//set task to the new task
				_task = _futureTask;
			};
			default { };
		};

		//create spectator marker and hide it if not in spectator
		_marker = createMarkerLocal [format["FNF_LOCAL%1:OBJ", _objectiveIndex], _targetObject];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerTextLocal _markerPrefix;
		_marker setMarkerAlphaLocal 0;
		if (ace_spectator_isSet) then
		{
			_marker setMarkerAlphaLocal 1;
		};

		//add objective to be watched by update marker list system
		fnf_updateMarkerList pushBack _objectiveIndex;

		//compile code to run on completion
		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_objectives set [_objectiveIndex, [_objStateToUse, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _marker]]];
	};
	//Obj has been created but is not known
	case 1: {
		_objType = _module getVariable ["fnf_objectiveType", "des"];
		_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

		//create task
		_futureTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, [], _alliedTask] call _createTask;
		[_futureTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

		//change marker text to show active
		_marker setMarkerTextLocal format["(Active) Destroy %1", _objectiveIndex + 1];

		//hide object if it must be hidden
		if (count _hidingZonesAssigned isEqualTo 0) then
		{
			_futureTask setSimpleTaskTarget [_targetObject, true];
		} else {
			if (_objType isEqualTo "des") then
			{
				_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
				[_targetObject, _futureTask, _zoneKnown, _hidingZonesAssigned] call FNF_ClientSide_fnc_addObjectToHide;
			} else {
				_futureTask setSimpleTaskTarget [_targetObject, true];

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
		};

		fnf_objectives set [_objectiveIndex, [3, _module, _futureTask, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _marker]]];
	};
	//Obj has been created and is known
	case 2: {
		[_task, true] call FNF_ClientSide_fnc_editTaskInTaskControl;
		_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

		//change marker text to show active
		_marker setMarkerTextLocal format["(Active) Destroy %1", _objectiveIndex + 1];

		fnf_objectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, _params]];
	};
	default { };
};

