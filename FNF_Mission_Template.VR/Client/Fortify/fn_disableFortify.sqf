/*
	Author: Mallen

	Description:
		Disables the ability to place fortify objects and attempts to have players drop fortify items they pick up

	Parameter(s):
		None

	Returns:
		None
*/

//if fortify is already disabled exit
if (not isNil "fnf_fortifyDisabled") exitWith {};

fnf_fortifyDisabled = true;

//if player has a fortify item, remove it
if ([player, "ACE_Fortify"] call BIS_fnc_hasItem) then
{
  player removeItems "ACE_Fortify";
};


[{
  //if player can drop a fortify tool that means he has one and will drop it
  _result = [player, "ACE_Fortify"] call CBA_fnc_dropItem;
  if (_result) then
  {
    //if fortify tool has been dropped let player know why it was dropped
    ["<t align='center'>You cannot currently hold a fortify tool, it has been dropped at your feet</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;
  };
  //check if player has multiple fortify tools (unlikely but possible) and force player to drop all of them on the floor
  while {_result} do
  {
    _result = [player, "ACE_Fortify"] call CBA_fnc_dropItem;
  };
}, 1] call CBA_fnc_addPerFrameHandler;
//this is not perfect and can lead to <1 second where a player could concievabley destroy a fortify placed object
//the only way to fix this would be to have the check be per frame
//this also should in theory never come up in normal gameplay and even if it was done would literally be of no use at all

//make it impossible to place a fortify object (swiss cheese approach)
[{false;}] call acex_fortify_fnc_addDeployHandler;
