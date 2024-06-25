/*
	Author: Mallen

	Description:
		init a destroy objective for spectators

	Parameter(s):
		0: OBJECT -	The destroy objective module to be processed

	Returns:
		None
*/

params ["_objective","_side"];

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

//find the object thats supposed to be hacked
_hidingZones = [];
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

if (_objectiveObject isEqualTo "") exitWith
{
	if (fnf_debug) then
	{
		systemChat "DANGER: Terminal objective does not have terminal synced, objective will NOT function";
	};
};

_objNum = str(({_x select 0 isNotEqualTo "DESTROYDUPE" and _x select 0 isNotEqualTo "CAPTURESECTORDUPE" and _x select 0 isNotEqualTo "TERMINALDUPE" and _x select 0 isNotEqualTo "ASSASSINDUPE"} count fnf_objectives) + 1);

//check if obj is duplicate
_isObjDuplicate = false;
{
	if (_x select 0 isEqualTo "TERMINAL") then
	{
		if	(_x select 2 isEqualTo _objectiveObject) then
		{
			_isObjDuplicate = true;
			_objNum = _x select 4;
		};
	};
} forEach fnf_objectives;

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

_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\" + (typeOf _objectiveObject) + ".jpg"] call CBA_fnc_getConfigEntry;


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
};

_task = "";

if (_objectiveType isEqualTo "hck") then
{
	_task = player createSimpleTask [(_objNum + ": Hack the Terminal")];

	_zoneKnown = _objective getVariable ["fnf_zoneKnown", true];

	if (not _zoneKnown) then
	{
		if (fnf_debug) then
		{
			systemChat "WARNING: Terminal objective is not known which hiding zone it is in, currently this disables the in-map timer, please reconsider this option";
		};
	};

	_helperString = "The location of the objective is marked on " + ([_side] call BIS_fnc_sideName) + "s map";

	if (count _hidingZones isNotEqualTo 0) then
	{
		_helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on " + ([_side] call BIS_fnc_sideName) + "s map, if it isn't, the objectives exact location is marked instead";
		if (not _zoneKnown) then
		{
			_helperString = "The location of the objective may be in a hiding zone, if it is, " + ([_side] call BIS_fnc_sideName) + " will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on " + ([_side] call BIS_fnc_sideName) + "s map";
		};
	};

	_task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>To complete this objective " + ([_side] call BIS_fnc_sideName) + " must hack the objective for %2 seconds<br/><br/>%3</t>", _targetPic, _hackingTime, _helperString], _objNum + ": Hack the Terminal", _objNum + ": Hack the Terminal"];

	_task setSimpleTaskType "upload";
	_task setSimpleTaskTarget [_objectiveObject, true];

} else {
	_task = player createSimpleTask [(_objNum + ": Defend the Terminal")];

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

	_task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>To complete this objective " + ([_side] call BIS_fnc_sideName) + " must prevent the objective from being hacked, it will take the hackers %2 seconds to complete the hack%3</t>", _targetPic, _hackingTime, _helperString], _objNum + ": Defend the Terminal", _objNum + ": Defend the Terminal"];

};

if (not _isObjDuplicate) then
{
	_marker = createMarkerLocal ["terminal_timer_" + _objNum, _objectiveObject];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTextLocal "Terminal " + _objNum + " [Idle]";
	_marker setMarkerTypeLocal "mil_dot";
	_marker setMarkerColorLocal "ColorUNKNOWN";

	if (typeOf _objectiveObject isEqualTo "Land_DataTerminal_01_F") then
	{
		[_objectiveObject, "orange", "orange", "orange"] call BIS_fnc_dataTerminalColor;
	};
	//add objective to objective stack
	fnf_objectives pushBack ["TERMINAL", _objective, _objectiveObject, _marker, _objNum, _task];
} else {
	fnf_objectives pushBack ["TERMINALDUPE", _objective, _objectiveObject, _task];
};
