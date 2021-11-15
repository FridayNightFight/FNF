// Key vehicles to side of safe start marker they are in 
private _vics = entities [["Car", "Tank", "Ship", "Plane", "Helicopter"], [], false, true];

{
    _x setVariable ["ace_vehiclelock_lockSide", west, true];
} forEach (_vics inAreaArray "bluforSafeMarker");

{
    _x setVariable ["ace_vehiclelock_lockSide", east, true];
} forEach (_vics inAreaArray "opforSafeMarker");

{
    _x setVariable ["ace_vehiclelock_lockSide", independent, true];
} forEach (_vics inAreaArray "indforSafeMarker");
