if (isDedicated) exitWith {};

if (typeOf player == "ace_spectator_virtual") exitWith {call FNF_ClientSide_fnc_init;};

if (hasInterface and isServer) exitwith {call FNF_ClientSide_fnc_init;};
