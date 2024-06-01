/*
	Author: Mallen

	Description:
		init a destroy objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: OBJECT -	The destroy objective module to be processed
		1: BOOLEAN -	Whether the objective is for the player, if not treat breifing and task control differently

	Returns:
		None
*/

params ["_objective", "_forPlayer"];

//get the objective type
_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_objectiveType isEqualTo "FAILED") exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective does not have objective type set, objective will NOT function";
	};
};

_syncedObjects = synchronizedObjects _objective;

//find the object thats supposed to be killed or protected
_hidingZones = [];
_sequentialObjPlanners = [];
_objectiveObject = "";
{
	_typeOfObject = typeOf _x;
	if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F") then
	{
		continue;
	};

	if (_typeOfObject isEqualTo "fnf_module_hidingZone") then
	{
		_hidingZones pushBack _x;
		continue;
	};

	if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
	{
		_sequentialObjPlanners pushBack _x;
		continue;
	};

	if (_typeOfObject isEqualTo "Land_DataTerminal_01_F" or _typeOfObject isEqualTo "RuggedTerminal_01_F" or _typeOfObject isEqualTo "RuggedTerminal_01_communications_F" or _typeOfObject isEqualTo "RuggedTerminal_02_communications_F" or _typeOfObject isEqualTo "RuggedTerminal_01_communications_hub_F") then
	{
		if (_objectiveObject isEqualTo "") then
		{
			_objectiveObject = _x;
			continue;
		} else {
			if (fnf_debug) then
			{
				systemChat "WARNING: Terminal objective has more than one possible objects as target";
			};
		};
	};

	if (fnf_debug) then
	{
		systemChat "WARNING: Terminal objective has an object that is not a Terminal synced to it";
	};
} forEach _syncedObjects;

_topRightCount = 0;
_topRightCandidate = objNull;

if (count _sequentialObjPlanners isNotEqualTo 0) then
{
	{
		_result = [_objective, _x] call FNF_ClientSide_fnc_getBottomLeft;
		if (not _result) then
		{
			_topRightCount = _topRightCount + 1;
			_topRightCandidate = _x;
		};
	} forEach _sequentialObjPlanners;
};

if (_topRightCount > 1) exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective has more than one prerequisite sequential planners, objective will NOT function";
	};
};

_sequentialInit = false;
_addSequentialHandle = false;

if (not isNull _topRightCandidate) then
{
	//check if we're initing this from the sequential planner, if we are we don't need to re-add it
	_alreadyCompletedSequentialPlanning = _topRightCandidate getVariable ["fnf_sequentialObjCompleted", false];
	if (_alreadyCompletedSequentialPlanning) then
	{
		_objKnown = _topRightCandidate getVariable ["fnf_nextObjectiveKnown", false];
		if (_objKnown) then
		{
			//obj is already known and 90% of setup is completed, lets just handle task description and task control
			//find correct task via fnf_objectives
			//edit Task Control
			//edit task description
			//this task can be completed before available as i dont wanna make someone invincible, maybe remove tracking?
		};
	} else {
		//sequential planner before we do stuff, lets figure out what needs doing....
		_objKnown = _topRightCandidate getVariable ["fnf_nextObjectiveKnown", false];
		if (not _objKnown) then
		{
			//obj is not known yet, lets exit Init and come back later
			_addSequentialHandle = true;
		};
	};
};

if (_addSequentialHandle) exitWith
{
	[_objective, _forPlayer, _topRightCandidate] call FNF_ClientSide_fnc_addSequentialHandle;
};

if (_objectiveObject isEqualTo "") exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective does not have terminal synced, objective will NOT function";
	};
};

_hackingTime = _objective getVariable ["fnf_hackingTime", "FAILED"];
if (_hackingTime isEqualTo "FAILED") exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective does not have time to complete hack set, objective will NOT function";
	};
};

if (_hackingTime isEqualTo 0) exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective time to complete hack is set to zero, objective will NOT function";
	};
};

if (_hackingTime < 0) exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective time to complete hack is set to a negative number, objective will NOT function";
	};
};

if (_hackingTime > 299) then
{
	if (fnf_debug) then
	{
		systemChat "WARNING: Terminal objective time to complete hack is set to 5 minutes or longer, this is very long for a terminal objective";
	};
};

