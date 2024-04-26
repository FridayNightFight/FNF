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
    if (count _records isEqualTo 0) exitWith {};
    _newestRecord = _records select 0;
    _text = _newestRecord select 2;
    _splitString = [_text, "</font><br/><marker name='AdminReportMrk_", true] call BIS_fnc_splitString;
    _text = _splitString select 1;
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

_actionSwitchSelectors = [
  "Zeus_SwitchSelectors",
  "Switch selectors for selected players",
  "\A3\ui_f\data\igui\cfg\simpleTasks\types\use_ca.paa",
  {
    curatorSelected params ["_objects","_groups","_waypoints","_markers"];
    _players = _objects select {isPlayer _x};
    {
      _status = _x getVariable ["fnf_selectorIcon", "FAILED"];
      if (_status isEqualTo "FAILED") then
      {
        [{fnf_showSelectors = true;}] remoteExec ["call", _x, false];
        ["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>Your ace selectors have been enabled, please pick the selections you want and inform an admin when you are finished!</t>", "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", _x, false];
        _icon = addMissionEventHandler ["Draw3D", {
	        drawIcon3D ["", [1,1,1,1], getPos (_thisArgs select 0), 0, 0, 0, "SELECTOR ON", 1, 0.1, "PuristaMedium", "center", true];
        }, [_x]];
        _x setVariable ["fnf_selectorIcon", _icon, false];
      } else {
        [{fnf_showSelectors = false;}] remoteExec ["call", _x, false];
        ["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>Your ace selectors have now been disabled</t>", "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", _x, false];
        removeMissionEventHandler ["Draw3D", _status];
        _x setVariable ["fnf_selectorIcon", nil, false];
      };
    } forEach _players;
  },
  {
    curatorSelected params ["_objects","_groups","_waypoints","_markers"];
    _players = _objects select {isPlayer _x};
    count _players > 0;
  }
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _actionSwitchSelectors] call ace_interact_menu_fnc_addActionToZeus;
