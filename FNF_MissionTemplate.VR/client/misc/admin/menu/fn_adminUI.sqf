disableSerialization;

//create Admin GUI Display
if (ace_spectator_isSet) then {
	fnf_adminDisplay = [findDisplay 60000 createDisplay "RscDisplayEmpty"];
} else {
	fnf_adminDisplay = [findDisplay 46 createDisplay "RscDisplayEmpty"];
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
_playerList lbAdd "===BLUFOR===";
{
	private _index = _playerList lbAdd name _x;
  _playerList lbSetData [_index, getPlayerID _x];
} forEach (allPlayers select {side (group _x) == west});
_playerList lbAdd "===OPFOR===";
{
	private _index = _playerList lbAdd name _x;
  _playerList lbSetData [_index, getPlayerID _x];
} forEach (allPlayers select {side (group _x) == east});
_playerList lbAdd "===INDEPENDENT===";
{
	private _index = _playerList lbAdd name _x;
  _playerList lbSetData [_index, getPlayerID _x];
} forEach (allPlayers select {side (group _x) == independent});
_playerList lbAdd "===CIVILIAN===";
{
	private _index = _playerList lbAdd name _x;
  _playerList lbSetData [_index, getPlayerID _x];
} forEach (allPlayers select {side (group _x) == civilian});
_playerList lbAdd "===LOGIC===";
{
	private _index = _playerList lbAdd name _x;
  _playerList lbSetData [_index, getPlayerID _x];
} forEach (allPlayers select {side (group _x) == sideLogic});
_playerList lbSetCurSel 0;


_loadoutCombo = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlCombo", 10001 ];
_loadoutCombo ctrlSetPosition[ 0.0125, 0.50625, 0.32, 0.05 ];
_loadoutCombo ctrlCommit 0;
{
  private _index = _loadoutCombo lbAdd format["%1 (%2)", (_x select 1) select 0, _x select 0];
  _loadoutCombo lbSetData [_index, _x select 0];
} forEach fnf_loadout_roles;
_loadoutCombo lbSetCurSel 0;

_loadoutButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10002 ];
_loadoutButton ctrlSetPosition[ 0.34375, 0.50625, 0.15, 0.05 ];
_loadoutButton ctrlCommit 0;
_loadoutButton ctrlSetText "Give Loadout";

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

_indiCombo = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlCombo", 10009 ];
_indiCombo ctrlSetPosition[ 0.5125, 0.0125, 0.17, 0.05 ];
_indiCombo ctrlCommit 0;

// populate combo selection w/ sideIDs of west, east, sideEmpty
// lbSetData takes string values only
private _index = _indiCombo lbAdd "NONE";
_indiCombo lbSetData [_index, str(sideEmpty call BIS_fnc_sideID)];
{
  private _index = _indiCombo lbAdd (_x call BIS_fnc_sideName);
  _indiCombo lbSetData [_index, str(_x call BIS_fnc_sideID)];
} forEach [west, east];

_indiCombo lbSetCurSel 0;

_setIndiButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10010 ];
_setIndiButton ctrlSetPosition[ 0.7, 0.0125, 0.29, 0.05 ];
_setIndiButton ctrlCommit 0;
_setIndiButton ctrlSetText "Set Indfor Allegiance";

_playerMessageBox = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlEdit", 10011 ];
_playerMessageBox ctrlSetPosition[ 0.5125, 0.1, 0.475, 0.05 ];
_playerMessageBox ctrlCommit 0;

_playerMessageButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10012 ];
_playerMessageButton ctrlSetPosition[ 0.5125, 0.1625, 0.475, 0.05 ];
_playerMessageButton ctrlCommit 0;
_playerMessageButton ctrlSetText "Send Messsage to Player";

_playerMessageAllButton = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10012 ];
_playerMessageAllButton ctrlSetPosition[ 0.5125, 0.225, 0.475, 0.05 ];
_playerMessageAllButton ctrlCommit 0;
_playerMessageAllButton ctrlSetText "Send Messsage to All Players";

