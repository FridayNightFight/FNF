/*
	Author: Mallen

	Description:
		notify an admin if the server beleives an assassin objective is complete

	Parameter(s):
		0: BOOLEAN -	Whether the player is dead or not
		1: STRING -	The name of the player supposidly occupying VIP slot

	Returns:
		None
*/

params ["_playerDead", "_playerName"];

fnf_staffInfo = [
  "76561198004582151",
  "76561198089279362",
  "76561198106536334",
  "76561198045877943",
  "76561197963359463",
  "76561198077070073",
  "76561197972754614",
  "76561198111741251",
  //Mallen, For testing:
  "76561198061743924"
];

//if player is not logged in admin, kick them
if (not ((getPlayerUID player) in fnf_staffInfo)) exitWith {};

if (_playerDead) then
{
	["<t align='center' size='1.4' color='#FFFF00'>ADMIN ATTENTION</t><t align='center'><br/><br/>Assassin objective has reported target is dead, please find target with name: " + _playerName + " and confirm his death</t>", "deep-purple", 5] call FNF_ClientSide_fnc_notificationSystem;
} else {
	["<t align='center' size='1.4' color='#FFFF00'>ADMIN ATTENTION</t><t align='center'><br/><br/>Assassin objective has reported target cannot be found, please confirm whether objective is complete</t>", "deep-purple", 5] call FNF_ClientSide_fnc_notificationSystem;
};

