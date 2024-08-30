/*
	Author: Mallen

	Description:
		init a terminal objective including setting up local watch, local task control, local ordering enforcement, and breifing data

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
	_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Land_DataTerminal_01_F.jpg"] call CBA_fnc_getConfigEntry;

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
	_taskTitle = format["%1: Defend the Terminal", (_objectiveIndex + 1)];
	if (_objType isEqualTo "hck") then
	{
		_taskTitle = format["%1: Hack the Terminal", (_objectiveIndex + 1)];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	_hackingTime = _module getVariable ["fnf_hackingTime", 120];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "defend";
	_descriptionPointTwo = format["the terminal cannot be hacked by enemy forces, a hack will take %1 seconds<br/><br/>", _hackingTime];
	_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
	if (count _hidingZonesAssigned isNotEqualTo 0) then
	{
		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above, the objective can be hidden in one of the hiding zones provided";
	};

	//if obj is actually attack re-write above for attack
	if (_objType isEqualTo "hck") then
	{
		_futureTask setSimpleTaskType "upload";
		_descriptionPointTwo = format["the terminal must be hacked, a hack will take %1 seconds<br/><br/>", _hackingTime];;

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

_initActions = {
	params["_targetObject", "_module", "_objType"];

	_hackingTime = _module getVariable ["fnf_hackingTime", 120];

	//change distance of action based on object type
	_objectType = typeOf _targetObject;
	_actionRange = "4";
	if (_objectType isEqualTo "RuggedTerminal_01_communications_hub_F") then
	{
		_actionRange = "10";
	};

	_actionStayCondition = format["_caller distance _target < %1", _actionRange];

	//set action title and condition to show based on defend
	_actionTitle = "Cancel Hack";
	_actionCondition = format["(_this distance _target < %1) && ((_target getVariable ['fnf_currentlyHackingCompletionTime', -1]) isNotEqualTo -1)", _actionRange];

	//edit if on attack
	if (_objType isEqualTo "hck") then
	{
		_actionTitle = "Start Hack";
		_actionCondition = format["(_this distance _target < %1) && ((_target getVariable ['fnf_currentlyHackingSide', sideUnknown]) isNotEqualTo playerSide) && not ([playerSide, (_target getVariable ['fnf_currentlyHackingSide', sideUnknown])] call BIS_fnc_sideIsFriendly)", _actionRange];
	};

	//add action to object
	[
		_targetObject,
		_actionTitle,
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
		_actionCondition,
		_actionStayCondition,
		{},
		{},
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[[(_arguments select 0), (_arguments select 1), playerSide, false], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
		},
		{},
		[_targetObject, _hackingTime],
		2,
		0,
		false,
		false
	] call BIS_fnc_holdActionAdd;
};

_initColors = {
	params["_targetObject", "_objType"];

	//check object type is one where colours can change
	_objectType = typeOf _targetObject;
	if (_objectType isNotEqualTo "Land_DataTerminal_01_F") exitWith {};

	//if on defend set terminal colours to your colours
	switch (playerSide) do {
		case west:
		{
			[_targetObject, "blue", "blue", "blue"] call BIS_fnc_dataTerminalColor;
		};
		case east:
		{
			[_targetObject, "red", "red", "red"] call BIS_fnc_dataTerminalColor;
		};
		case independent:
		{
			[_targetObject, "green", "green", "green"] call BIS_fnc_dataTerminalColor;
		};
		default {};
	};

	//if attacking set to unknown
	if (_objType isEqualTo "hck") then
	{
		[_targetObject, "orange", "orange", "orange"] call BIS_fnc_dataTerminalColor;
	};
};

switch (_objState) do {
	//Obj has in no way been created
	case 0: {
		_objType = _module getVariable ["fnf_objectiveType", "hck"];
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
					systemChat "WARNING: Terminal objective has more than one possible objects as target";
				};
			};
		} forEach _syncedObjects;

		//check status of sequential planners and what must be done
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned] call FNF_ClientSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		//set whether marker to be shown (overwritten later)
		_showMarker = false;
		[_targetObject, _objType] call _initColors;

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
					if (_objType isEqualTo "hck") then
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
				_showMarker = true;
			};
			case 3: {
				//create task
				_futureTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createTask;
				[_futureTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//add actions to the object to allow hacking
				[_targetObject, _module, _objType] call _initActions;

				//hide object if it must be hidden
				if (count _hidingZonesAssigned isEqualTo 0) then
				{
					_futureTask setSimpleTaskTarget [_targetObject, true];
				} else {
					if (_objType isEqualTo "hck") then
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
				_showMarker = true;
			};
			default { };
		};

		//get where the objective is, preferabley based on task
		_targetLocation = _targetObject;

		if (not isNull _task) then
		{
			_targetLocation = taskDestination _task;
		};

		//create timer marker and hide it if told to (will be overwritten in watch)
		_marker = createMarkerLocal [format["FNF_LOCAL%1:OBJ", _objectiveIndex], _targetLocation];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerTextLocal format["(Inactive) Terminal %1", _objectiveIndex + 1];;
		if (not _showMarker) then
		{
			_marker setMarkerAlphaLocal 0;
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
		_objType = _module getVariable ["fnf_objectiveType", "hck"];
		_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

		//create task
		_futureTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, [], _alliedTask] call _createTask;
		[_futureTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

		//add actions to the object to allow hacking
		[_targetObject, _module, _objType] call _initActions;

		//hide object if it must be hidden
		if (count _hidingZonesAssigned isEqualTo 0) then
		{
			_futureTask setSimpleTaskTarget [_targetObject, true];
		} else {
			if (_objType isEqualTo "hck") then
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

		//make sure timer marker is shown
		_marker setMarkerAlphaLocal 1;

		fnf_objectives set [_objectiveIndex, [3, _module, _futureTask, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _marker]]];
	};
	//Obj has been created and is known
	case 2: {
		[_task, true] call FNF_ClientSide_fnc_editTaskInTaskControl;
		_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

		//add actions to the object to allow hacking
		[_targetObject, _module, _objType] call _initActions;

		fnf_objectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, _params]];
	};
	default { };
};
