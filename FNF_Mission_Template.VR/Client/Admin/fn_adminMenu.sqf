/*
	Author: Mallen (edited by Indigo)

	Description:
		Shows admin menu for admin functions

	Parameter(s):
		None

	Returns:
		None
*/

disableSerialization;

//create Admin GUI Display
if (ace_spectator_isSet) then {
	if (!isNull findDisplay 312) then
	{
		fnf_adminDisplay = [findDisplay 312 createDisplay "RscDisplayEmpty"];
	} else {
		fnf_adminDisplay = [findDisplay 60000 createDisplay "RscDisplayEmpty"];
	};
} else {
	if (!isNull findDisplay 312) then
	{
		fnf_adminDisplay = [findDisplay 312 createDisplay "RscDisplayEmpty"];
	} else {
		fnf_adminDisplay = [findDisplay 46 createDisplay "RscDisplayEmpty"];
	};
};

//Add pre defined buttons for each admin diary entry to be clicked on
_background = (fnf_adminDisplay select 0) ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0,0,1,0.8];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_playerSearch = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlEdit", 10025 ];
_playerSearch ctrlSetPosition[ 0.0125, 0.0125, 0.48125, 0.05 ];
_playerSearch ctrlCommit 0;

_playerList = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlListbox", 10000 ];
_playerList ctrlSetPosition[ 0.0125, 0.0750, 0.48125, 0.41875 ];
_playerList ctrlCommit 0;
_sideTempIndex = _playerList lbAdd "===BLUFOR===";
_playerList lbSetData [_sideTempIndex, "west"];
{
	_index = _playerList lbAdd name _x;
	_playerList lbSetData [_index, getPlayerUID _x];
} forEach (allPlayers select {side (group _x) isEqualTo west});
_sideTempIndex = _playerList lbAdd "===OPFOR===";
_playerList lbSetData [_sideTempIndex, "east"];
{
	_index = _playerList lbAdd name _x;
	_playerList lbSetData [_index, getPlayerUID _x];
} forEach (allPlayers select {side (group _x) isEqualTo east});
_sideTempIndex = _playerList lbAdd "===INDEPENDENT===";
_playerList lbSetData [_sideTempIndex, "independent"];
{
	_index = _playerList lbAdd name _x;
	_playerList lbSetData [_index, getPlayerUID _x];
} forEach (allPlayers select {side (group _x) isEqualTo independent});
_sideTempIndex = _playerList lbAdd "===CIVILIAN===";
_playerList lbSetData [_sideTempIndex, "civilian"];
{
	_index = _playerList lbAdd name _x;
	_playerList lbSetData [_index, getPlayerUID _x];
} forEach (allPlayers select {side (group _x) isEqualTo civilian});
_sideTempIndex = _playerList lbAdd "===LOGIC===";
_playerList lbSetData [_sideTempIndex, "sideLogic"];
{
	_index = _playerList lbAdd name _x;
	_playerList lbSetData [_index, getPlayerUID _x];
} forEach (allPlayers select {side (group _x) isEqualTo sideLogic});
_playerList lbSetCurSel 0;

_resetAnimButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10003 ];
_resetAnimButton ctrlSetPosition[ 0.0125, 0.58, 0.2, 0.05 ];
_resetAnimButton ctrlCommit 0;
_resetAnimButton ctrlSetText "Reset Anim State";

_copyUIDButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10004 ];
_copyUIDButton ctrlSetPosition[ 0.29375, 0.58, 0.2, 0.05 ];
_copyUIDButton ctrlCommit 0;
_copyUIDButton ctrlSetText "Copy Player UID";

_respawnPlayerButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10005 ];
_respawnPlayerButton ctrlSetPosition[ 0.0125, 0.66, 0.2, 0.05 ];
_respawnPlayerButton ctrlCommit 0;
_respawnPlayerButton ctrlSetText "Respawn Player";

_killPlayerButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10006 ];
_killPlayerButton ctrlSetPosition[ 0.0125, 0.74, 0.2, 0.05 ];
_killPlayerButton ctrlCommit 0;
_killPlayerButton ctrlSetText "Kill Player";
_killPlayerButton ctrlSetTextColor [1,0,0,1];

_kickPlayerButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10007 ];
_kickPlayerButton ctrlSetPosition[ 0.29375, 0.66, 0.2, 0.05 ];
_kickPlayerButton ctrlCommit 0;
_kickPlayerButton ctrlSetText "Kick Player";
_kickPlayerButton ctrlSetTextColor [1,0.9,0,1];

_banPlayerButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10008 ];
_banPlayerButton ctrlSetPosition[ 0.29375, 0.74, 0.2, 0.05 ];
_banPlayerButton ctrlCommit 0;
_banPlayerButton ctrlSetText "Ban Player";
_banPlayerButton ctrlSetTextColor [1,0,0,1];

_playerMessageBox = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlEdit", 10011 ];
_playerMessageBox ctrlSetPosition[ 0.5125, 0.0125, 0.475, 0.05 ];
_playerMessageBox ctrlCommit 0;

_playerMessageButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10012 ];
_playerMessageButton ctrlSetPosition[ 0.5125, 0.075, 0.475, 0.05 ];
_playerMessageButton ctrlCommit 0;
_playerMessageButton ctrlSetText "Send Message to Player or Side";

_playerMessageAllButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10013 ];
_playerMessageAllButton ctrlSetPosition[ 0.5125, 0.1375, 0.475, 0.05 ];
_playerMessageAllButton ctrlCommit 0;
_playerMessageAllButton ctrlSetText "Send Message to All Players";

_objConfirmList = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlListbox", 10014 ];
_objConfirmList ctrlSetPosition[ 0.5125, 0.2, 0.475, 0.51 ];
_objConfirmList ctrlCommit 0;

//get objectives to put on list
_modules = call FNF_ClientSide_fnc_findFNFModules;
_objModules = [_modules, "assassinObj"] call FNF_ClientSide_fnc_findSpecificModules;
_objModules = [_objModules] call FNF_ClientSide_fnc_sortByLocation;

{
	_syncedObjects = synchronizedObjects _x;

	//find the target thats supposed to be killed or protected
	_playerObject = objNull;
	{
		if (isPlayer _x) then
		{
			_playerObject = _x;
		};
	} forEach _syncedObjects;

	_status = "Null";
	_targetName = _x getVariable ["fnf_targetName", "Unknown Name"];

	if (not isNull _playerObject) then
	{
		_status = "DEAD";
		_targetName = name _playerObject;
		if (alive _playerObject) then
		{
			_status = "Alive";
		};
	};
	_serverState = _x getVariable ["fnf_objServerState", 3];
	if (_serverState isEqualTo 4 or _serverState isEqualTo 5) then
	{
		_status = "COMPLETED";
	};
	_objectiveType = _x getVariable ["fnf_objectiveType", "FAILED"];
	_objTempIndex = _objConfirmList lbAdd (format["Assassin Obj %1 - Status: %2 Target: %3", _objectiveType, _status, _targetName]);
} forEach _objModules;

_objConfirmButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10015 ];
_objConfirmButton ctrlSetPosition[ 0.5125, 0.74, 0.475, 0.05 ];
_objConfirmButton ctrlCommit 0;
_objConfirmButton ctrlSetText "Confirm Objective Complete";