_resultReadout = (fnf_adminDisplay select 0) ctrlCreate[ "ctrlStructuredText", 10020 ];
_resultReadout ctrlSetPosition[ 0.5125, 0.58, 0.4775, 0.21 ];
_resultReadout ctrlSetBackgroundColor [0, 0, 0, 0.6];
_resultReadout ctrlCommit 0;
_resultReadout ctrlSetText "[RESULTS HERE]";

fnf_admin_searchPFH = [{
  _playerList = (fnf_adminDisplay select 0) displayCtrl 10000;
  _searchBox = (fnf_adminDisplay select 0) displayCtrl 10025;
  _searchTerm = ctrlText _searchBox;

  lbClear _playerList;

  if (_searchTerm == "") exitWith {
    _tempIndex = _playerList lbAdd "===BLUFOR===";
    _playerList lbSetData [_tempIndex, "west"];
    {
	    private _index = _playerList lbAdd name _x;
      _playerList lbSetData [_index, getPlayerID _x];
    } forEach (allPlayers select {side (group _x) == west});
    _tempIndex = _playerList lbAdd "===OPFOR===";
    _playerList lbSetData [_tempIndex, "east"];
    {
    	private _index = _playerList lbAdd name _x;
      _playerList lbSetData [_index, getPlayerID _x];
    } forEach (allPlayers select {side (group _x) == east});
    _tempIndex = _playerList lbAdd "===INDEPENDENT===";
    _playerList lbSetData [_tempIndex, "independent"];
    {
    	private _index = _playerList lbAdd name _x;
      _playerList lbSetData [_index, getPlayerID _x];
    } forEach (allPlayers select {side (group _x) == independent});
    _tempIndex = _playerList lbAdd "===CIVILIAN===";
    _playerList lbSetData [_tempIndex, "civilian"];
    {
    	private _index = _playerList lbAdd name _x;
      _playerList lbSetData [_index, getPlayerID _x];
    } forEach (allPlayers select {side (group _x) == civilian});
    _tempIndex = _playerList lbAdd "===LOGIC===";
    _playerList lbSetData [_tempIndex, "sideLogic"];
    {
    	private _index = _playerList lbAdd name _x;
      _playerList lbSetData [_index, getPlayerID _x];
    } forEach (allPlayers select {side (group _x) == sideLogic});
  };

  _tempIndex = _playerList lbAdd "===BLUFOR===";
  _playerList lbSetData [_tempIndex, "west"];
  {
	  private _index = _playerList lbAdd name _x;
    _playerList lbSetData [_index, getPlayerID _x];
  } forEach (allPlayers select {side (group _x) == west} select {[_searchTerm, name _x] call BIS_fnc_inString});
  _tempIndex = _playerList lbAdd "===OPFOR===";
  _playerList lbSetData [_tempIndex, "east"];
  {
	  private _index = _playerList lbAdd name _x;
    _playerList lbSetData [_index, getPlayerID _x];
  } forEach (allPlayers select {side (group _x) == east} select {[_searchTerm, name _x] call BIS_fnc_inString});
  _tempIndex = _playerList lbAdd "===INDEPENDENT===";
  _playerList lbSetData [_tempIndex, "independent"];
  {
  	private _index = _playerList lbAdd name _x;
    _playerList lbSetData [_index, getPlayerID _x];
  } forEach (allPlayers select {side (group _x) == independent} select {[_searchTerm, name _x] call BIS_fnc_inString});
  _tempIndex = _playerList lbAdd "===CIVILIAN===";
  _playerList lbSetData [_tempIndex, "civilian"];
  {
  	private _index = _playerList lbAdd name _x;
    _playerList lbSetData [_index, getPlayerID _x];
  } forEach (allPlayers select {side (group _x) == civilian} select {[_searchTerm, name _x] call BIS_fnc_inString});
  _tempIndex = _playerList lbAdd "===LOGIC===";
  _playerList lbSetData [_tempIndex, "sideLogic"];
  {
  	private _index = _playerList lbAdd name _x;
    _playerList lbSetData [_index, getPlayerID _x];
  } forEach (allPlayers select {side (group _x) == sideLogic} select {[_searchTerm, name _x] call BIS_fnc_inString});

}, 0.5] call CBA_fnc_addPerFrameHandler;

