/*
	Author: Mallen

	Description:
		Sets up the ORBAT tab

	Parameter(s):
		None

	Returns:
		None
*/

player createDiarySubject ["orbat", "ORBAT", "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa"];

_orbatRecord = player createDiaryRecord ["orbat", ["My Orbat", ""]];

[_orbatRecord] call FNF_ClientSide_fnc_updateOrbat;

[{
	[(_this select 0 select 0)] call FNF_ClientSide_fnc_updateOrbat;
}, 2, [_orbatRecord]] call CBA_fnc_addPerFrameHandler
