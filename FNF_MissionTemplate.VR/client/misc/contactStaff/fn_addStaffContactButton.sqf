private _adminMsgButton = _display ctrlCreate ["PauseMenuSendAdminMsg", -1];
_adminMsgButton ctrlAddEventHandler ["ButtonClick", {
	[] spawn phx_fnc_contactStaff;
}];

if !((getPlayerUID player) in fnf_staffInfo) exitWith {};

private _adminKckButton = _display ctrlCreate ["PauseMenuKickPlayer", -1];
_adminKckButton ctrlAddEventHandler ["ButtonClick", {
	[] spawn phx_fnc_adminKickUI;
}];