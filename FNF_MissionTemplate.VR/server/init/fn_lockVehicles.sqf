// Lock unoccupied vehicles in safe start areas
private _vics = entities [["Car", "Tank", "Ship", "Plane", "Helicopter"], [], false, true];

_vics inAreaArray "bluforSafeMarker"
    select { count crew _x == 0 }
    apply { _x setVehicleLock "LOCKED" };

_vics inAreaArray "opforSafeMarker"
    select { count crew _x == 0 }
    apply { _x setVehicleLock "LOCKED" };

_vics inAreaArray "indforSafeMarker"
    select { count crew _x == 0 }
    apply { _x setVehicleLock "LOCKED" };