//if parent task for my tasks doesnt exist create it
if (isNil "fnf_myTasksParentTask") then
{
	fnf_myTasksParentTask = player createSimpleTask ["My Tasks"];
	fnf_myTasksParentTask setSimpleTaskType "documents";
};

//if parent task for ally tasks doesnt exist and its needed create it
if (isNil "fnf_allyTasksParentTask" and not _forPlayer) then
{
	fnf_allyTasksParentTask = player createSimpleTask ["Ally Tasks"];
	fnf_allyTasksParentTask setSimpleTaskType "documents";
};

_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\" + (typeOf _objectiveObject) + ".jpg"] call CBA_fnc_getConfigEntry;

_task = "";

_objNum = str((count fnf_objectives) + 1);

//setup marker for on map timer
_marker = createMarkerLocal ["terminal_timer_" + _objNum, [0,0,0]];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTextLocal "[Idle]";
_marker setMarkerTypeLocal "mil_dot";
_markerColour = [playerSide, true] call BIS_fnc_sideColor;
_marker setMarkerColorLocal _markerColour;

//set terminal starting colour (overridden if attacking)
if (typeOf _objectiveObject isEqualTo "Land_DataTerminal_01_F") then
{
	switch (playerSide) do {
		case west:
		{
			[_objectiveObject, "blue", "blue", "blue"] call BIS_fnc_dataTerminalColor;
		};
		case east:
		{
			[_objectiveObject, "red", "red", "red"] call BIS_fnc_dataTerminalColor;
		};
		case independent:
		{
			[_objectiveObject, "green", "green", "green"] call BIS_fnc_dataTerminalColor;
		};
		default {};
	};
};

