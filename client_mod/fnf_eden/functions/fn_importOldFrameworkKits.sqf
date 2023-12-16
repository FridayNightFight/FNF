/*
	Author: Mallen

	Description:
		Imports the kits from the old framework into the new one on selected units

	Parameter(s):
	  None

	Returns:
		None
*/

disableSerialization;

_display = findDisplay 313 createDisplay "RscDisplayEmpty";

//create text box to type message in to
_ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
_ctrlEdit = _display ctrlCreate ["RscEditMulti", 123, _ctrlGroup];
_ctrlButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
_ctrlGroup ctrlCommit 0;
_ctrlBackground ctrlSetPosition [0, 0, 0.5, 0.5];
_ctrlBackground ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.9];
_ctrlBackground ctrlSetText "Paste Loadout Export";
_ctrlBackground ctrlEnable false;
_ctrlBackground ctrlCommit 0;
_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.48, 0.34];
_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_ctrlEdit ctrlCommit 0;
_ctrlButton ctrlSetPosition [0.185, 0.42, 0.13, 0.05];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlSetText "SUBMIT";

//add eventhandeler for button
_ctrlButton ctrlAddEventHandler ["ButtonClick",
{
	params ["_ctrl"];
	_display = ctrlParent _ctrl;
	_text = ctrlText (_display displayCtrl 123);

	if (_text isEqualTo "") then {
		_display closeDisplay 1;
	} else {
    _input = createHashMapFromArray (parseSimpleArray _text);

    _players = get3DENSelected "object";

    {
      _description = (_x get3DENAttribute "description") select 0;
      _role = (_description splitString "@") select 0;
      _loadoutToSet = getUnitLoadout _x;
      switch (_role) do {
        case "Company Commander": {_loadoutToSet = _input get "CC"};
        case "Executive Officer": {_loadoutToSet = _input get "EO"};
        case "Section Leader";
        case "Platoon Leader": {_loadoutToSet = _input get "PL"};
        case "Company Sergeant";
        case "Platoon Sergeant": {_loadoutToSet = _input get "SGT"};
        case "Squad Leader": {_loadoutToSet = _input get "SL"};
        case "Automatic Rifleman": {_loadoutToSet = _input get "AR"};
        case "Asst. Automatic Rifleman": {_loadoutToSet = _input get "ARA"};
        case "Grenadier": {_loadoutToSet = _input get "GR"};
        case "Machine Gunner": {_loadoutToSet = _input get "MG"};
        case "Asst. Machine Gunner": {_loadoutToSet = _input get "MGA"};
        case "Combat Engineer": {_loadoutToSet = _input get "CE"};
        case "Rifleman (LAT)": {_loadoutToSet = _input get "LAT"};
        case "Missile Specialist": {_loadoutToSet = _input get "MAT1"};
        case "Asst. Missile Specialist": {_loadoutToSet = _input get "MATA1"};
        case "Ammo Bearer": {_loadoutToSet = _input get "AB"};
        case "Marksman": {_loadoutToSet = _input get "DM"};
        case "Vehicle Commander": {_loadoutToSet = _input get "CRL"};
        case "Vehicle Gunner";
        case "Vehicle Driver": {_loadoutToSet = _input get "CR"};
        case "Pilot";
        case "Co-Pilot/Gunner";
        case "Gunner": {_loadoutToSet = _input get "PI"};
        case "Medic": {_loadoutToSet = _input get "MED"};
      };
      _x setUnitLoadout _loadoutToSet;
    } forEach _players;

    save3DENInventory _players;

		_display closeDisplay 1;
	};
}];
ctrlSetFocus _ctrlEdit;
_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
_ctrlGroup ctrlCommit 0.1;
