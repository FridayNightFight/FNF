/*
	Author: Mallen

	Description:
		Used to make spectator and local testing work correctly

	Parameter(s):
		None

	Returns:
		None
*/

if (isDedicated) exitWith {};

if (typeOf player isEqualTo "ace_spectator_virtual") exitWith {call FNF_ClientSide_fnc_init;};

if (hasInterface and isServer) exitwith {call FNF_ClientSide_fnc_init;};
