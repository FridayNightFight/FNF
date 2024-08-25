/*
	Author: Mallen

	Description:
		init an Assassin objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: INTEGER -	The index of the objective to intialise

	Returns:
		None
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_createTask = {
	params["_objType", "_module", "_objectiveIndex", "_hidingZonesAssigned", "_preRequisiteIndexs", "_alliedTask"];

	//if parent task for my tasks doesnt exist create it
	if (isNil "fnf_myTasksParentTask") then
	{
		fnf_myTasksParentTask = player createSimpleTask ["My Tasks"];
		fnf_myTasksParentTask setSimpleTaskType "documents";
	};

	//change pre-set items based on ally or normal OBJ
	_parentTask = fnf_myTasksParentTask;
	_customTitle = _module getVariable ["fnf_customObjectiveTitle", ""];
	_customTaskDescription = _module getVariable ["fnf_customObjectiveDescription", ""];
	_descriptionPointOne = "<t>To complete this objective, ";

	//get task title
	_targetName = _module getVariable ["fnf_targetName", "the VIP"];
	_taskTitle = format["%1: Defend %2", (_objectiveIndex + 1), _targetName];
	if (_objType isEqualTo "elm") then
	{
		_taskTitle = format["%1: Assassinate %2", (_objectiveIndex + 1), _targetName];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "defend";
	_descriptionPointTwo = format["%1 cannot be assassinated<br/><br/>", _targetName];
	_helperString = format["The location of %1 is marked on your map, or you can find it by hitting the 'Locate' button above", _targetName];
	if (count _hidingZonesAssigned isNotEqualTo 0) then
	{
		_helperString = format["The location of %1 is marked on your map, or you can find it by hitting the 'Locate' button above, %1 can be hidden in one of the hiding zones provided", _targetName];
	};

	//if obj is actually attack re-write above for attack
	if (_objType isEqualTo "elm") then
	{
		_futureTask setSimpleTaskType "kill";
		_descriptionPointTwo = format["%1 must be assassinated<br/><br/>", _targetName];

		_helperString = format["The location of %1 is marked on your map, or you can find it by hitting the 'Locate' button above", _targetName];
		if (count _hidingZonesAssigned isNotEqualTo 0) then
		{
			_helperString = format["The location of %1 may be in a hiding zone, if they are, the zone they are hidden in is marked on your map, if they aren't, %1s exact location is marked instead, in either case you can find it by hitting the 'Locate' button above", _targetName];
			_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
			if (not _zoneKnown) then
			{
				_helperString = format["The location of %1 may be in a hiding zone, if they are, you will have to search all hiding zones to find them, if they aren't, %1s exact location is marked on your map, or you can find it by hitting the 'Locate' button above", _targetName];
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
	_taskDescription = [_descriptionPointOne, _descriptionPointTwo, _helperString, _preRequisiteText] joinString "";
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
		_objType = _module getVariable ["fnf_objectiveType", "elm"];
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

			if (_targetObject isEqualTo objNull and not _x isKindOf "Man") then
			{
				_targetObject = _x;
			};
		} forEach _syncedObjects;

		//check status of sequential planners and what must be done
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned, false] call FNF_ClientSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		if (_objStateToUse isEqualTo 1) then {_objStateToUse = 2;};

		//programatically check if objective is secondary OBJ module and first should be watched
		_isSecondaryObj = [_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective;

		//set marker prefix now to be overwritten later
		_markerPrefix = "(Inactive) Assassin OBJ";

		_standardTitle = "";

		_task = taskNull;

		//create task
		_futureTask = [_objType, _module, _objectiveIndex, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createTask;

		_taskDescArray = taskDescription _futureTask;
		_standardTitle = _taskDescArray select 1;

		//hide object if it must be hidden
		if (count _hidingZonesAssigned isNotEqualTo 0 and _objType isNotEqualTo "elm") then
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

		//set task to the new task
		_task = _futureTask;

		if (_objStateToUse isEqualTo 3) then
		{
			_markerPrefix = "Assassin OBJ";
		};

		//create spectator marker and hide it if not in spectator
		_marker = createMarkerLocal [format["FNF_LOCAL%1:OBJ", _objectiveIndex], _module];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerTextLocal _markerPrefix;
		_marker setMarkerAlphaLocal 0;
		if (_isSecondaryObj) then
		{
			_marker setMarkerAlphaLocal 1;
		};

		//add objective to be watched by update marker list system
		fnf_updateMarkerList pushBack _objectiveIndex;

		//compile code to run on completion
		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_objectives set [_objectiveIndex, [_objStateToUse, _module, _task, _alliedTask, _codeOnCompletion, [objNull /*represents no assassin target atm (found in watch code)*/, _hidingZonesAssigned, _marker, _standardTitle]]];
	};
	//Obj has been created and is known
	case 2: {
		_params params ["_targetObject", "_hidingZonesAssigned", "_marker", "_standardTitle"];

		//change marker text to show active
		_marker setMarkerTextLocal "(Active) Assassin OBJ";

		fnf_objectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, _params]];
	};
	default { };
};
