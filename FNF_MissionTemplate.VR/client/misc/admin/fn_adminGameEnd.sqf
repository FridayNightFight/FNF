/*
Creates a control on the pause screen for the game admin to select a winning side.
Generally only used for manual game end from side elimination.
*/

params ["_display"];

//Don't show display if not admin, still safestart, or game has already ended
if !(serverCommandAvailable "#kick") exitWith {};
if (missionNamespace getVariable ["phx_safetyEnabled", true]) exitWith {};
if (missionNamespace getVariable ["phx_gameEnd",false]) exitWith {};

//Create side-selection combo control and populate
private _listCtrl = _display ctrlCreate ["RscCombo", 34768];
_listCtrl ctrlSetPosition [
0.08 * safeZoneW + safeZoneX,
0.365 * safeZoneH + safeZoneY,
0.08 * safeZoneW,
0.03 * safeZoneH
];
_listCtrl ctrlCommit 0;
_listCtrl lbAdd "Select Side";
_listCtrl lbAdd "BLUFOR Wins";
_listCtrl lbAdd "OPFOR Wins";
_listCtrl lbAdd "INDFOR Wins";
_listCtrl lbAdd "CIVILIAN Wins";
_listCtrl lbSetCurSel 0;

_listCtrl lbSetColor [1, [0,0,1,1]];
_listCtrl lbSetColor [2, [0.7,0,0,1]];
_listCtrl lbSetColor [3, [0,0.7,0,1]];
_listCtrl lbSetColor [4, [0.6,0,1,1]];

///////////////////////////////////////

//Create End Game button display
private _buttonCtrl = _display ctrlCreate ["RscButton", -1];
_buttonCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.365 * safeZoneH + safeZoneY,
0.05 * safeZoneW,
0.03 * safeZoneH
];
_buttonCtrl ctrlCommit 0;
_buttonCtrl ctrlSetText "End Game";

//Add script to button selection
_buttonCtrl ctrlAddEventHandler ["ButtonDown", {
  if (missionNamespace getVariable ["phx_gameEnd",false]) exitWith {};

  private _ctrl = (findDisplay 49) displayCtrl 34768; //Get side-selection control
  private _selectionIndex = lbCurSel _ctrl;
  if (_selectionIndex < 1) exitWith {}; //Exit if nothing or the default is selected

  //Get side from selected control index
  private _sideWon = switch (_selectionIndex) do {
    case 1: {west};
    case 2: {east};
    case 3: {independent};
    case 4: {civilian};
  };

  //Display confirmation message and call elimination function on server
  _sideWon spawn {
    private _sideWon = _this;
    private _sideWonText = _sideWon call BIS_fnc_sideName;
    private _parentDisplay = findDisplay 46; //Mission display
    private _spectatorDisplay = findDisplay 60000; //ACE spectator display

    if (!isNull _spectatorDisplay) then {_parentDisplay = _spectatorDisplay}; //If ACE spectator display is active, use it for GUI message parent display

    private _result = [format ["Are you sure you want %1 to win?", _sideWonText], "Confirm", true, true, _parentDisplay] call BIS_fnc_guiMessage;

    if (_result) then {
      [_sideWon] remoteExec ["phx_server_fnc_endElimination",2];
    };
  };
}];
