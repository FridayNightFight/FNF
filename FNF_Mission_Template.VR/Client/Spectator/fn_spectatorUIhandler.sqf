/*
	Author: ilbinek

	Description:
		Start handling of spectator UI

	Parameter(s):
		None

	Returns:
		None
*/

#define FNF_RSC_TEXT_1 	6001
#define FNF_RSC_TEXT_2 	6002
#define FNF_RSC_TEXT_3 	6003
#define FNF_RSC_TEXT_4 	6004
[
	{
    private _dialog = uiNameSpace getVariable ["FNF_spectatorUI", displayNull];
    if (!isNull _dialog) then {
      private _nbr = FNF_RSC_TEXT_1;
      {
        private _side = _x;
        private _count = ({alive _x && isPlayer _x && !(_x getVariable ["ACE_isUnconscious", false])} count units _side); // cout all players of a side that are NOT unconscious
        if (_count > 0) then {
          private _control = _dialog displayCtrl _nbr;
          private _color = _side call BIS_fnc_sideColor;
          _control ctrlSetBackgroundColor _color;
          _control ctrlSetText str(_count);
          _control ctrlCommit 0;
          _nbr = _nbr + 1;
        };
      } forEach [west, east, resistance];
      // Handle uncounscious players
      // _nbr is already set to the first available control
      private _count = ({alive _x && isPlayer _x && (_x getVariable ["ACE_isUnconscious", false])} count allPlayers); // count all players that are unconscious
      if (_count > 0) then {
        private _control = _dialog displayCtrl _nbr;
        private _color = civilian call BIS_fnc_sideColor; // Use civilian color for unconscious players
        _control ctrlSetBackgroundColor _color;
        _control ctrlSetText str(_count);
        _control ctrlCommit 0;
        _nbr = _nbr + 1;
      };

      // Secondary check, that will clear all controls if player is alive and stop the PFH - does not work for spectator slots (sideLogic)
      if (alive player && side player != sideLogic) then {
        _nbr = FNF_RSC_TEXT_1;
        FNF_spectator = false;
        ("FNF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
      };

      // Clear all controls if spectator UI is not visible
      if (!ace_spectator_uiVisible) then {
        _nbr = FNF_RSC_TEXT_1;
      };

      // Clear the rest of the controls showing
      while {_nbr <= FNF_RSC_TEXT_4} do {
        private _control = _dialog displayCtrl _nbr;
        private _color = [0, 0, 0, 0]; // Use civilian color for unconscious players
        _control ctrlSetBackgroundColor _color;
        _control ctrlSetText "";
        _control ctrlCommit 0;
        _nbr = _nbr + 1;
      };
    };
	}, 	// Code to be executed
	1, 	// Once a second
	[], // No parameters
	{}, // No start function
	{}, // No end function
	{true}, // No run condition
	{!FNF_spectator} // Will delete PFH when FNF_spectator is set to false
] call CBA_fnc_createPerFrameHandlerObject;
