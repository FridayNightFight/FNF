/*
	Author: Mallen

	Description:
		init a Capture sector objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: INTEGER -	The index of the objective to intialise

	Returns:
		None
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_createTask = {
	params["_objType", "_module", "_objectiveIndex", "_preRequisiteIndexs", "_alliedTask"];

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
	_taskTitle = format["%1: Defend the Sector", (_objectiveIndex + 1)];
	if (_objType isEqualTo "cap") then
	{
		_taskTitle = format["%1: Capture the Sector", (_objectiveIndex + 1)];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "defend";
	_descriptionPointTwo = "the Sector cannot be allowed to be captured<br/><br/>";
	_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";

	//if obj is actually attack re-write above for attack
	if (_objType isEqualTo "cap") then
	{
		_futureTask setSimpleTaskType "meet";
		_descriptionPointTwo = "the Sector must be captured<br/><br/>";

		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
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
		_objType = _module getVariable ["fnf_objectiveType", "cap"];
		_syncedObjects = synchronizedObjects _module;

		//get relevant objects synced to module
		_sequentialPlannersAssigned = [];
		{
			_typeOfObject = typeOf _x;

			if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
			{
				_sequentialPlannersAssigned pushBack _x;
			};
		} forEach _syncedObjects;

		//check status of sequential planners and what must be done
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned] call FNF_ClientSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		//set marker prefix now to be overwritten later
		_markerPrefix = format["(Inactive) Sector %1", _objectiveIndex + 1];

		//get zone prefix
		_zonePrefix = _module getVariable ["fnf_prefix", "FAILED"];

		//set many variables to be overwritten later
		_sectorCenter = [0,0,0];
		_statusSlotID = -1;
		_task = taskNull;

		switch (_objStateToUse) do {
			case 1: {
				//get all markers with _zonePrefix
				_markerPosArray = [];

				_markerCounter = 1;
				//get all marker positions by seeing if i can create the marker, if i cant it exists
				while {createMarkerLocal [(_zonePrefix + (str _markerCounter)), player] isEqualTo ""} do
				{
					_markerPos = getMarkerPos (_zonePrefix + (str _markerCounter));

					_markerPosArray pushBack _markerPos;

					_markerCounter = _markerCounter + 1;
				};

				//remove the last marker that is created while checking
				deleteMarkerLocal (_zonePrefix + (str _markerCounter));

				//calculate center of future zone
				_sectorCenter = [_markerPosArray] call FNF_ClientSide_fnc_calculateVisualCenter;
			};
			case 2: {
				//create task
				_futureTask = [_objType, _module, _objectiveIndex, _preRequisiteIndexs, _alliedTask] call _createTask;
				[_futureTask, false] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//create Zone
				_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
				if (not _result) then
				{
					_resultAddZone = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
					if (not _resultAddZone) exitWith
					{
						if (fnf_debug) then
						{
							systemChat "DANGER: Capture Sector objective zone failed to be initialised, objective will NOT function";
						};
					};
				};

				//get sector center and set task location
				_sectorCenter = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
				_futureTask setSimpleTaskDestination _sectorCenter;

				//setup right side graphic for a sector being captured
				_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _objectiveIndex + 1];

				_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";

				_statusSlotID = [-1, _text, _texture, [0.5,0.5,0.5,1], 1, _sectorCenter, 0] call BIS_fnc_setMissionStatusSlot;

				_task = _futureTask;
			};
			case 3: {
				//create task
				_futureTask = [_objType, _module, _objectiveIndex, _preRequisiteIndexs, _alliedTask] call _createTask;
				[_futureTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//create Zone
				_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
				if (not _result) then
				{
					_resultAddZone = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
					if (not _resultAddZone) exitWith
					{
						if (fnf_debug) then
						{
							systemChat "DANGER: Capture Sector objective zone failed to be initialised, objective will NOT function";
						};
					};
				};

				//get sector center and set task location
				_sectorCenter = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
				_futureTask setSimpleTaskDestination _sectorCenter;

				//setup right side graphic for a sector being captured
				_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _objectiveIndex + 1];

				_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";

				//colour is black as watch should grab it
				_statusSlotID = [-1, _text, _texture, [0,0,0,1], 1, _sectorCenter, 0] call BIS_fnc_setMissionStatusSlot;

				_task = _futureTask;

				_markerPrefix = format["Sector %1", _objectiveIndex + 1];
			};
			default { };
		};

		//create center object used in spectator view
		_centerObject = 'AreaMarker_01_F' createVehicleLocal _sectorCenter;
		_centerObject hideObject true;

		//create spectator marker and hide it if not in spectator
		_marker = createMarkerLocal [format["FNF_LOCAL%1:OBJ", _objectiveIndex], _sectorCenter];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerTextLocal _markerPrefix;
		_marker setMarkerAlphaLocal 0;
		if (ace_spectator_isSet) then
		{
			_marker setMarkerAlphaLocal 1;
		};

		//compile code to run on completion
		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_objectives set [_objectiveIndex, [_objStateToUse, _module, _task, _alliedTask, _codeOnCompletion, [_zonePrefix, _centerObject, _marker, _statusSlotID]]];
	};
	//Obj has been created but is not known
	case 1: {
		_objType = _module getVariable ["fnf_objectiveType", "des"];
		_params params ["_zonePrefix", "_centerObject", "_marker", "_statusSlotID"];

		//create task
		_futureTask = [_objType, _module, _objectiveIndex, [], _alliedTask] call _createTask;
		[_futureTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

		//change marker text to show active
		_marker setMarkerTextLocal format["(Active) Sector %1", _objectiveIndex + 1];

		//create Zone
		_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
		if (not _result) then
		{
			_resultAddZone = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
			if (not _resultAddZone) exitWith
			{
				if (fnf_debug) then
				{
					systemChat "DANGER: Capture Sector objective zone failed to be initialised, objective will NOT function";
				};
			};
		};

		_futureTask setSimpleTaskDestination (getPos _centerObject);

		fnf_objectives set [_objectiveIndex, [3, _module, _futureTask, _alliedTask, _codeOnCompletion, [_zonePrefix, _centerObject, _marker, _statusSlotID]]];
	};
	//Obj has been created and is known
	case 2: {
		[_task, true] call FNF_ClientSide_fnc_editTaskInTaskControl;
		_params params ["_zonePrefix", "_centerObject", "_marker", "_statusSlotID"];

		//change marker text to show active
		_marker setMarkerTextLocal format["(Active) Destroy %1", _objectiveIndex + 1];

		fnf_objectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, _params]];
	};
	default { };
};
