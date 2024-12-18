/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players who have died

	Parameter(s):
		None

	Returns:
		None
*/

[true, true, true] call ace_spectator_fnc_setSpectator;

_lastDamage = player getVariable ["ace_medical_lastDamageSource",objNull];

if (!isNull _lastDamage) then {
	[2, _lastDamage] call ace_spectator_fnc_setCameraAttributes;
} else {
	[2, player] call ace_spectator_fnc_setCameraAttributes;
};

true call FNF_ClientSide_fnc_showTimerInHUD;

//setup map shading
[{!isNull findDisplay 60000},{
findDisplay 60000 displayCtrl 60014 ctrlAddEventHandler ["Draw",
{
	_map = _this select 0;
	{
		_rgbaValues = _y select 1;
		{
			_pos1 = _x select 0;
			_pos2 = _x select 1;
			_pos3 = _x select 2;
			_map drawTriangle [[_pos1, _pos2, _pos3], _rgbaValues, "#(rgb,1,1,1)color(1,1,1,1)"];
		} forEach (_y select 0);
	} forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

//show Mission Details button
call FNF_ClientSide_fnc_missionDetailsButton;

call BIS_fnc_showMissionStatus;

[{!isNil "fnf_objectives"}, {

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
			_marker setMarkerAlphaLocal 1;
			_indexsToDrawIcon pushBack _forEachIndex;
		};

		if (_type isEqualTo "fnf_module_terminalObj") then
		{
			_indexsToDrawIcon pushBack _forEachIndex;
		};

		if (_type isEqualTo "fnf_module_assassinObj") then
		{
			_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
			_marker setMarkerAlphaLocal 1;
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

		if (!ace_spectator_isSet) then
		{
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
 	}, 0, _indexsToDrawIcon] call CBA_fnc_addPerFrameHandler;

}, [], 60] call CBA_fnc_waitUntilAndExecute;
