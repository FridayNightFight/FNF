if !((getPlayerUID player) in (missionNamespace getVariable "fnf_staffInfo")) exitWith {};

private _adminKckButton = _display ctrlCreate ["PauseMenuKickPlayer", -1];
_adminKckButton ctrlAddEventHandler ["ButtonClick", {
	[] spawn phx_admin_fnc_adminKickUI;
}];