//check if player needs to hack or needs to defend
if (_objectiveType isEqualTo "hck") then
{
	//setup task
	if (_forPlayer) then
	{
		_task = player createSimpleTask [(_objNum + ": Hack the Terminal"), fnf_myTasksParentTask];
	} else {
		_task = player createSimpleTask [(_objNum + ": Hack the Terminal"), fnf_allyTasksParentTask];
	};

	_zoneKnown = _objective getVariable ["fnf_zoneKnown", true];

	if (not _zoneKnown) then
	{
		if (fnf_debug) then
		{
			systemChat "WARNING: Terminal objective is not known which hiding zone it is in, currently this disables the in-map timer, please reconsider this option";
		};
	};

	if (_forPlayer) then
	{
		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";

		if (count _hidingZones isNotEqualTo 0) then
		{
			_helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' button above";
			if (not _zoneKnown) then
			{
				_helperString = "The location of the objective may be in a hiding zone, if it is, you will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on your map, or you can find it by hitting the 'Locate' button above";
			};
		};

		_task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>To complete this objective you must hack the objective for %2 seconds<br/><br/>%3</t>", _targetPic, _hackingTime, _helperString], _objNum + ": Hack the Terminal", _objNum + ": Hack the Terminal"];

		//setup hold action if player is destined to be able to interact with terminal
		if (typeOf _objectiveObject isEqualTo "RuggedTerminal_01_communications_hub_F") then
		{
			[
				_objectiveObject,
				"Start Hack",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				//do not allow hack if currently hacking or hacking side is considered friendly
				"(_this distance _target < 10) && ((_target getVariable ['fnf_currentlyHackingSide', sideUnknown]) isNotEqualTo playerSide) && not ([playerSide, (_target getVariable ['fnf_currentlyHackingSide', sideUnknown])] call BIS_fnc_sideIsFriendly)",
				"_caller distance _target < 10",
				{},
				{},
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					[[(_arguments select 0), (_arguments select 1), playerSide, false], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
				},
				{},
				[_objectiveObject, _hackingTime],
				2,
				0,
				false,
				false
			] call BIS_fnc_holdActionAdd;
		} else {
			[
				_objectiveObject,
				"Start Hack",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				//do not allow hack if currently hacking or hacking side is considered friendly
				"(_this distance _target < 4) && ((_target getVariable ['fnf_currentlyHackingSide', sideUnknown]) isNotEqualTo playerSide) && not ([playerSide, (_target getVariable ['fnf_currentlyHackingSide', sideUnknown])] call BIS_fnc_sideIsFriendly)",
				"_caller distance _target < 4",
				{},
				{},
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					[[(_arguments select 0), (_arguments select 1), playerSide, false], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
				},
				{},
				[_objectiveObject, _hackingTime],
				2,
				0,
				false,
				false
			] call BIS_fnc_holdActionAdd;
		};

	} else {
		_helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";

		if (count _hidingZones isNotEqualTo 0) then
		{
			_helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' button above";
			if (not _zoneKnown) then
			{
				_helperString = "The location of the objective may be in a hiding zone, if it is, you will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on your map, or you can find it by hitting the 'Locate' button above";
			};
		};

		_task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>For your allies to complete this objective they must hack the objective for %2 seconds<br/><br/>%3</t>", _targetPic, _hackingTime, _helperString], _objNum + ": Hack the Terminal", _objNum + ": Hack the Terminal"];
	};

	//overide terminal colours
	_marker setMarkerColorLocal "ColorUNKNOWN";
	if (typeOf _objectiveObject isEqualTo "Land_DataTerminal_01_F") then
	{
		[_objectiveObject, "orange", "orange", "orange"] call BIS_fnc_dataTerminalColor;
	};

	_task setSimpleTaskType "upload";
	if (count _hidingZones isEqualTo 0) then
	{
		_task setSimpleTaskTarget [_objectiveObject, true];
	} else {
		[_objectiveObject, _task, _zoneKnown, _hidingZones] call FNF_ClientSide_fnc_addObjectToHide;
	};

} else {
	//setup task
	if (_forPlayer) then
	{
		_task = player createSimpleTask [(_objNum + ": Defend the Terminal"), fnf_myTasksParentTask];
	} else {
		_task = player createSimpleTask [(_objNum + ": Defend the Terminal"), fnf_allyTasksParentTask];
	};
	_task setSimpleTaskType "defend";
	_task setSimpleTaskTarget [_objectiveObject, true];

	_helperString = "";

	if (count _hidingZones isNotEqualTo 0) then
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
		} forEach _hidingZones;

		_helperString = "<br/><br/>The objective can be hidden in the hiding zones provided";
	};
	if (_forPlayer) then
	{
		_task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>To complete this objective you must prevent the objective from being hacked, it will take the hackers %2 seconds to complete the hack%3</t>", _targetPic, _hackingTime, _helperString], _objNum + ": Defend the Terminal", _objNum + ": Defend the Terminal"];
		//setup hold action if player is destined to be able to interact with terminal
		if (typeOf _objectiveObject isEqualTo "RuggedTerminal_01_communications_hub_F") then
		{
			[
				_objectiveObject,
				"Cancel Hack",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				//allow cancel if any side is hacking the OBJ
				"(_this distance _target < 10) && ((_target getVariable ['fnf_currentlyHackingCompletionTime', -1]) isNotEqualTo -1)",
				"_caller distance _target < 10",
				{},
				{},
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					[[(_arguments select 0), (_arguments select 1), playerSide, true], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
				},
				{},
				[_objectiveObject, _hackingTime],
				2,
				0,
				false,
				false
			] call BIS_fnc_holdActionAdd;
		} else {
			[
				_objectiveObject,
				"Cancel Hack",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				//allow cancel if any side is hacking the OBJ
				"(_this distance _target < 4) && ((_target getVariable ['fnf_currentlyHackingCompletionTime', -1]) isNotEqualTo -1)",
				"_caller distance _target < 4",
				{},
				{},
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					[[(_arguments select 0), (_arguments select 1), playerSide, true], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
				},
				{},
				[_objectiveObject, _hackingTime],
				2,
				0,
				false,
				false
			] call BIS_fnc_holdActionAdd;
		};
	} else {
		_task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>For your allies to complete this objective they must prevent the objective from being hacked, it will take the hackers %2 seconds to complete the hack%3</t>", _targetPic, _hackingTime, _helperString], _objNum + ": Defend the Terminal", _objNum + ": Defend the Terminal"];
	};
};

[_task, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

//used to keep marker on the objective
_markerSetLocationPFH = [{
	_objLoc = taskDestination ((_this select 0) select 1);
	if (ace_spectator_isset) then
	{
		_objLoc = getPos ((_this select 0) select 2);
	};
	if (_objLoc isEqualTo [0,0,0]) then
	{
		_objLoc = [-50000, -50000, -50000];
	};
	((_this select 0) select 0) setMarkerPosLocal _objLoc;
},0.1,[_marker, _task, _objectiveObject]] call CBA_fnc_addPerFrameHandler;

//add objective to objective stack
fnf_objectives pushBack ["TERMINAL", _objective, _objectiveObject, _task, _forPlayer, _marker, _markerSetLocationPFH];
