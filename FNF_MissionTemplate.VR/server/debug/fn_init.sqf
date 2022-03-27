if (!isServer) exitWith {false};
if !(missionNamespace getVariable ["fnf_debug", false]) exitWith {};

[{getClientStateNumber > 8}, {

  {[_x] call fnf_vehicleLoadouts_fnc_getLoadout} forEach (vehicles select {_x isKindOf "AllVehicles"});

}] call CBA_fnc_waitUntilAndExecute;

true
