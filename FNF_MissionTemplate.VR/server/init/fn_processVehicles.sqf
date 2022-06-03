#define MISSIONVICS (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"})
// put vehicles into a hashmap based on who they belong to (if anyone)
fnf_vehiclesToProcess = [["BLU",[]],["OPF",[]],["IND",[]],["OTHER",[]]];
{
  private _vehicle = _x;
  if (isNull _vehicle) then {continue};
  switch (true) do {
    case (_vehicle inArea "bluforSafeMarker"): {
      [fnf_vehiclesToProcess, "BLU", _vehicle] call BIS_fnc_addToPairs;
    };
    case (_vehicle inArea "opforSafeMarker"): {
      [fnf_vehiclesToProcess, "OPF", _vehicle] call BIS_fnc_addToPairs;
    };
    case (_vehicle inArea "indforSafeMarker"): {
      [fnf_vehiclesToProcess, "IND", _vehicle] call BIS_fnc_addToPairs;
    };
    default {
      [fnf_vehiclesToProcess, "OTHER", _vehicle] call BIS_fnc_addToPairs;
    };
  };
} forEach MISSIONVICS;

publicVariable "fnf_vehiclesToProcess";
