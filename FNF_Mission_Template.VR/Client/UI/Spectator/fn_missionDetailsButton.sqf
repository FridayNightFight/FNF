/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to view mission details

	Parameter(s):
	  1: DISPLAY -  The display object of the pause screen

	Returns:
		None
*/

disableSerialization;

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


_modules = call FNF_ClientSide_fnc_findFNFModules;
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;

_kitInfoModules = [_kitInfoModules] call FNF_ClientSide_fnc_sortByLocation;
_objModules = [_objModules] call FNF_ClientSide_fnc_sortByLocation;

_modulesComplete = _kitInfoModules + _objModules;

_buttons = [];

_usedObjs = [];

_objNumber = 1;

{
  _module = _x;
  _syncedObjects = synchronizedObjects _x;
  _buttonName = "UNKNOWN";
  _buttonColour = [0.5, 0.5, 0.5, 0.9];
  _objectType = typeOf _module;
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

  if (_objectType isEqualTo "fnf_module_kitInformation") then
  {
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

  if (_objectType isEqualTo "fnf_module_sectorCaptureObj") then
  {
    _buttonName = "Obj " + str(_objNumber) + ": SECTOR";

    _zonePrefix = _module getVariable ['fnf_prefix', 'FAILED'];
    _validPoint = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
    _object = nearestObject [_validPoint, 'AreaMarker_01_F'];
    if (_object in _usedObjs) then
    {
      continue;
    };

    _object = 'AreaMarker_01_F' createVehicleLocal _validPoint;
    _usedObjs pushBack _object;
    _object hideObject true;

    _code set [3, "
    _zonePrefix = _module getVariable ['fnf_prefix', 'FAILED'];
    _validPoint = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;
    _object = nearestObject [_validPoint, 'AreaMarker_01_F'];
    "];
    _objNumber = _objNumber + 1;
  };

  if (_objectType isEqualTo "fnf_module_destroyObj") then
  {
    _buttonName = "Obj " + str(_objNumber) + ": DESTROY";

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

    if (_object in _usedObjs) then
    {
      continue;
    };
    _usedObjs pushBack _object;

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

  if (_objectType isEqualTo "fnf_module_terminalObj") then
  {
    _buttonName = "Obj " + str(_objNumber) + ": TERMINAL";

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

    if (_object in _usedObjs) then
    {
      continue;
    };
    _usedObjs pushBack _object;

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

  if (_objectType isEqualTo "fnf_module_assassinObj") then
  {
    _buttonName = "Obj " + str(_objNumber) + ": ASSASSIN";

    _object = objNull;

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

    if (_object in _usedObjs) then
    {
      continue;
    };
    _usedObjs pushBack _object;

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

[{!isNull findDisplay 60000},{
  params ["_buttons"];

  disableSerialization;

	_display = findDisplay 60000;
	if (isNull _display) exitWith {};

  _columnsPerRow = 6;

  _buttonPositions = [];
  _rows = floor((count _buttons) / _columnsPerRow);
  if (_rows isNotEqualTo 0) then {
    for "_i" from 1 to _rows do
    {
      _h = 0.05 + ((_i - 1) * 0.03);
      for "_i" from 1 to _columnsPerRow do
      {
        _buttonPositions pushBack [0.3 + ((_i - 1) * (0.4 / _columnsPerRow)),_h];
      };
    };
  };
  _columns = (count _buttons) - (_rows * _columnsPerRow);
  if (_columns isNotEqualTo 0) then {
    _startingNum = 0.3 + ((0.4 - (_columns * (0.4 / _columnsPerRow))) / 2);
    for "_i" from 1 to _columns do
    {
      _h = 0.05 + (_rows * 0.03);
      _buttonPositions pushBack [_startingNum + ((_i - 1) * (0.4 / _columnsPerRow)),_h];
    };
  };

  {
    _x params ["_code", "_buttonName", "_buttonColour"];
    _code = _code joinString "";
    _code = compile _code;

    _button = _display ctrlCreate ["RscShortcutButton", -1];
		_button ctrlSetPosition [
		(_buttonPositions select _forEachIndex select 0) * safeZoneW + safeZoneX,
		(_buttonPositions select _forEachIndex select 1) * safeZoneH + safeZoneY,
		(0.4 / _columnsPerRow) * safeZoneW,
		0.03 * safeZoneH
		];
    _button ctrlSetStructuredText (parseText ("<t align='center'>" + _buttonName + "</t>"));
    _button ctrlSetBackgroundColor _buttonColour;
    _button ctrlAddEventHandler ["ButtonClick", _code];
    _button ctrlCommit 0;
  } forEach _buttons;
},[_buttons]] call CBA_fnc_waitUntilAndExecute;
