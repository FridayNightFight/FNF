// Key vehicles to side of safe start marker they are in

#define MISSIONVICS (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"})

private _vics = MISSIONVICS;

_sideSpecific = [];

{
  _x setVariable ["ace_vehiclelock_lockSide", west, true];
  _sideSpecific pushBack _x;
} forEach (_vics select {[_x, west] call phx_fnc_inSafeZone});

{
  _x setVariable ["ace_vehiclelock_lockSide", east, true];
  _sideSpecific pushBack _x;
} forEach (_vics select {[_x, east] call phx_fnc_inSafeZone});

{
  _x setVariable ["ace_vehiclelock_lockSide", independent, true];
  _sideSpecific pushBack _x;
} forEach (_vics select {[_x, independent] call phx_fnc_inSafeZone});


// non-safestart vehicles should be locked to combat factions
{
  _x setVariable ["ace_vehiclelock_lockSide", civilian, true];
} forEach (_vics - _sideSpecific);
