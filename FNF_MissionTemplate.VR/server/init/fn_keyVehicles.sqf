// Key vehicles to side of safe start marker they are in 
private _vics = entities [["Car", "Tank", "Ship", "Plane", "Helicopter"], [], false, true];

_sideSpecific = [];
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

// non-safestart vehicles should be locked to combat factions
{
  _x setVariable ["ace_vehiclelock_lockSide", civilian, true];
} forEach (_vics - _sideSpecific);
