disableSerialization;

//create Admin GUI Display
_adminGUI = findDisplay 60000 createDisplay "RscDisplayEmpty";

//Add pre defined buttons for each admin diary entry to be clicked on
_background = _adminGUI ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0.25,0,0.5,0.83];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_playerList = _adminGUI ctrlCreate[ "ctrlListbox", 10000 ];
_playerList ctrlSetPosition[ -0.3, 0.02, 0.48793, 0.744756 ];
_playerList ctrlCommit 0;
{
	_playerList lbAdd name _x;
} forEach ( allPlayers - [ player ] );
_playerList lbSetCurSel 0;

_kickButton = _adminGUI ctrlCreate[ "ctrlButton", 10001 ];
_kickButton ctrlSetPosition[ 0.625, 0.2, 0.423497, 0.276817 ];
_kickButton	ctrlCommit 0;
_kickButton ctrlSetText "Kick Player";

_kickButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_kickButton" ];
	
	_playerList = ctrlParent _kickButton displayCtrl 10000;
	_selected = (lbSelection _playerList) select 0;

	_selected remoteExec ["phx_fnc_kickPlayer", 2];
	
}];