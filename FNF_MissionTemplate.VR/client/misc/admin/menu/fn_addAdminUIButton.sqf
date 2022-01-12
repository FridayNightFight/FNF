private _admin = false;
if ((getPlayerUID player) in (missionNamespace getVariable ["fnf_staffInfo",[]])) then {_admin = true};
if (serverCommandAvailable "#kick") then {_admin = true};
if (!_admin) exitWith {};

private _adminKckButton = _display ctrlCreate ["PauseMenuKickPlayer", -1];
_adminKckButton ctrlAddEventHandler ["ButtonClick", {
	[] spawn phx_admin_fnc_adminUI;
}];
