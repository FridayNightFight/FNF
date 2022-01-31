
if !(phx_gameMode == "sustainedAssault") exitWith {};

#define PARENTACTION (format["FNF_%1_TeleportOptions", _thisSideStr])
#define RALLYBASEOBJ (missionNamespace getVariable [_rallyBase, objNull])
#define MSPOBJ (missionNamespace getVariable [(_MSPprefix + str(_i)), nil])

{
  private _thisSide = _x;
  private _thisSideStr = toLower(_thisSide call BIS_fnc_sideNameUnlocalized);
  private _thisSideStrLoc = _thisSide call BIS_fnc_sideName;
  private _rallyBase = format["rallybase_%1", _thisSideStr];
  private _MSPPrefix = format["%1_MSP_", _thisSideStr];

  if (isNull RALLYBASEOBJ) then {
    if (is3DENPreview) then {
      format["[PreviewOnly] rallybase_%1 not present. Safezone teleport disabled for %2", _thisSideStr, _thisSide call BIS_fnc_sideName] remoteExec ["systemChat", 0];
    };
    continue
  };
  if (isNull (missionNamespace getVariable [_MSPPrefix + "1", objNull])) then {
    if (is3DENPreview) then {
      format["[PreviewOnly] %1_MSP_1 not present. Safezone teleport disabled for %2", _thisSideStr, _thisSide call BIS_fnc_sideName] remoteExec ["systemChat", 0];
    };
    continue
  };
  if (playerSide != _thisSide) then {continue};

  private _MSPPresent = [];
  for "_i" from 1 to 5 do {
    if (!isNil {MSPOBJ}) then {
      _MSPPresent pushBack MSPOBJ;
    };
  };


  // create parent ACE Action for teleport options
  private _action = [PARENTACTION,format["%1 Teleport Options", _thisSideStrLoc],"",{},{true},{},[],[-0.05,-0.35,-2],6] call ace_interact_menu_fnc_createAction;
  [RALLYBASEOBJ,0,[],_action] call ace_interact_menu_fnc_addActionToObject;


  { // add MSP options
    private _thisObj = _x;
    private _MSPNum = str(_x) select [(count str(_x)) - 1, 1];

    private _action = [
      format["%1_MSP_Teleport_%2", _thisSideStr, _MSPNum],
      format["Mobile Spawn Point %1", _MSPNum],
      "",
      { // statement
        params ["_target", "_player", "_params"];
        _params params ["_eligibleSide","_MSPObj"];
        if (!alive _MSPObj) exitWith {
          ["<t align='center'>This MSP is dead! Wait for it to respawn.</t>", "error", 7] call phx_ui_fnc_notify;
        };

        // find empty cargo (passenger) spots on MSP
        _cargoSpots = (fullCrew [_MSPObj, "cargo", true]) select {isNull (_x # 0)};
        if (count _cargoSpots > 0) then {
          // if any free cargo spots open, move player to that
          _mySpot = selectRandom(_cargoSpots);
          _mySpot params ["_unit", "_role", "_cargoIndex"];
          _player moveInCargo [_MSPObj, _cargoIndex];
        } else {
          // otherwise, place them beside it
          _pos = (position _MSPObj) findEmptyPosition [0, 20, typeOf _player];
          _player setPosATL _pos;
        };
      },
      { // condition
        params ["_target", "_player", "_params"];
        _params params ["_eligibleSide","_MSPObj"];
        !isNil "_MSPObj" && side _player == _eligibleSide && vehicle _player == _player && !(missionNamespace getVariable ["phx_safetyEnabled", true])
      },
      {},
      [_thisSide, _thisObj]
    ] call ace_interact_menu_fnc_createAction;

    [
      RALLYBASEOBJ,
      0,
      [PARENTACTION],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;
  } forEach _MSPPresent;



  // Aux markers
  // west_teleportAux_1
  // east_teleportAux_1
  // guer_teleportAux_1
  // civ_teleportAux_1
  private _auxMarkersPresent = [];
  for "_i" from 1 to 5 do {
    private _markStr = format["%1_teleportAux_%2", _thisSideStr, _i];
    if (markerColor _markStr != "") then {
      _auxMarkersPresent pushBack _markStr;
    };
  };


  { // add Aux marker options
    private _thisMark = _x;
    private _markNumber = str(_x) select [(count str(_x)) - 1, 1];

    private _action = [
      format["FNF_%1_auxTeleport_%2", _thisSideStr, _markNumber],
      format["Go to Aux Teleport %1", _markNumber],
      "",
      { // statement
        params ["_target", "_player", "_params"];
        _params params ["_eligibleSide", "_thisMark"];
        _pos = (markerPos _thisMark) findEmptyPosition [0, 20, typeOf _player];
        _player setPosATL _pos;
      },
      { // condition
        params ["_target", "_player", "_params"];
        _params params ["_eligibleSide", "_thisMark"];
        side _player == _eligibleSide && vehicle _player == _player && !(missionNamespace getVariable ["phx_safetyEnabled", true])
      },
      {},
      [_thisSide, _thisMark]
    ] call ace_interact_menu_fnc_createAction;

    [
      RALLYBASEOBJ,
      0,
      [PARENTACTION],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;
  } forEach _auxMarkersPresent;
} forEach [west, east, independent, civilian];


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

