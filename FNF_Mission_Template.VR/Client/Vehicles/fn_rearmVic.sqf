/*
	Author: Mallen

	Description:
		Used to overide ace re-arm full vic rearm function with fnf defined function

	Parameter(s):
		None

	Returns:
		None
*/

params ["_truck", "_player", "_vehicle"];

[
	180,
	[_truck, _vehicle, _player],
	{
		_this remoteExec ["FNF_ServerSide_fnc_rearmVic", 2, false];
	},
	"",
	format[localize "STR_ACE_rearm_BasicRearmAction", getText(configOf _vehicle >> "displayName")],
	{
		param [0] params ["", "_vehicle", "_player"];
		_player distance _vehicle <= ace_rearm_distance;
	},
	["isnotinside"]
] call ace_common_fnc_progressBar;
