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

[{
	if (serverCommandAvailable "#logout") then
	{
		_bluforNum = allPlayers select {(side _x) isEqualTo west};
		_opforNum = allPlayers select {(side _x) isEqualTo east};
		_indforNum = allPlayers select {(side _x) isEqualTo independent};
		hintSilent format["Blufor: %1\nOpfor: %2\nIndfor: %3", count _bluforNum, count _opforNum, count _indforNum];
	};
}, 1] call CBA_fnc_addPerFrameHandler;

/*_actionSwitchSelectors = [
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
[["ACE_ZeusActions"], _actionSwitchSelectors] call ace_interact_menu_fnc_addActionToZeus;*/

fnf_playerInZues = false;

if (typeOf player isEqualTo "ace_spectator_virtual") then
{
	[{
		if (isNull findDisplay 312) then
		{
			if (fnf_playerInZues) then
			{
				fnf_playerInZues = false;
				//show Mission Details button
				call FNF_ClientSide_fnc_missionDetailsButton;
			};
		} else {
			if (!fnf_playerInZues) then
			{
				fnf_playerInZues = true;
			};
		};
	}, 1] call CBA_fnc_addPerFrameHandler;
} else {
	[{
		if (isNull findDisplay 312) then
		{
			if (fnf_playerInZues) then
			{
				fnf_playerInZues = false;
				[format ["<t size='1.5' align='center'>%1 exited Zeus</t><br/><br/><t align='center'>Staff member %1 has exited zeus as a player ingame</t><br/>", (name player)], "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", 0, false];
				//show Mission Details button
				if (ace_spectator_isSet) then
				{
					call FNF_ClientSide_fnc_missionDetailsButton;
				};
			};
		} else {
			if (!fnf_playerInZues) then
			{
				fnf_playerInZues = true;
				[format ["<t size='1.5' align='center'>%1 entered Zeus</t><br/><br/><t align='center'>Staff member %1 has entered zeus as a player ingame</t><br/>", (name player)], "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", 0, false];
			};
		};
	}, 1] call CBA_fnc_addPerFrameHandler;
};
