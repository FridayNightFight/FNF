/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to end the game in the pause screen

	Parameter(s):
	  1: DISPLAY -  The display object of the pause screen

	Returns:
		None
*/

params ["_display"];

//Don't show display if not admin
if !(serverCommandAvailable "#kick") exitWith {};

_resolution = getResolution;
_aspectRatio = (_resolution select 0) / (_resolution select 1);

//Create side-selection combo control and populate
_bluforCtrl = _display ctrlCreate ["RscCheckBox", 34768];
_bluforCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.335 * safeZoneH + safeZoneY,
(0.03 * safeZoneW) / _aspectRatio,
0.03 * safeZoneH
];
_bluforCtrl ctrlCommit 0;

_bluforTextCtrl = _display ctrlCreate ["RscText", 34769];
_bluforTextCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX + ((0.03 * safeZoneW) / _aspectRatio),
0.335 * safeZoneH + safeZoneY,
(0.1 * safeZoneW) / _aspectRatio,
0.03 * safeZoneH
];
_bluforTextCtrl ctrlSetText "Blufor";
_bluforTextCtrl ctrlCommit 0;

_opforCtrl = _display ctrlCreate ["RscCheckBox", 34770];
_opforCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.305 * safeZoneH + safeZoneY,
(0.03 * safeZoneW) / _aspectRatio,
0.03 * safeZoneH
];
_opforCtrl ctrlCommit 0;

_opforTextCtrl = _display ctrlCreate ["RscText", 34771];
_opforTextCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX + ((0.03 * safeZoneW) / _aspectRatio),
0.305 * safeZoneH + safeZoneY,
(0.1 * safeZoneW) / _aspectRatio,
0.03 * safeZoneH
];
_opforTextCtrl ctrlSetText "Opfor";
_opforTextCtrl ctrlCommit 0;

_indiCtrl = _display ctrlCreate ["RscCheckBox", 34772];
_indiCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.275 * safeZoneH + safeZoneY,
(0.03 * safeZoneW) / _aspectRatio,
0.03 * safeZoneH
];
_indiCtrl ctrlCommit 0;

_indiTextCtrl = _display ctrlCreate ["RscText", 34773];
_indiTextCtrl ctrlSetPosition [
0.025 * safeZoneW + safeZoneX + ((0.03 * safeZoneW) / _aspectRatio),
0.275 * safeZoneH + safeZoneY,
(0.1 * safeZoneW) / _aspectRatio,
0.03 * safeZoneH
];
_indiTextCtrl ctrlSetText "Independent";
_indiTextCtrl ctrlCommit 0;

///////////////////////////////////////

//Create End Game button display
_buttonCtrl = _display ctrlCreate ["RscButton", -1];
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

  _bluforCtrl = (findDisplay 49) displayCtrl 34768;
  _opforCtrl = (findDisplay 49) displayCtrl 34770;
  _indiCtrl = (findDisplay 49) displayCtrl 34772; //Get side-selection control

  _sidesWon = [];
  if (cbChecked _bluforCtrl) then
  {
    _sidesWon pushBack west;
  };
  if (cbChecked _opforCtrl) then
  {
    _sidesWon pushBack east;
  };
  if (cbChecked _indiCtrl) then
  {
    _sidesWon pushBack independent;
  };

  //Display confirmation message and call elimination function on server
  _sidesWon spawn {
    private _sidesWon = _this;
    private _parentDisplay = findDisplay 46; //Mission display
    private _spectatorDisplay = findDisplay 60000; //ACE spectator display

    if (!isNull _spectatorDisplay) then {_parentDisplay = _spectatorDisplay}; //If ACE spectator display is active, use it for GUI message parent display

    private _result = ["Are you sure you want " + str(_sidesWon) + " to win?", "Confirm", true, true, _parentDisplay] call BIS_fnc_guiMessage;

    if (_result) then {
      [_sidesWon] remoteExec ["FNF_ServerSide_fnc_endGame",2];
    };
  };
}];
