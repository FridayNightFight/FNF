if (!isServer) exitWith {};

call phx_fnc_serverSafety;

[{!isNil "phx_safetyEndTime"}, {call phx_fnc_checkTime}] call CBA_fnc_waitUntilAndExecute;

call PHX_fnc_terminalServerSetup;
