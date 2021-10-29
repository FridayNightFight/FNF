disableSerialization;

//create Admin GUI Display
private "_display";
if (ace_spectator_isSet) then {
	_display = findDisplay 60000 createDisplay "RscDisplayEmpty";
} else {
	_display = findDisplay 46 createDisplay "RscDisplayEmpty";
};

//Add pre defined buttons for each admin diary entry to be clicked on
_background = _display ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0.275,0,0.45,1];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_playerList = _display ctrlCreate[ "ctrlListbox", 10000 ];
_playerList ctrlSetPosition[ 0.3, 0.04, 0.4, 0.8 ];
_playerList ctrlCommit 0;
{
	_playerList lbAdd name _x;
} forEach ( allPlayers - [ player ] );
_playerList lbSetCurSel 0;

_kickButton = _display ctrlCreate[ "ctrlButton", 10001 ];
_kickButton ctrlSetPosition[ 0.3, 0.86, 0.4, 0.1 ];
_kickButton	ctrlCommit 0;
_kickButton ctrlSetText "Kick Player";

_kickButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_kickButton" ];
	
	_playerList = ctrlParent _kickButton displayCtrl 10000;
	_selected = (lbSelection _playerList) select 0;

	_selected remoteExec ["phx_fnc_kickPlayer", 2];
	
}];