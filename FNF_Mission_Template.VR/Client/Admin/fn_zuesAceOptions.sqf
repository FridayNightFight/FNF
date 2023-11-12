/*
	Author: Mallen

	Description:
		Adds zues interactions to quickly perform admin actions

	Parameter(s):
	  None

	Returns:
		None
*/

_actionGoToLastReport = [
  "Zeus_GoToLastReport",
  "Zoom to Last Admin Report",
  "\A3\ui_f\data\igui\cfg\simpleTasks\types\heal_ca.paa",
  {
    _records = player allDiaryRecords "adminMessages";
    if (count _records == 0) exitWith {};
    _newestRecord = _records select 0;
    _text = _newestRecord select 2;
    systemChat _text;
    _splitString = [_text, "</font><br/><marker name='AdminReportMrk_", true] call BIS_fnc_splitString;
    systemChat str(_splitString);
    _text = _splitString select 1;
    systemChat _text;
    _splitString = [_text, "'>Go to position of report</marker><br/><br/>MESSAGE:</font><br/><font face='RobotoCondensed'>", true] call BIS_fnc_splitString;
    _marker = "AdminReportMrk_" + (_splitString select 0);
    [
      (((getMarkerPos _marker) getPos [50, 180]) vectorAdd [0,0,30]),
      getMarkerPos _marker,
      0
    ] spawn BIS_fnc_setCuratorCamera;
  },
  {true}
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _actionGoToLastReport] call ace_interact_menu_fnc_addActionToZeus;
