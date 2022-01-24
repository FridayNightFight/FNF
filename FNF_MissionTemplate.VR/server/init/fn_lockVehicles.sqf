// Lock unoccupied vehicles in safe start areas
#define MISSIONVICS (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"})

private _vics = MISSIONVICS;

if (phx_gameMode != "sustainedAssault") then {
  _vics inAreaArray "bluforSafeMarker"
    select { count crew _x == 0 }
    apply { _x setVehicleLock "LOCKED" };

  _vics inAreaArray "opforSafeMarker"
    select { count crew _x == 0 }
    apply { _x setVehicleLock "LOCKED" };

  _vics inAreaArray "indforSafeMarker"
    select { count crew _x == 0 }
    apply { _x setVehicleLock "LOCKED" };
};
