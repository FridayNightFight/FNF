/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to view mission details

	Parameter(s):
		None

	Returns:
		None
*/

disableSerialization;

call FNF_ClientSide_fnc_missionReviewButton;

//Create Mission Details button
[{!isNull findDisplay 60000}, {
	disableSerialization;
	_display = findDisplay 60000;
	if (isNull _display) exitWith {};
	_button = _display ctrlCreate ["RscShortcutButton", 7045];
	_button ctrlSetPosition [
	0.2 * safeZoneW + safeZoneX,
	0.05 * safeZoneH + safeZoneY,
	0.1 * safeZoneW,
	0.03 * safeZoneH
	];
	_button ctrlSetText "Mission Details";
	_button ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
	_button ctrlAddEventHandler ["ButtonClick", {
		[] spawn FNF_ClientSide_fnc_missionDetailsScreen;
	}];
	_button ctrlCommit 0;
}] call CBA_fnc_waitUntilAndExecute;

//get all modules for other buttons
_modules = call FNF_ClientSide_fnc_findFNFModules;
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;

//sort modules to make them predictable
_kitInfoModules = [_kitInfoModules] call FNF_ClientSide_fnc_sortByLocation;

_buttons = [];

//start with side buttons via kit modules
{
	//setup basic variables
	_module = _x;
	_syncedObjects = synchronizedObjects _x;
	_buttonName = "UNKNOWN";
	_buttonColour = [0.5, 0.5, 0.5, 0.9];
	_objectType = typeOf _module;

	//setup basic code for EH to get the modules and set spectator camera to module selected
	//data is stored as a splitString to allow easy editing further on
	//this code is eventually compiled into the EH to be run on button push
	_code = ["_modules = call FNF_ClientSide_fnc_findFNFModules;
	_kitInfoModules = [_modules, 'kitInformation'] call FNF_ClientSide_fnc_findSpecificModules;
	_kitInfoModules = [_kitInfoModules] call FNF_ClientSide_fnc_sortByLocation;

	_module = _kitInfoModules select ", str(_forEachIndex), ";",
	"_object = _module;",
	"if (not isNull _object) then
	{
		[0, _object, -2, [((getposATL _object) select 0), ((getposATL _object) select 1) - random [10, 30, 60], ((getposATL _object) select 2) + random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
	};"];

	//check which side the module is for, set button name and colour as needed
	{
		_objectType = typeOf _x;

		switch (_objectType) do
		{
			case "SideBLUFOR_F":
			{
				_buttonName = "BLUFOR";
				_buttonColour = [0, 0.3, 0.6, 0.9];
			};
			case "SideOPFOR_F":
			{
				_buttonName = "OPFOR";
				_buttonColour = [0.5, 0.0, 0.0, 0.9];
			};
			case "SideResistance_F":
			{
				_buttonName = "INDFOR";
				_buttonColour = [0, 0.5, 0, 0.9];
			};
		};
	} forEach _syncedObjects;

	_buttons pushback [_code, _buttonName, _buttonColour];
} forEach _kitInfoModules;

//setup OBJ buttons after side buttons
{
	_x params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

	//setup basic variables
	_moduleType = typeOf _module;
	_buttonName = "Objective " + str(_forEachIndex + 1) + ": SECTOR";
	_buttonColour = [0.5, 0.5, 0.5, 0.9];
	_code = ["_obj = fnf_objectives select ", str(_forEachIndex), ";
	_obj params ['_objState', '_module', '_task', '_alliedTask', '_codeOnCompletion', '_params'];",
	"_params params ['_zonePrefix', '_centerObject', '_marker', '_statusSlotID'];
	_object = _centerObject;",
	"if (not isNull _object) then
	{
		[0, _object, -2, [((getposATL _object) select 0), ((getposATL _object) select 1) - random [10, 30, 60], ((getposATL _object) select 2) + random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
	};"];

	//whether to show the button (spectator stuff)
	_showButton = true;

	switch (_moduleType) do {
		case "fnf_module_sectorCaptureObj":
		{
			//sector is the standard, basically just check the obj module is not the secondary
			_params params ["_zonePrefix", "_centerObject", "_marker", "_statusSlotID"];
			if (typeOf player isEqualTo "ace_spectator_virtual") then
			{
				if ([_zonePrefix, _module] call FNF_ClientSide_fnc_checkSecondaryObjective) then
				{
					_showButton = false;
				};
			};
		};

		case "fnf_module_destroyObj":
		{
			//set code and variables for destroy OBJ
			_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
			_buttonName = "Objective " + str(_forEachIndex + 1) + ": DESTROY";
			_code set [3, "
			_params params ['_targetObject', '_hidingZonesAssigned', '_marker'];
			_object = _targetObject;
			"];

			//check obj is not secondary
			if (typeOf player isEqualTo "ace_spectator_virtual") then
			{
				if ([_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective) then
				{
					_showButton = false;
				};
			};
		};

		case "fnf_module_terminalObj":
		{
			//set code and variables for terminal OBJ
			_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];
			_buttonName = "Objective " + str(_forEachIndex + 1) + ": TERMINAL";
			_code set [3, "
			_params params ['_targetObject', '_hidingZonesAssigned', '_marker'];
			_object = _targetObject;
			"];

			//check obj is not secondary
			if (typeOf player isEqualTo "ace_spectator_virtual") then
			{
				if ([_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective) then
				{
					_showButton = false;
				};
			};
		};

		case "fnf_module_assassinObj":
		{
			//set code and variables for assassin OBJ
			_params params ["_targetObject", "_hidingZonesAssigned", "_marker", "_standardTitle"];
			_buttonName = "Objective " + str(_forEachIndex + 1) + ": ASSASSIN";
			_code set [3, "
			_params params ['_targetObject', '_hidingZonesAssigned', '_marker', '_standardTitle'];
			_object = _targetObject;
			"];

			//check obj is not secondary
			if (typeOf player isEqualTo "ace_spectator_virtual") then
			{
				//player is not actually the thing we check for secondary objs for assassin, we use the logic of the person instead
				//this gets the persons logic
				_syncedObjects = synchronizedObjects _module;
				{
					_typeOfObject = typeOf _x;

					if (_typeOfObject isEqualTo "Logic") then
					{
						_targetObject = _x;
					};
				} forEach _syncedObjects;

				if ([_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective) then
				{
					_showButton = false;
				};
			};
		};

		default {_showButton = false;};
	};

	if (_showButton) then
	{
		_buttons pushback [_code, _buttonName, _buttonColour];
	};
} forEach fnf_objectives;

//wait until spectator display is created
[{!isNull findDisplay 60000},{
	params ["_buttons"];

	disableSerialization;

	_display = findDisplay 60000;
	if (isNull _display) exitWith {};

	//Master variable to control how many columns to use
	_columnsPerRow = 8;

	//button positions are predefined here, buttons then grab these values at creation
	_buttonPositions = [];

	//check how many rows are completely full, fill button positions with appropriate number of pre-defined positions
	_rows = floor((count _buttons) / _columnsPerRow);
	if (_rows isNotEqualTo 0) then {
		for "_i" from 1 to _rows do
		{
			_h = 0.05 + ((_i - 1) * 0.04);
			for "_i" from 1 to _columnsPerRow do
			{
				_buttonPositions pushBack [0.3 + ((_i - 1) * (0.4 / _columnsPerRow)),_h];
			};
		};
	};

	//if there are leftover buttons, center these depending on how many there are
	_columns = (count _buttons) - (_rows * _columnsPerRow);
	if (_columns isNotEqualTo 0) then {
		_startingNum = 0.3 + ((0.4 - (_columns * (0.4 / _columnsPerRow))) / 2);
		for "_i" from 1 to _columns do
		{
			_h = 0.05 + (_rows * 0.04);
			_buttonPositions pushBack [_startingNum + ((_i - 1) * (0.4 / _columnsPerRow)),_h];
		};
	};

	{
		_x params ["_code", "_buttonName", "_buttonColour"];
		//compile code created earlier
		_code = _code joinString "";
		_code = compile _code;

		//create button and assign relevant values
		_button = _display ctrlCreate ["RscShortcutButton", -1];
		_button ctrlSetPosition [
		(_buttonPositions select _forEachIndex select 0) * safeZoneW + safeZoneX,
		(_buttonPositions select _forEachIndex select 1) * safeZoneH + safeZoneY,
		(0.4 / _columnsPerRow) * safeZoneW,
		0.04 * safeZoneH
		];
		//attempt to center the text (it never works)
		_button ctrlSetStructuredText (parseText ("<t align='left'>" + _buttonName + "</t>"));
		_textWidth = (ctrlTextWidth _button) + (2 * 0.008);
		if (_textWidth > ((0.4 / _columnsPerRow) * safeZoneW)) then
		{
			_button ctrlSetStructuredText (parseText ("<t align='left' size='0.75'>" + _buttonName + "</t>"));
		};
		_button ctrlSetBackgroundColor _buttonColour;
		_button ctrlAddEventHandler ["ButtonClick", _code];
		_button ctrlCommit 0;
	} forEach _buttons;
},[_buttons]] call CBA_fnc_waitUntilAndExecute;
