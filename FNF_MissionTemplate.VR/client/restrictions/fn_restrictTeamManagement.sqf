/*
Restricts ACE team management interaction (not self-interaction) if safety is enabled or there are no dead players on the player's side.
*/

fnf_teamManagementEH = ["ace_interactMenuOpened", {
  params ["_menuType"];

  if (_menuType == 1) exitWith {ace_interaction_enableTeamManagement = true}; //exit and enable if self interaction

  if (missionNamespace getVariable ["fnf_safetyEnabled",true] || count (allDeadMen select {[_x, true] call BIS_fnc_objectSide == playerSide && _x in playableUnits}) == 0) then {
    ace_interaction_enableTeamManagement = false;
  } else {
    ace_interaction_enableTeamManagement = true;
    ["ace_interactMenuOpened", fnf_teamManagementEH] call CBA_fnc_removeEventHandler;
  };
}] call CBA_fnc_addEventHandler;
