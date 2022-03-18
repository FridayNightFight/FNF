// AUTOMATED VEHICLE LOADOUTS
// JSON
// fnf_debug_loadoutStyle = 0;
// _hash = [fnf_vehicleLoadout_trackChangesArr, []] call CBA_fnc_hashCreate; _outJSON = [_hash] call CBA_fnc_encodeJSON; text _outJSON;
// HTML (strings)
fnf_debug_loadoutStyle = 1;
// _outJSON = [fnf_vehicleLoadout_trackChangesArr apply {_x#1}] call CBA_fnc_encodeJSON; text _outJSON;
/*
  data variable:
    fnf_vehicleLoadout_trackChangesArr
  format:
    JSON
  Usage:
    if using JSON objects:
      _hash = [fnf_vehicleLoadout_trackChangesArr, []] call CBA_fnc_hashCreate; _outJSON = [_hash] call CBA_fnc_encodeJSON; text _outJSON;
    if using JSON arrays for HTML conversion:

*/
