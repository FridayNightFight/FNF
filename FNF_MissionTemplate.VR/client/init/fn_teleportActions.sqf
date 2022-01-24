
if !(phx_gameMode == "sustainedAssault") exitWith {};


if (playerSide == west) then {
  private _process = true;
  if (isNil "rallybase_west") then {
    systemChat "Warning: rallybase_west not present! MSP teleport failed to initialize for BLUFOR.";
    _process = false;
  };
  if (isNil "west_MSP_1") then {
    systemChat "Warning: west_MSP_1 not present! MSP teleport failed to initialize for BLUFOR.";
    _process = false;
  };

  if (_process) then {
    // parent action
    private _action = ["FNF_BLU_TeleportOptions","BLUFOR Teleport Options","",{},{true},{},[],[-0.05,-0.35,-2],6] call ace_interact_menu_fnc_createAction;
    [rallybase_west,0,[],_action] call ace_interact_menu_fnc_addActionToObject;

    private _action = [
      "BLU_MSP_Teleport_1",
      "Mobile Spawn Point",
      "",
      { // statement
        _pos = (position west_MSP_1) findEmptyPosition [0, 20, typeOf _player];
        _player setPosATL _pos;
      },
      { // condition
        alive west_MSP_1 && side _player == west && vehicle _player == _player && (missionNamespace getVariable ["phx_safetyEnabled", true]) isEqualTo false
      }
    ] call ace_interact_menu_fnc_createAction;

    [
      rallybase_west,
      0,
      ["FNF_BLU_TeleportOptions"],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;


    // airfield teleport if icon marker "west_airfield_1" exists
    if (markerColor "west_airfield_1" != "") then {
      private _action = [
        "BLU_Airfield_Teleport_1",
        "Airfield",
        "",
        { // statement
          _pos = (markerPos "west_airfield_1") findEmptyPosition [0, 20, typeOf _player];
          _player setPosATL _pos;
        },
        { // condition
          side _player == west && vehicle _player == _player && (missionNamespace getVariable ["phx_safetyEnabled", true]) isEqualTo false
        }
      ] call ace_interact_menu_fnc_createAction;

      [
        rallybase_west,
        0,
        ["FNF_BLU_TeleportOptions"],
        _action
      ] call ace_interact_menu_fnc_addActionToObject;
    };
  };
};

if (playerSide == east) then {
  private _process = true;
  if (isNil "rallybase_east") then {
    systemChat "Warning: rallybase_east not present! MSP teleport failed to initialize for BLUFOR.";
    _process = false;
  };
  if (isNil "east_MSP_1") then {
    systemChat "Warning: east_MSP_1 not present! MSP teleport failed to initialize for BLUFOR.";
    _process = false;
  };
  if (_process) then {

    // add parent option
    private _action = ["FNF_OPF_TeleportOptions","OPFOR Teleport Options","",{},{true},{},[],[-0.05,-0.35,-2],6] call ace_interact_menu_fnc_createAction;
    [rallybase_east,0,[],_action] call ace_interact_menu_fnc_addActionToObject;

    private _action = [
      "OPF_MSP_Teleport_1",
      "Mobile Spawn Point",
      "",
      { // statement
        _pos = (position east_MSP_1) findEmptyPosition [0, 20, typeOf _player];
        _player setPosATL _pos;
      },
      { // condition
        alive east_MSP_1 && side _player == east && vehicle _player == _player && (missionNamespace getVariable ["phx_safetyEnabled", true]) isEqualTo false
      }
    ] call ace_interact_menu_fnc_createAction;

    [
      rallybase_east,
      0,
      ["FNF_OPF_TeleportOptions"],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;

    // private _action = [
    //   "OPF_Airfield_Teleport_1",
    //   "Airfield",
    //   "",
    //   { // statement
    //     _pos = (markerPos "east_airfield_1") findEmptyPosition [0, 20, typeOf _player];
    //     _player setPosATL _pos;
    //   },
    //   { // condition
    //     side _player == east && vehicle _player == _player && (missionNamespace getVariable ["phx_safetyEnabled", true]) isEqualTo false
    //   }
    // ] call ace_interact_menu_fnc_createAction;

    // [
    //   rallybase_east,
    //   0,
    //   ["FNF_OPF_TeleportOptions"],
    //   _action
    // ] call ace_interact_menu_fnc_addActionToObject;
  };
};


// this setFlagTexture "\A3\ui_f\data\map\markers\flags\USA_ca.paa";

// this setFlagTexture "\vn\objects_f_vietnam\markers\vn_mrk_usa_ca.paa";
// this setFlagTexture "\vn\objects_f_vietnam\markers\vn_mrk_pavn_ca.paa";
// this setFlagTexture "\vn\objects_f_vietnam\markers\vn_mrk_arvn_ca.paa";
// this setFlagTexture "\vn\objects_f_vietnam\markers\vn_mrk_vc_ca.paa";



/*
 * Author: esteldunedain
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon file path or Array of icon file path and hex color ("" for default icon) <STRING|ARRAY>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 *
 * Return Value:
 * Action <ARRAY>
 *
 * Example:
 * ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
 *
 * Public: Yes
 */





/*
 * Author: esteldunedain
 * Insert an ACE action to an object, under a certain config path
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 *
 * Return Value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToObject;
 *
 * Public: Yes
 */

