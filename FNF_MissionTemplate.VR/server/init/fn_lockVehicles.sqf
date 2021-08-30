// Setup lock state of vehicles
private _vics = entities [["Car", "Tank", "Ship", "Plane", "Helicopter"], [], false, true];

{
    _x setVariable ["ace_vehiclelock_lockSide", west];
    _x setVehicleLock "LOCKED";
} forEach (_vics inAreaArray "bluforSafeMarker");

{
    _x setVariable ["ace_vehiclelock_lockSide", east];
    _x setVehicleLock "LOCKED";
} forEach (_vics inAreaArray "opforSafeMarker");

{
    _x setVariable ["ace_vehiclelock_lockSide", independent];
    _x setVehicleLock "LOCKED";
} forEach (_vics inAreaArray "indforSafeMarker");
