if (!isServer) exitWith {};

call phx_fnc_serverSafety;

_mark = str term1 + "Mark";
deleteMarker _mark;

[{!isNil "phx_safetyEndTime"}, {call phx_fnc_checkTime}] call CBA_fnc_waitUntilAndExecute;

call PHX_fnc_terminalServerSetup;
