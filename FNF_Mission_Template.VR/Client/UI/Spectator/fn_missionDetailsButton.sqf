/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to view mission details

	Parameter(s):
		1: DISPLAY -	The display object of the pause screen

	Returns:
		None
*/

disableSerialization;

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

/*
//get all modules for other buttons
_modules = call FNF_ClientSide_fnc_findFNFModules;
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;

//sort modules to make them predictable
_kitInfoModules = [_kitInfoModules] call FNF_ClientSide_fnc_sortByLocation;
_objModules = [_objModules] call FNF_ClientSide_fnc_sortByLocation;

//put kit modules first so kit buttons come before objectives
_modulesComplete = _kitInfoModules + _objModules;

_buttons = [];

_usedObjs = [];

_objNumber = 1;

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
	_objModules = [_modules, 'Obj'] call FNF_ClientSide_fnc_findSpecificModules;

	_kitInfoModules = [_kitInfoModules] call FNF_ClientSide_fnc_sortByLocation;
	_objModules = [_objModules] call FNF_ClientSide_fnc_sortByLocation;

	_modulesComplete = _kitInfoModules + _objModules;
	_object = objNull;
	_module = _modulesComplete select ", str(_forEachIndex), ";",
	"_object = _module;",
	"if (not isNull _object) then
	{
		[0, _object, -2, [((getposATL _object) select 0), ((getposATL _object) select 1) - random [10, 30, 60], ((getposATL _object) select 2) + random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
	};"];

	//if module is for a kit no code changes need to be done from above
	if (_objectType isEqualTo "fnf_module_kitInformation") then
	{
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
	};

	//if module is a sector
	if (_objectType isEqualTo "fnf_module_sectorCaptureObj") then
	{
		//set button name
		_buttonName = "Objective " + str(_objNumber) + ": SECTOR";

		//check whether the nearest area marker is on the sector, if it is, this is a duplicate and should be skipped
		_zonePrefix = _module getVariable ['fnf_prefix', 'FAILED'];
		_validPoint = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
		_object = nearestObject [_validPoint, 'AreaMarker_01_F'];
		if (not isNull _object) then {
			if (_object distance2D _validPoint < 3) then
			{
				continue;
			};
		};

		//if not a duplicate create new area marker and hide it
		_object = 'AreaMarker_01_F' createVehicleLocal _validPoint;
		_object hideObject true;

		//edit code to find area marker to set camera to
		_code set [3, "
		_zonePrefix = _module getVariable ['fnf_prefix', 'FAILED'];
		_validPoint = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
		_object = nearestObject [_validPoint, 'AreaMarker_01_F'];
		"];
		_objNumber = _objNumber + 1;
	};

	//if module is destroy obj
	if (_objectType isEqualTo "fnf_module_destroyObj") then
	{
		//set button name
		_buttonName = "Objective " + str(_objNumber) + ": DESTROY";

		//find object to destroy
		_object = objNull;

		_syncedObjects = synchronizedObjects _module;
		{
			_typeOfObject = typeOf _x;
			if (_typeOfObject isEqualTo 'SideBLUFOR_F' or _typeOfObject isEqualTo 'SideOPFOR_F' or _typeOfObject isEqualTo 'SideResistance_F' or _typeOfObject isEqualTo 'fnf_module_hidingZone') then
			{
				continue;
			};

			_object = _x;
			break;
		} forEach _syncedObjects;

		//check if obj has already been added, if yes this is a duplicate
		if (_object in _usedObjs) then
		{
			continue;
		};
		_usedObjs pushBack _object;

		//edit code to look for object attached to module as the object to point camera at
		_code set [3, "
		_syncedObjects = synchronizedObjects _module;
		{
			_typeOfObject = typeOf _x;
			if (_typeOfObject isEqualTo 'SideBLUFOR_F' or _typeOfObject isEqualTo 'SideOPFOR_F' or _typeOfObject isEqualTo 'SideResistance_F' or _typeOfObject isEqualTo 'fnf_module_hidingZone') then
			{
				continue;
			};

			_object = _x;
			break;
		} forEach _syncedObjects;
		"];
		_objNumber = _objNumber + 1;
	};

	//if module is terminal obj
	if (_objectType isEqualTo "fnf_module_terminalObj") then
	{
		//set button name
		_buttonName = "Objective " + str(_objNumber) + ": TERMINAL";

		//find terminal to hack
		//no error checking needs to be done here, if object is not a terminal other errors will catch elsewhere
		_object = objNull;

		_syncedObjects = synchronizedObjects _module;
		{
			_typeOfObject = typeOf _x;
			if (_typeOfObject isEqualTo 'SideBLUFOR_F' or _typeOfObject isEqualTo 'SideOPFOR_F' or _typeOfObject isEqualTo 'SideResistance_F' or _typeOfObject isEqualTo 'fnf_module_hidingZone') then
			{
				continue;
			};

			_object = _x;
			break;
		} forEach _syncedObjects;

		//check if obj has already been added, if yes this is a duplicate
		if (_object in _usedObjs) then
		{
			continue;
		};
		_usedObjs pushBack _object;

		//edit code to look for object attached to module as the object to point camera at
		_code set [3, "
		_syncedObjects = synchronizedObjects _module;
		{
			_typeOfObject = typeOf _x;
			if (_typeOfObject isEqualTo 'SideBLUFOR_F' or _typeOfObject isEqualTo 'SideOPFOR_F' or _typeOfObject isEqualTo 'SideResistance_F' or _typeOfObject isEqualTo 'fnf_module_hidingZone') then
			{
				continue;
			};

			_object = _x;
			break;
		} forEach _syncedObjects;
		"];
		_objNumber = _objNumber + 1;
	};

	//if module is assassin obj
	if (_objectType isEqualTo "fnf_module_assassinObj") then
	{
		//set button name
		_buttonName = "Objective " + str(_objNumber) + ": ASSASSIN";

		//find assassin target, if target cannot be found, set target as module itself
		_object = objNull;

		_syncedObjects = synchronizedObjects _module;
		{
			_typeOfObject = typeOf _x;

			if (isPlayer _x) then
			{
				_object = _x;
				break;
			};

			if (_typeOfObject isEqualTo "Logic") then
			{
				if (isNull _object) then
				{
					_object = _x;
				};
			};
		} forEach _syncedObjects;

		//check if obj has already been added, if yes this is a duplicate
		if (_object in _usedObjs) then
		{
			continue;
		};
		_usedObjs pushBack _object;

		//edit code to look for player attached to module as the object to point camera at, if no player is found, point camera at module
		_code set [3, "
		_syncedObjects = synchronizedObjects _module;
		{
			if (isPlayer _x) then
			{
				_object = _x;
				break;
			};
		} forEach _syncedObjects;
		if (isNull _object) then
		{
			_object = _module;
		};
		"];
		_objNumber = _objNumber + 1;
	};

	_buttons pushback [_code, _buttonName, _buttonColour];
} forEach _modulesComplete;

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
*/