_background ctrlAddEventHandler[ "Destroy", {
  params ["_control", "_exitCode"];
  if (!isNil "fnf_admin_searchPFH") then {
    [fnf_admin_searchPFH] call CBA_fnc_removePerFrameHandler;
  };
}];

_kickPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_kickPlayerButton" ];

	_playerList = ctrlParent _kickPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbData _selectedIndex;

  _dataToSend = ["kick", _selected, getPlayerId player];

	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];

_banPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_banPlayerButton" ];

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
	  _selected = _playerList lbData _selectedIndex;

    _dataToSend = ["ban", _selected, getPlayerId player];

	  // _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
    ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;

    ctrlDelete _background;
    ctrlDelete _text;
    ctrlDelete _confirmButton;
  }];
}];


_setIndiButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_setIndiButton" ];

  _indiCombo = ctrlParent _setIndiButton displayCtrl 10009;
	_selectedIndex = lbCurSel _indiCombo;
	_selected = _indiCombo lbData _selectedIndex;

  _dataToSend = ["setIndforAllegiance", _selected, getPlayerId player];
	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];

_loadoutButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_loadoutButton" ];

  private _selected = [];
	_playerList = ctrlParent _loadoutButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected pushBack (_playerList lbData _selectedIndex);

  _loadoutCombo = ctrlParent _loadoutButton displayCtrl 10001;
	_selectedIndex = lbCurSel _loadoutCombo;
  _selected pushBack (_loadoutCombo lbText _selectedIndex);
	_selected pushBack (_loadoutCombo lbData _selectedIndex);


  _dataToSend = ["setLoadout", _selected, getPlayerId player];

	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];

_resetAnimButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_resetAnimButton" ];

	_playerList = ctrlParent _resetAnimButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbData _selectedIndex;

  _dataToSend = ["resetAnimState", _selected, getPlayerId player];

	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];

_killPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_killPlayerButton" ];

	_playerList = ctrlParent _killPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbData _selectedIndex;

  _dataToSend = ["killPlayer", _selected, getPlayerId player];

	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];


_respawnPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_respawnPlayerButton" ];

	_playerList = ctrlParent _respawnPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbData _selectedIndex;

  _dataToSend = ["respawnPlayer", _selected, getPlayerId player];

	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];


_copyUIDButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_copyUIDButton" ];

	_playerList = ctrlParent _copyUIDButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbData _selectedIndex;

  _dataToSend = ["copyPlayerUIDs", _selected, getPlayerId player];

	// _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];


_playerMessageButton ctrlAddEventHandler[ "ButtonClick", {
  params[ "_playerMessageButton" ];

  private _selected = [];
  _playerList = ctrlParent _playerMessageButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
  _playerData = _playerList lbData _selectedIndex;

  _sideToMessage = sideEmpty;
  switch (_playerData) do
  {
    case "west": {_sideToMessage = west};
    case "east": {_sideToMessage = east};
    case "independent": {_sideToMessage = independent};
    case "civilian": {_sideToMessage = civilian};
    case "sideLogic": {_sideToMessage = sideLogic};
  };

  if !(_sideToMessage == sideEmpty) then {
    _tempWriteTo = [];
    {
      _tempWriteTo pushBack (getPlayerID _x);
    } forEach (allPlayers select {side (group _x) == _sideToMessage});
    _selected pushBack (_tempWriteTo);
  } else {
    _selected pushBack ([_playerData]);
  };

  _playerMessageBox = ctrlParent _playerMessageButton displayCtrl 10011;
  _messageText = ctrlText _playerMessageBox;
  _selected pushBack (_messageText);

  _dataToSend = ["messagePlayer", _selected, getPlayerId player];

  // _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];


_playerMessageAllButton ctrlAddEventHandler[ "ButtonClick", {
  params[ "_playerMessageAllButton" ];

  _playerMessageBox = ctrlParent _playerMessageAllButton displayCtrl 10011;
  _messageText = ctrlText _playerMessageBox;

  _dataToSend = ["messageAllPlayers", _messageText, getPlayerId player];

  // _dataToSend remoteExec ["fnf_admin_fnc_serverCommands", 2];
  ["FNF_UIPanelAdmin_ButtonClicked", _dataToSend] call CBA_fnc_serverEvent;
}];
