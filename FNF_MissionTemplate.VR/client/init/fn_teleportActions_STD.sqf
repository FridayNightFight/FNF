// see also fnf_server_fnc_setupGame



// this is Standard, don't run if SA
if !(fnf_gameMode != "sustainedAssault") exitWith {};


{
  private _thisSide = _x;
  private _thisSideStr = toLower(_thisSide call BIS_fnc_sideNameUnlocalized);
  private _flagPrefix = format["%1_safeZone_flag_", _thisSideStr];
  private _safeMarkerPrefix = format["%1_safeZone_marker_", _thisSideStr];

  private _flagsPresent = missionNamespace getVariable [format["fnf_%1_safeZone_flags", _thisSideStr], []];

  if (count _flagsPresent > 0) then {
    { // for each side flag present
      private _thisFlag = _x;

      #define PARENTACTION format["FNF_%1_TeleportOptions", _thisSideStr]
      // create parent ACE Action for teleport options
      private _action = [
        PARENTACTION,
        format["%1 Teleport Options", _thisSide call BIS_fnc_sideName],
        "",{},{(missionNamespace getVariable ["fnf_safetyEnabled", true])},{},[],[-0.05,-0.35,-2],6] call ace_interact_menu_fnc_createAction;
      [_thisFlag,0,[],_action] call ace_interact_menu_fnc_addActionToObject;


      { // add actions for this flag that will TP the player to others
        private _otherFlag = _x;
        // get number of flag based on varname, last character
        private _otherFlagNum = str(_x) select [(count str(_x)) - 1, 1];

        private _action = [
          format["FNF_%1_safeZone_Teleport_%2", _thisSideStr, _otherFlagNum],
          format["Go to Safezone %1", _otherFlagNum],
          "",
          { // statement
            params ["_target", "_player", "_params"];
            _params params ["_eligibleSide", "_otherFlag", "_otherFlagNum"];
            _pos = (getPos _otherFlag) findEmptyPosition [0, 20, typeOf _player];
            _pos set [2, (getPosASL _otherFlag)#2];
            _player setPosASL _pos;
            systemChat format["You've teleported to SafeZone %1", _otherFlagNum];
          },
          { // condition
            params ["_target", "_player", "_params"];
            _params params ["_eligibleSide", "_otherFlag", "_otherFlagNum"];
            side _player == _eligibleSide && vehicle _player == _player && (missionNamespace getVariable ["fnf_safetyEnabled", true])
          },
          {},
          [_thisSide, _otherFlag, _otherFlagNum]
        ] call ace_interact_menu_fnc_createAction;


        [
          _thisFlag,
          0,
          [PARENTACTION],
          _action
        ] call ace_interact_menu_fnc_addActionToObject;
      } forEach (_flagsPresent - [_thisFlag]);

    } forEach _flagsPresent;
  };
} forEach [west, east, independent];


["FNF_Safety_Ended", {
  {
    _marks = [format["safeZone_flagmarker_%1_", _x]] call BIS_fnc_getMarkers;
    _marks apply {deleteMarkerLocal _x};
  } forEach ([west, east, independent] apply {_x call BIS_fnc_sideNameUnlocalized});
  [_thisType, _thisId] call CBA_fnc_removeEventHandler;
}] call CBA_fnc_addEventHandlerArgs;



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
