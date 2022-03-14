if (!isServer || !(missionNamespace getVariable ["fnf_debug", false])) exitWith {false};

[{getClientStateNumber > 8}, {
  {[_x] call fnf_vehicleLoadouts_fnc_getLoadout} forEach (vehicles select {_x isKindOf "AllVehicles"});


}] call CBA_fnc_waitUntilAndExecute;

true
/*
  data variable:
    fnf_vehicleLoadout_trackChangesArr
  format:
    JSON
  Usage:
    _hash = [fnf_vehicleLoadout_trackChangesArr, []] call CBA_fnc_hashCreate; _outJSON = [_hash] call CBA_fnc_encodeJSON; text _outJSON;
*/
