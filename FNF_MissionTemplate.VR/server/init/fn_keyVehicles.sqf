// Key vehicles to side of safe start marker they are in

#define MISSIONVICS (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"})

private _vics = MISSIONVICS;

_sideSpecific = [];

switch (phx_gameMode == "sustainedAssault") do {
  case false: {
    {
      _x setVariable ["ace_vehiclelock_lockSide", west, true];
      _sideSpecific pushBack _x;
    } forEach (_vics inAreaArray "bluforSafeMarker");

    {
      _x setVariable ["ace_vehiclelock_lockSide", east, true];
      _sideSpecific pushBack _x;
    } forEach (_vics inAreaArray "opforSafeMarker");

    {
      _x setVariable ["ace_vehiclelock_lockSide", independent, true];
      _sideSpecific pushBack _x;
    } forEach (_vics inAreaArray "indforSafeMarker");
  };
  case true: {
    {
      _x setVariable ["ace_vehiclelock_lockSide", west, true];
      _sideSpecific pushBack _x;
    } forEach ((_vics inAreaArray safeZone_BLUFOR) + (_vics inAreaArray "rally_west_marker"));

    {
      _x setVariable ["ace_vehiclelock_lockSide", east, true];
      _sideSpecific pushBack _x;
    } forEach ((_vics inAreaArray safeZone_OPFOR) + (_vics inAreaArray "rally_east_marker"));

    {
      _x setVariable ["ace_vehiclelock_lockSide", independent, true];
      _sideSpecific pushBack _x;
    } forEach ((_vics inAreaArray safeZone_Independent) + (_vics inAreaArray "rally_independent_marker"));
  };
};

// non-safestart vehicles should be locked to combat factions
{
  _x setVariable ["ace_vehiclelock_lockSide", civilian, true];
} forEach (_vics - _sideSpecific);
