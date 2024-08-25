/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players in spectator slots

	Parameter(s):
		0: ARRAY -	Array of FNF modules

	Returns:
		None
*/

params["_modules", "_initModule"];

//init zones
call FNF_ClientSide_fnc_initZones;

//setup map shading
[{!isNull findDisplay 60000},{
findDisplay 60000 displayCtrl 60014 ctrlAddEventHandler ["Draw",
{
	_map = _this select 0;
	{
		_rgbaValues = _x select 2;
		{
			_pos1 = _x select 0;
			_pos2 = _x select 1;
			_pos3 = _x select 2;
			_map drawTriangle [[_pos1, _pos2, _pos3], _rgbaValues, "#(rgb,1,1,1)color(1,1,1,1)"];
		} forEach (_x select 1);
	} forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

//init breifing
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules, _kitInfoModules, _initModule] call FNF_ClientSide_fnc_initBreifing;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules isEqualTo 0) then
{
	if (fnf_debug) then {
		systemChat "WARNING: No objectives present"
	};
} else {
	[_objModules] call FNF_ClientSide_fnc_initSpectatorObjs;
};

//start overall timer
[_initModule] call FNF_ClientSide_fnc_initOverallTimer;

//show Mission Details button
call FNF_ClientSide_fnc_missionDetailsButton;

//check if there is a playzone
_playZoneModules = [_modules, "playZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _playZoneModules isEqualTo 0) then
{
	if (fnf_debug) then {
		systemChat "WARNING: No playzone present"
	};
} else {
	[_playZoneModules] call FNF_ClientSide_fnc_initSpectatorPlayZones;
};

//check there are safe zones
_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _safeZoneModules isEqualTo 0) then
{
	if (fnf_debug) then {
		systemChat "WARNING: No safe zones present";
	};
} else {
	[_safeZoneModules] call FNF_ClientSide_fnc_initSpectatorSafeZones;
};

_selectorModules = [_modules, "selectorHost"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _selectorModules isNotEqualTo 0) then
{
	[_selectorModules] call FNF_ClientSide_fnc_initSelectors;
};

//if there are objectives start watching them
if (not isNil "fnf_objectives") then
{
	if (count fnf_objectives isNotEqualTo 0) then
	{
		[{call FNF_ClientSide_fnc_watchSpectatorObjs;}, 1] call CBA_fnc_addPerFrameHandler;

		_indexsToDrawIcon = [];

		{
			_x params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];
			_type = typeOf _module;
			//if OBJ is one without a physical object then move to next OBJ
			if (_type isEqualTo "fnf_module_sectorCaptureObj") then
			{
				continue;
			};

			if (_type isEqualTo "fnf_module_destroyObj") then
			{
				_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
				_indexsToDrawIcon pushBack _forEachIndex;
			};

			if (_type isEqualTo "fnf_module_terminalObj") then
			{
				_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
				_indexsToDrawIcon pushBack _forEachIndex;
			};

			if (_type isEqualTo "fnf_module_assassinObj") then
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

				if (_type isEqualTo "fnf_module_destroyObj") then
				{
					_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
					drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
				};

				if (_type isEqualTo "fnf_module_terminalObj") then
				{
					_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
					drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
				};

				if (_type isEqualTo "fnf_module_assassinObj") then
				{
					_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
					if (_targetObject isNotEqualTo objNull) then
					{
						drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _targetObject, 0.6, 0.6, 45];
					};
				};
			} forEach _objectiveIndexs;
 		}, 0, _indexsToDrawIcon] call CBA_fnc_addPerFrameHandler;
	};
};
