/*
Creates a control on the pause screen to generate the lobby text
*/

params ["_display"];

//Don't show display if not local game
if (!isServer) exitWith {};

//Create End Game button display
private _buttonCtrl = _display ctrlCreate ["RscButton", -1];
_buttonCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.4 * safeZoneH + safeZoneY,
0.09 * safeZoneW,
0.03 * safeZoneH
];
_buttonCtrl ctrlCommit 0;
_buttonCtrl ctrlSetText "Generate Lobby Text";

//Add script to button selection
_buttonCtrl ctrlAddEventHandler ["ButtonDown", {
  call phx_fnc_lobbyTextGenerator;
  hint "Lobby text copied to clipboard\nDon't forget to change the attacker's advantage (10% is standard)";
}];
