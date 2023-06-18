/*
Restricts ACE team management interaction (not self-interaction) if safety is enabled or there are no dead players on the player's side.
*/

private _groupID = groupId group player;
private _blacklistGroups = ["E"];

[typeof player,1,["ACE_SelfActions","ACE_TeamManagement","ACE_LeaveGroup"]] call ace_interact_menu_fnc_removeActionFromClass; //Disable ACE group leave

//Prevent the player from joining another group
if (parseNumber _groupID == 0 && !(_groupID in _blacklistGroups)) exitWith {}; //Exit if player is in leader group

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