fnf_adminMenu_searchPFH = [{
	_playerList = (fnf_adminDisplay select 0) displayCtrl 10000;
	_searchBox = (fnf_adminDisplay select 0) displayCtrl 10025;
	_searchTerm = ctrlText _searchBox;

	lbClear _playerList;

	if (_searchTerm isEqualTo "") exitWith {
		_sideTempIndex = _playerList lbAdd "===BLUFOR===";
		_playerList lbSetData [_sideTempIndex, "west"];
		{
			_index = _playerList lbAdd name _x;
			_playerList lbSetData [_index, getPlayerUID _x];
		} forEach (allPlayers select {side (group _x) isEqualTo west});
		_sideTempIndex = _playerList lbAdd "===OPFOR===";
		_playerList lbSetData [_sideTempIndex, "east"];
		{
			_index = _playerList lbAdd name _x;
			_playerList lbSetData [_index, getPlayerUID _x];
		} forEach (allPlayers select {side (group _x) isEqualTo east});
		_sideTempIndex = _playerList lbAdd "===INDEPENDENT===";
		_playerList lbSetData [_sideTempIndex, "independent"];
		{
			_index = _playerList lbAdd name _x;
			_playerList lbSetData [_index, getPlayerUID _x];
		} forEach (allPlayers select {side (group _x) isEqualTo independent});
		_sideTempIndex = _playerList lbAdd "===CIVILIAN===";
		_playerList lbSetData [_sideTempIndex, "civilian"];
		{
			_index = _playerList lbAdd name _x;
			_playerList lbSetData [_index, getPlayerUID _x];
		} forEach (allPlayers select {side (group _x) isEqualTo civilian});
		_sideTempIndex = _playerList lbAdd "===LOGIC===";
		_playerList lbSetData [_sideTempIndex, "sideLogic"];
		{
			_index = _playerList lbAdd name _x;
			_playerList lbSetData [_index, getPlayerUID _x];
		} forEach (allPlayers select {side (group _x) isEqualTo sideLogic});
	};

	_sideTempIndex = _playerList lbAdd "===BLUFOR===";
	_playerList lbSetData [_sideTempIndex, "west"];
	{
		_index = _playerList lbAdd name _x;
		_playerList lbSetData [_index, getPlayerUID _x];
	} forEach (allPlayers select {side (group _x) isEqualTo west} select {[_searchTerm, name _x] call BIS_fnc_inString});
	_sideTempIndex = _playerList lbAdd "===OPFOR===";
	_playerList lbSetData [_sideTempIndex, "east"];
	{
		_index = _playerList lbAdd name _x;
		_playerList lbSetData [_index, getPlayerUID _x];
	} forEach (allPlayers select {side (group _x) isEqualTo east} select {[_searchTerm, name _x] call BIS_fnc_inString});
	_sideTempIndex = _playerList lbAdd "===INDEPENDENT===";
	_playerList lbSetData [_sideTempIndex, "independent"];
	{
		_index = _playerList lbAdd name _x;
		_playerList lbSetData [_index, getPlayerUID _x];
	} forEach (allPlayers select {side (group _x) isEqualTo independent} select {[_searchTerm, name _x] call BIS_fnc_inString});
	_sideTempIndex = _playerList lbAdd "===CIVILIAN===";
	_playerList lbSetData [_sideTempIndex, "civilian"];
	{
		_index = _playerList lbAdd name _x;
		_playerList lbSetData [_index, getPlayerUID _x];
	} forEach (allPlayers select {side (group _x) isEqualTo civilian} select {[_searchTerm, name _x] call BIS_fnc_inString});
	_sideTempIndex = _playerList lbAdd "===LOGIC===";
	_playerList lbSetData [_sideTempIndex, "sideLogic"];
	{
		_index = _playerList lbAdd name _x;
		_playerList lbSetData [_index, getPlayerUID _x];
	} forEach (allPlayers select {side (group _x) isEqualTo sideLogic} select {[_searchTerm, name _x] call BIS_fnc_inString});

}, 0.5] call CBA_fnc_addPerFrameHandler;

_background ctrlAddEventHandler[ "Destroy", {
	params ["_control", "_exitCode"];
	if (!isNil "fnf_admin_searchPFH") then {
		[fnf_adminMenu_searchPFH] call CBA_fnc_removePerFrameHandler;
	};
	showChat true;
}];

_kickPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_kickPlayerButton" ];

	_playerList = ctrlParent _kickPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selectedData = _playerList lbData _selectedIndex;
	_playerData = _selectedData call BIS_fnc_getUnitByUID;

	if (serverCommandExecutable "#kick") then {
		serverCommand ("#kick " + (name _playerData));
	} else {
		hint "You need to be logged in as admin to do this";
	};
}];

_banPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_banPlayerButton" ];

	if (not serverCommandExecutable "#ban") exitWith {hint "You need to be logged in as admin to do this"};

	_banPlayerButton = _this select 0;

	_background = (fnf_adminDisplay select 0) ctrlCreate ["IGUIBack", 10021];
	_background ctrlSetPosition [1,0.4,0.3,0.3];
	_background ctrlSetBackgroundColor [0,0,0,0.5];
	_background ctrlCommit 0;

	_text = (fnf_adminDisplay select 0) ctrlCreate ["ctrlStructuredText", 10022];
	_text ctrlSetPosition [1.0125,0.42,0.275,0.15];
	_text ctrlCommit 0;
	_text ctrlSetText "Warning! This will permanantly ban the selected player, this can only be reversed by a member of the Technical Team";

	_confirmButton = (fnf_adminDisplay select 0) ctrlCreate ["ctrlButton", 10023];
	_confirmButton ctrlSetPosition [1.05,0.58,0.2,0.1];
	_confirmButton ctrlCommit 0;
	_confirmButton ctrlSetText "Confirm Ban";

	_confirmButton ctrlAddEventHandler[ "ButtonClick", {
		params["_confirmButton"];
		_background = (fnf_adminDisplay select 0) displayCtrl 10021;
		_text = (fnf_adminDisplay select 0) displayCtrl 10022;
		_confirmButton = (fnf_adminDisplay select 0) displayCtrl 10023;

		_playerList = ctrlParent (_this select 0) displayCtrl 10000;
		_selectedIndex = lbCurSel _playerList;
		_selectedData = _playerList lbData _selectedIndex;
		_playerData = _selectedData call BIS_fnc_getUnitByUID;

		if (serverCommandExecutable "#ban") then {
			serverCommand ("#ban " + (name _playerData));
		} else {
			hint "You need to be logged in as admin to do this";
		};

		ctrlDelete _background;
		ctrlDelete _text;
		ctrlDelete _confirmButton;
	}];
}];

_resetAnimButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_resetAnimButton" ];

	_playerList = ctrlParent _resetAnimButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selectedData = _playerList lbData _selectedIndex;
	_playerData = _selectedData call BIS_fnc_getUnitByUID;

	[] remoteExec ["ace_common_fnc_headBugFix", _playerData, false];
}];

_killPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_killPlayerButton" ];

	_playerList = ctrlParent _killPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selectedData = _playerList lbData _selectedIndex;
	_playerData = _selectedData call BIS_fnc_getUnitByUID;

	_playerData setDamage 1;
}];


_respawnPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_respawnPlayerButton" ];

	_playerList = ctrlParent _respawnPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selectedData = _playerList lbData _selectedIndex;
	_playerData = _selectedData call BIS_fnc_getUnitByUID;

	[] remoteExec ["FNF_ClientSide_fnc_respawnPlayer", _playerData, false];
}];


_copyUIDButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_copyUIDButton" ];

	_playerList = ctrlParent _copyUIDButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbData _selectedIndex;

	copyToClipboard _selected;
}];


_playerMessageButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_playerMessageButton" ];

	_playerList = ctrlParent _playerMessageButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selectedData = _playerList lbData _selectedIndex;
	_playerData = _selectedData call BIS_fnc_getUnitByUID;

	_sideToMessage = sideEmpty;
	switch (_selectedData) do
	{
		case "west": {_sideToMessage = west};
		case "east": {_sideToMessage = east};
		case "independent": {_sideToMessage = independent};
		case "civilian": {_sideToMessage = civilian};
		case "sideLogic": {_sideToMessage = sideLogic};
	};

	_selected = _sideToMessage;

	if (_sideToMessage isEqualTo sideEmpty) then
	{
		_playerData = _selectedData call BIS_fnc_getUnitByUID;
		_selected = _playerData;
	};

	_playerMessageBox = ctrlParent _playerMessageButton displayCtrl 10011;
	_messageText = ctrlText _playerMessageBox;

	_adminName = name player;

	[format["<t align='center' size='1.4' color='#FFFF00'>ADMIN MESSAGE</t><t align='center'><br/><br/>%1<br/><br/>Sent by %2</t>", _messageText, _adminName], "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", _selected, false];
}];


_playerMessageAllButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_playerMessageAllButton" ];

	_playerMessageBox = ctrlParent _playerMessageAllButton displayCtrl 10011;
	_messageText = ctrlText _playerMessageBox;

	_adminName = name player;

	[format["<t align='center' size='1.4' color='#FFFF00'>ADMIN MESSAGE</t><t align='center'><br/><br/>%1<br/><br/>Sent by %2</t>", _messageText, _adminName], "deep-purple", 20] remoteExec ["FNF_ClientSide_fnc_notificationSystem", -2, false];
}];

_objConfirmButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_objConfirmButton" ];

	_objConfirmList = ctrlParent _objConfirmButton displayCtrl 10014;
	_selectedIndex = lbCurSel _objConfirmList;

	_modules = call FNF_ClientSide_fnc_findFNFModules;
	_objModules = [_modules, "assassinObj"] call FNF_ClientSide_fnc_findSpecificModules;
	_objModules = [_objModules] call FNF_ClientSide_fnc_sortByLocation;

	_selectedObjModule = (_objModules select _selectedIndex);
	_objType = _selectedObjModule getVariable ["fnf_objectiveType", "elm"];
	if (_objType isEqualTo "elm") then
	{
		_selectedObjModule setVariable ["fnf_objServerState", 4, true];
	} else {
		_selectedObjModule setVariable ["fnf_objServerState", 5, true];
	};
}];
