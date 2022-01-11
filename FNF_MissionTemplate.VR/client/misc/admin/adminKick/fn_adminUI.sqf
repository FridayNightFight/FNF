disableSerialization;

//create Admin GUI Display
if (ace_spectator_isSet) then {
	phx_adminDisplay = [findDisplay 60000 createDisplay "RscDisplayEmpty"];
} else {
	phx_adminDisplay = [findDisplay 46 createDisplay "RscDisplayEmpty"];
};

//Add pre defined buttons for each admin diary entry to be clicked on
_background = (phx_adminDisplay select 0) ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0,0,1,0.8];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_playerList = (phx_adminDisplay select 0) ctrlCreate[ "ctrlListbox", 10000 ];
_playerList ctrlSetPosition[ 0.0125, 0.0125, 0.48125, 0.48125 ];
_playerList ctrlCommit 0;

_playerList lbAdd "===BLUFOR===";
{
	_playerList lbAdd name _x;
} forEach (allPlayers select {side (group _x) == west});

_playerList lbAdd "===OPFOR===";
{
	_playerList lbAdd name _x;
} forEach (allPlayers select {side (group _x) == east});

_playerList lbAdd "===INDEPENDENT===";
{
	_playerList lbAdd name _x;
} forEach (allPlayers select {side (group _x) == independent});

_playerList lbSetCurSel 0;

_loadoutCombo = (phx_adminDisplay select 0) ctrlCreate[ "ctrlCombo", 10001 ];
_loadoutCombo ctrlSetPosition[ 0.0125, 0.50625, 0.32, 0.05 ];
_loadoutCombo ctrlCommit 0;

_loadoutButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10002 ];
_loadoutButton ctrlSetPosition[ 0.34375, 0.50625, 0.15, 0.05 ];
_loadoutButton ctrlCommit 0;
_loadoutButton ctrlSetText "Give Loadout";

_resetAnimButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10003 ];
_resetAnimButton ctrlSetPosition[ 0.0125, 0.58, 0.2, 0.05 ];
_resetAnimButton ctrlCommit 0;
_resetAnimButton ctrlSetText "Reset Anim State";

_copyUIDButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10004 ];
_copyUIDButton ctrlSetPosition[ 0.29375, 0.58, 0.2, 0.05 ];
_copyUIDButton ctrlCommit 0;
_copyUIDButton ctrlSetText "Copy Player UID";

_respawnPlayerButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10005 ];
_respawnPlayerButton ctrlSetPosition[ 0.0125, 0.66, 0.2, 0.05 ];
_respawnPlayerButton ctrlCommit 0;
_respawnPlayerButton ctrlSetText "Respawn Player";

_killPlayerButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10006 ];
_killPlayerButton ctrlSetPosition[ 0.0125, 0.74, 0.2, 0.05 ];
_killPlayerButton ctrlCommit 0;
_killPlayerButton ctrlSetText "Kill Player";
_killPlayerButton ctrlSetTextColor [1,0,0,1];

_kickPlayerButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10007 ];
_kickPlayerButton ctrlSetPosition[ 0.29375, 0.66, 0.2, 0.05 ];
_kickPlayerButton ctrlCommit 0;
_kickPlayerButton ctrlSetText "Kick Player";
_kickPlayerButton ctrlSetTextColor [1,0.9,0,1];

_banPlayerButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10008 ];
_banPlayerButton ctrlSetPosition[ 0.29375, 0.74, 0.2, 0.05 ];
_banPlayerButton ctrlCommit 0;
_banPlayerButton ctrlSetText "Ban Player";
_banPlayerButton ctrlSetTextColor [1,0,0,1];

_indiCombo = (phx_adminDisplay select 0) ctrlCreate[ "ctrlCombo", 10009 ];
_indiCombo ctrlSetPosition[ 0.5125, 0.02, 0.17, 0.05 ];
_indiCombo ctrlCommit 0;

_setIndiButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10010 ];
_setIndiButton ctrlSetPosition[ 0.7, 0.02, 0.29, 0.05 ];
_setIndiButton ctrlCommit 0;
_setIndiButton ctrlSetText "Set Indfor Allegiance";

_gameTimeSlider = (phx_adminDisplay select 0) ctrlCreate[ "ctrlXSliderH", 10011 ];
_gameTimeSlider ctrlSetPosition[ 0.5125, 0.1, 0.475, 0.05 ];
_gameTimeSlider ctrlCommit 0;

_gameTimeText = (phx_adminDisplay select 0) ctrlCreate[ "ctrlStructuredText", 10012 ];
_gameTimeText ctrlSetPosition[ 0.6, 0.22, 0.3, 0.05 ];
_gameTimeText ctrlCommit 0;
_gameTimeText ctrlSetText "%1 Minutes";

_gameTimeButton = (phx_adminDisplay select 0) ctrlCreate[ "ctrlButton", 10013 ];
_gameTimeButton ctrlSetPosition[ 0.6, 0.3, 0.3, 0.05 ];
_gameTimeButton ctrlCommit 0;
_gameTimeButton ctrlSetText "Adjust Game Clock";

_kickPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_kickPlayerButton" ];

	_playerList = ctrlParent _kickPlayerButton displayCtrl 10000;
	_selectedIndex = lbCurSel _playerList;
	_selected = _playerList lbText _selectedIndex;

  _dataToSend = ["kick", _selected];

	_dataToSend remoteExec ["phx_admin_fnc_serverCommands", 2];
}];

_banPlayerButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_banPlayerButton" ];

  _banPlayerButton = _this select 0;

  _background = (phx_adminDisplay select 0) ctrlCreate ["IGUIBack", -1];
  _background ctrlSetPosition [1,0.4,0.3,0.3];
  _background ctrlSetBackgroundColor [0,0,0,0.5];
  _background ctrlCommit 0;

  _text = (phx_adminDisplay select 0) ctrlCreate ["ctrlStructuredText", -1];
  _text ctrlSetPosition [1.0125,0.42,0.275,0.15];
  _text ctrlCommit 0;
  _text ctrlSetText "Warning! This will permanantly ban the selected player, this can only be reversed by a member of the Technical Team";

  _confirmButton = (phx_adminDisplay select 0) ctrlCreate ["ctrlButton", 10020];
  _confirmButton ctrlSetPosition [1.05,0.58,0.2,0.1];
  _confirmButton ctrlCommit 0;
  _confirmButton ctrlSetText "Confirm Ban";

  _confirmButton ctrlAddEventHandler[ "ButtonClick", {
	  params[ "_banPlayerButton" , "_background" , "_text" , "_confirmButton" ];
    ctrlDelete (_this select 1);
    ctrlDelete (_this select 2);
    ctrlDelete (_this select 3);

	  _playerList = ctrlParent (_this select 0) displayCtrl 10000;
	  _selectedIndex = lbCurSel _playerList;
	  _selected = _playerList lbText _selectedIndex;

    _dataToSend = ["ban", _selected];

	  _dataToSend remoteExec ["phx_admin_fnc_serverCommands", 2];
  }];
}];
