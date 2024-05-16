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
_buttonpos = 0.3;
_moduleno = 1;
_buttons = [];
_objectiveno = 1;
_activeside = sideEmpty;

{
	switch (_moduleno) do
  {
		case 1: {button1mod = _x};
		case 2: {button2mod = _x};
		case 3: {button3mod = _x};
		case 4: {button4mod = _x};
		case 5: {button5mod = _x};
		case 6: {button6mod = _x};
		case 7: {button7mod = _x};
    case 8: {button8mod = _x};
	};


  _syncedObjects = synchronizedObjects _x;
  _buttonname = "";
  _buttoncolour = [0.5, 0.5, 0.5, 0.9];

  {
    _objectType = typeOf _x;

    switch (_objectType) do
    {
      case "SideBLUFOR_F":
      {
        _buttonname = "BLUFOR";
		    _buttoncolour = [0, 0.0, 0.5, 0.9];
		    _activeside = WEST;
      };
      case "SideOPFOR_F":
      {
        _buttonname = "OPFOR";
		    _buttoncolour = [0.5, 0.0, 0.0, 0.9];
		    _activeside = EAST;
      };
      case "SideResistance_F":
      {
        _buttonname = "INDFOR";
		  _buttoncolour = [0, 0.5, 0, 0.9];
      };
    };

  } forEach _syncedObjects;

  _buttons pushback [_moduleno, _buttonpos, _buttonname, _buttoncolour, 0, 0];

  _buttonpos = _buttonpos + 0.05;
  _moduleno = _moduleno + 1;

} forEach _kitInfoModules;

{
	_syncedObjects = synchronizedObjects _x;
  _buttonname = "";
  _buttoncolour = [0.5, 0.5, 0.5, 0.9];
  _useThis = False;
  _objectType = typeOf _x;
  _buttonname = "Unknown";

  switch (_objectType) do
  {
    case "fnf_module_sectorCaptureObj": {_buttonname  = "  SECTOR"};
    case "fnf_module_assassinObj": {_buttonname = "      VIP"};
    case "fnf_module_terminalObj": {_buttonname = " TERMINAL"};
    case "fnf_module_destroyObj": {_buttonname = " DESTROY"};
  };

  If (_objectType == "fnf_module_sectorCaptureObj" ||_objectType == "fnf_module_assassinObj") then
  {
    switch (_moduleno) do
    {
      case 1: {button1mod = _x};
      case 2: {button2mod = _x};
      case 3: {button3mod = _x};
      case 4: {button4mod = _x};
      case 5: {button5mod = _x};
      case 6: {button6mod = _x};
      case 7: {button7mod = _x};
      case 8: {button8mod = _x};
    };
  };

  {
    _objectType = typeOf _x;

    If (_objectType == "SideBLUFOR_F" && _activeside == WEST) then {_useThis = True;};
    If (_objectType == "SideOPFOR_F" && _activeside == EAST) then {_useThis = True;};
    If (_objectType != "SideBLUFOR_F" && _objectType != "SideOPFOR_F" && _objectType != "SideResistance_F" && _objectType != "fnf_module_hidingZone") then
    {
      switch (_moduleno) do
      {
        case 1: {button1mod = _x};
        case 2: {button2mod = _x};
        case 3: {button3mod = _x};
        case 4: {button4mod = _x};
        case 5: {button5mod = _x};
        case 6: {button6mod = _x};
        case 7: {button7mod = _x};
        case 8: {button8mod = _x};
		  };
    };
  } forEach _syncedObjects;

	If (_useThis == True) Then
  {
		_buttons pushback [_moduleno, _buttonpos, _buttonname, _buttoncolour, _objectiveno];

		_buttonpos = _buttonpos + 0.05;
		_moduleno = _moduleno + 1;
		_objectiveno = _objectiveno + 1;
  };
} forEach _objModules;



{
  _moduleno = _x select 0;
  _buttonpos = _x select 1;
  _buttonname = _x select 2;
  _buttoncolour = _x select 3;
  _objectiveno = _x select 4;

  [{!isNull findDisplay 60000},
  {
	  params["_moduleno", "_buttonpos", "_buttonname", "_buttoncolour", "_objectiveno"];

		disableSerialization;

		_display = findDisplay 60000;
		if (isNull _display) exitWith {};

		_button = _display ctrlCreate ["RscShortcutButton", 7045];
		_button ctrlSetPosition [
		_buttonpos * safeZoneW + safeZoneX,
		0.05 * safeZoneH + safeZoneY,
		0.05 * safeZoneW,
		0.03 * safeZoneH
		];

    if (_objectiveno == 0) then
    {
      _button ctrlSetText _buttonname;
    } else {
      _button ctrlSetStructuredText parseText format ["<t size='0.6'>%1</t><br></br><t size='0.6'>%2</t>","Objective " + str(_objectiveno), _buttonname];
    };
		  _button ctrlSetBackgroundColor _buttoncolour;
		switch (_moduleno) do
    {
      case 1: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button1mod,-2, [((getposATL button1mod) select 0), ((getposATL button1mod) select 1) - random [10, 30, 60], ((getposATL button1mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 2: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button2mod,-2, [((getposATL button2mod) select 0), ((getposATL button2mod) select 1) - random [25, 40, 60], ((getposATL button2mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 3: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button3mod,-2, [((getposATL button3mod) select 0), ((getposATL button3mod) select 1) - random [25, 40, 60], ((getposATL button3mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 4: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button4mod,-2, [((getposATL button4mod) select 0), ((getposATL button4mod) select 1) - random [25, 40, 60], ((getposATL button4mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 5: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button5mod,-2, [((getposATL button5mod) select 0), ((getposATL button5mod) select 1) - random [25, 40, 60], ((getposATL button5mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 6: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button6mod,-2, [((getposATL button6mod) select 0), ((getposATL button6mod) select 1) - random [25, 40, 60], ((getposATL button6mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 7: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button7mod,-2, [((getposATL button7mod) select 0), ((getposATL button7mod) select 1) - random [25, 40, 60], ((getposATL button7mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
		  case 8: {
        _button ctrlAddEventHandler ["ButtonClick", {
			    [0, button8mod,-2, [((getposATL button8mod) select 0), ((getposATL button8mod) select 1) - random [25, 40, 60], ((getposATL button8mod) select 2)+ random [10, 30, 60]]] call ace_spectator_fnc_setCameraAttributes;
		    }
      ]};
    };

		_button ctrlCommit 0;

  },[_moduleno, _buttonpos, _buttonname, _buttoncolour, _objectiveno]] call CBA_fnc_waitUntilAndExecute;
} forEach _buttons;
