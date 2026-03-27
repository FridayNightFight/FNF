/*
	Author: Mallen

	Description:
		init a steal objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: INTEGER -	The index of the objective to intialise

	Returns:
		None
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_createParentTask = {
	params["_objType", "_module", "_objectiveIndex", "_targetObject", "_hidingZonesAssigned", "_preRequisiteIndexs", "_alliedTask"];

	//get objects name and picture
	_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
	_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
	_targetName = getText (_targetConfig >> "DisplayName");

	//if parent task for my tasks doesnt exist create it
	if ((isNil "fnf_myTasksParentTask") and not fnf_SpectatorSlotUsed) then
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

	_parentTask = taskNull;

	//change pre-set items based on ally or normal OBJ
	if (not fnf_SpectatorSlotUsed) then
	{
		_parentTask = fnf_myTasksParentTask;
	};
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

	if (fnf_SpectatorSlotUsed) then
	{
		_parentTask = [_module] call FNF_ClientSide_fnc_getSpectatorParentTask;
	};

	//get task title
	_taskTitle = format["%1: Guard the %2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber), _targetName];
	if (_objType isEqualTo "stl") then
	{
		_taskTitle = format["%1: Steal the %2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber), _targetName];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "whiteboard";
	_descriptionPointTwo = format["the %1 cannot be stolen and taken to the drop-off zone<br/><br/>", _targetName];
	_helperString = format["The location of the objective is marked on your map, or you can find it by hitting the 'Locate' buttons in tasks %1.1 and %1.2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber)];
	if (count _hidingZonesAssigned isNotEqualTo 0) then
	{
		_helperString = format["The location of the objective is marked on your map, or you can find it by hitting the 'Locate' buttons in tasks %1.1 and %1.2, the objective can be hidden in one of the hiding zones provided", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber)];
	};

	//if obj is actually attack re-write above for attack
	if (_objType isEqualTo "stl") then
	{
		_futureTask setSimpleTaskType "truck";
		_descriptionPointTwo = format["the %1 must be stolen and taken to the drop-off zone<br/><br/>", _targetName];

		_helperString = format["The location of the objective is marked on your map, or you can find it by hitting the 'Locate' buttons in tasks %1.1 and %1.2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber)];
		if (count _hidingZonesAssigned isNotEqualTo 0) then
		{
			_helperString = format["The location of the objective may be in a hiding zone, if it is, the zone it is hidden in is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' buttons in tasks %1.1 and %1.2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber)];
			_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
			if (not _zoneKnown) then
			{
				_helperString = format["The location of the objective may be in a hiding zone, if it is, you will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on your map, or you can find it by hitting the 'Locate' buttons in tasks %1.1 and %1.2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber)];
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

_createChildTaskTarget = {
	params["_objType", "_module", "_objectiveIndex", "_targetObject", "_hidingZonesAssigned", "_preRequisiteIndexs", "_alliedTask", "_parentTask"];

	//get objects name and picture
	_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
	_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
	_targetName = getText (_targetConfig >> "DisplayName");

	//change pre-set items based on ally or normal OBJ
	_customTitle = _module getVariable ["fnf_customObjectiveTitleTarget", ""];
	_customTaskDescription = _module getVariable ["fnf_customObjectiveDescriptionTarget", ""];
	_descriptionPointOne = "<t>To complete this objective, ";
	if (_alliedTask) then
	{
		_customTitle = _module getVariable ["fnf_customObjectiveAlliedTitleTarget", ""];
		_customTaskDescription = _module getVariable ["fnf_customObjectiveAlliedDescriptionTarget", ""];
		_descriptionPointOne = "<t>For your allies to complete this objective, ";
	};

	//get task title
	_taskTitle = format["%1.1: Keep the %2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber), _targetName];
	if (_objType isEqualTo "stl") then
	{
		_taskTitle = format["%1.1: Take the %2", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber), _targetName];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "scout";
	_descriptionPointTwo = format["the %1 cannot be taken<br/><br/>", _targetName];
	_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
	if (count _hidingZonesAssigned isNotEqualTo 0) then
	{
		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above, the objective can be hidden in one of the hiding zones provided";
	};

	//if obj is actually attack re-write above for attack
	if (_objType isEqualTo "stl") then
	{
		_futureTask setSimpleTaskType "container";
		_descriptionPointTwo = format["the %1 must be taken<br/><br/>", _targetName];

		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";
		if (count _hidingZonesAssigned isNotEqualTo 0) then
		{
			_helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden in is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' button above";
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

_createChildTaskDropOff = {
	params["_objType", "_module", "_objectiveIndex", "_targetObject", "_preRequisiteIndexs", "_alliedTask", "_parentTask"];

	//get objects name and picture
	_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
	_targetName = getText (_targetConfig >> "DisplayName");

	//change pre-set items based on ally or normal OBJ
	_customTitle = _module getVariable ["fnf_customObjectiveTitleTarget", ""];
	_customTaskDescription = _module getVariable ["fnf_customObjectiveDescriptionTarget", ""];
	_descriptionPointOne = "<t>To complete this objective, ";
	if (_alliedTask) then
	{
		_customTitle = _module getVariable ["fnf_customObjectiveAlliedTitleTarget", ""];
		_customTaskDescription = _module getVariable ["fnf_customObjectiveAlliedDescriptionTarget", ""];
		_descriptionPointOne = "<t>For your allies to complete this objective, ";
	};

	//get task title
	_taskTitle = format["%1.2: Prevent the %2 from getting to the drop-off", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber), _targetName];
	if (_objType isEqualTo "stl") then
	{
		_taskTitle = format["%1.2: Move the %2 to the drop-off", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber), _targetName];
	};
	if (_customTitle isNotEqualTo "") then
	{
		_taskTitle = _customTitle;
	};

	//create task
	_futureTask = player createSimpleTask [_taskTitle, _parentTask];

	//set descriptions and task type based on defend OBJ
	_futureTask setSimpleTaskType "run";
	_descriptionPointTwo = format["the %1 cannot be transported to the drop-off zone<br/><br/>", _targetName];
	_helperString = "The location of the drop-off zone is marked on your map, or you can find it by hitting the 'Locate' button above";

	//if obj is actually attack re-write above for attack
	if (_objType isEqualTo "stl") then
	{
		_futureTask setSimpleTaskType "navigate";
		_descriptionPointTwo = format["the %1 must be transported to the drop-off zone<br/><br/>", _targetName];

		_helperString = "The location of the drop-off zone is marked on your map, or you can find it by hitting the 'Locate' button above";
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
		_objType = _module getVariable ["fnf_objectiveType", "stl"];
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
					systemChat "WARNING: Steal objective has more than one possible objects as target";
				};
			};
		} forEach _syncedObjects;

		//check status of sequential planners and what must be done
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned] call FNF_ClientSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		//get zone prefix
		_zonePrefix = _module getVariable ["fnf_prefix", "FAILED"];

		_sectorCenter = [0,0,0];
		_parentTask = taskNull;
		_childTaskTarget = taskNull;
		_childTaskDropOff = taskNull;

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
				//create tasks
				_futureParentTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createParentTask;
				[_futureparentTask, false] call FNF_ClientSide_fnc_addTaskToTaskControl;

				_futureChildTaskTarget = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask, _futureParentTask] call _createChildTaskTarget;
				[_futureChildTaskTarget, false] call FNF_ClientSide_fnc_addTaskToTaskControl;

				_futureChildTaskDropOff = [_objType, _module, _objectiveIndex, _targetObject, _preRequisiteIndexs, _alliedTask, _futureParentTask] call _createChildTaskDropOff;
				[_futureChildTaskDropOff, false] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//create Zone
				_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
				if (not _result) then
				{
					_resultAddZone = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
					if (not _resultAddZone) exitWith
					{
						if (fnf_debug) then
						{
							systemChat "DANGER: Steal objective zone failed to be initialised, objective will NOT function";
						};
					};
				};

				//get sector center and set child task location
				_sectorCenter = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
				_futureChildTaskDropOff setSimpleTaskDestination _sectorCenter;

				//hide object if it must be hidden
				if (count _hidingZonesAssigned isEqualTo 0) then
				{
					_futureChildTaskTarget setSimpleTaskTarget [_targetObject, true];
				} else {
					if (_objType isEqualTo "stl") then
					{
						_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
						[_targetObject, _futureChildTaskTarget, _zoneKnown, _hidingZonesAssigned] call FNF_ClientSide_fnc_addObjectToHide;
					} else {
						_futureChildTaskTarget setSimpleTaskTarget [_targetObject, true];

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

				//set tasks to the new tasks
				_parentTask = _futureParentTask;
				_childTaskTarget = _futureChildTaskTarget;
				_childTaskDropOff = _futureChildTaskDropOff;
			};
			case 3: {
				//create tasks
				_futureParentTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask] call _createParentTask;
				[_futureparentTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

				_futureChildTaskTarget = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, _preRequisiteIndexs, _alliedTask, _futureParentTask] call _createChildTaskTarget;
				[_futureChildTaskTarget, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

				_futureChildTaskDropOff = [_objType, _module, _objectiveIndex, _targetObject, _preRequisiteIndexs, _alliedTask, _futureParentTask] call _createChildTaskDropOff;
				[_futureChildTaskDropOff, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

				//create Zone
				_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
				if (not _result) then
				{
					_resultAddZone = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
					if (not _resultAddZone) exitWith
					{
						if (fnf_debug) then
						{
							systemChat "DANGER: Steal objective zone failed to be initialised, objective will NOT function";
						};
					};
				};

				//get sector center and set child task location
				_sectorCenter = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
				_futureChildTaskDropOff setSimpleTaskDestination _sectorCenter;

				//hide object if it must be hidden
				if (count _hidingZonesAssigned isEqualTo 0) then
				{
					_futureChildTaskTarget setSimpleTaskTarget [_targetObject, true];
				} else {
					if (_objType isEqualTo "stl") then
					{
						_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
						[_targetObject, _futureChildTaskTarget, _zoneKnown, _hidingZonesAssigned] call FNF_ClientSide_fnc_addObjectToHide;
					} else {
						_futureChildTaskTarget setSimpleTaskTarget [_targetObject, true];

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

				//set tasks to the new tasks
				_parentTask = _futureParentTask;
				_childTaskTarget = _futureChildTaskTarget;
				_childTaskDropOff = _futureChildTaskDropOff;
			};
			default { };
		};

		//compile code to run on completion
		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_objectives set [_objectiveIndex, [_objStateToUse, _module, _parentTask, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _zonePrefix, [_childTaskTarget, _childTaskDropOff]]]];
	};
	//Obj has been created but is not known
	case 1: {
		_objType = _module getVariable ["fnf_objectiveType", "stl"];
		_params params ["_targetObject", "_hidingZonesAssigned", "_zonePrefix"];

		//create tasks
		_futureParentTask = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, [], _alliedTask] call _createParentTask;
		[_futureparentTask, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

		_futureChildTaskTarget = [_objType, _module, _objectiveIndex, _targetObject, _hidingZonesAssigned, [], _alliedTask, _futureParentTask] call _createChildTaskTarget;
		[_futureChildTaskTarget, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

		_futureChildTaskDropOff = [_objType, _module, _objectiveIndex, _targetObject, [], _alliedTask, _futureParentTask] call _createChildTaskDropOff;
		[_futureChildTaskDropOff, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

		//create Zone
		_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
		if (not _result) then
		{
			_resultAddZone = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
			if (not _resultAddZone) exitWith
			{
				if (fnf_debug) then
				{
					systemChat "DANGER: Steal objective zone failed to be initialised, objective will NOT function";
				};
			};
		};

		//get sector center and set child task location
		_sectorCenter = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
		_futureChildTaskDropOff setSimpleTaskDestination _sectorCenter;

		//hide object if it must be hidden
		if (count _hidingZonesAssigned isEqualTo 0) then
		{
			_futureChildTaskTarget setSimpleTaskTarget [_targetObject, true];
		} else {
			if (_objType isEqualTo "stl") then
			{
				_zoneKnown = _module getVariable ["fnf_zoneKnown", true];
				[_targetObject, _futureChildTaskTarget, _zoneKnown, _hidingZonesAssigned] call FNF_ClientSide_fnc_addObjectToHide;
			} else {
				_futureChildTaskTarget setSimpleTaskTarget [_targetObject, true];

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

		fnf_objectives set [_objectiveIndex, [3, _module, _futureParentTask, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _zonePrefix, [_childTaskTarget, _childTaskDropOff]]]];
	};
	//Obj has been created and is known
	case 2: {
		[_task, true] call FNF_ClientSide_fnc_editTaskInTaskControl;
		_params params ["_targetObject", "_hidingZonesAssigned", "_zonePrefix", "_childTasks"];
		_childTasks params ["_childTaskTarget", "_childTaskDropOff"];

		[_childTaskTarget, true] call FNF_ClientSide_fnc_editTaskInTaskControl;
		[_childTaskDropOff, true] call FNF_ClientSide_fnc_editTaskInTaskControl;

		fnf_objectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, _params]];
	};
	default { };
};

