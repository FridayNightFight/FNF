params [["_unit", objNull, [objNull]], ["_side", sideEmpty, [sideEmpty]]];


// check if a unit is in a zone that should be restricted from their side

if (isNull _unit) exitWith {
  ["Warning: Unit is null"] call BIS_fnc_error;
  false
};

if (_side == sideEmpty) then {_side = side (group _unit)};



// copy array without friendly safe zones in order to search all others
private "_restrictedZones";
switch (phx_gameMode == "sustainedAssault") do {
  case false: {
    _restrictedZones = [phx_safeZones, "STD_" + (_side call BIS_fnc_sideNameUnlocalized), true] call BIS_fnc_removeFromPairs;
  };
  case true: {
    _restrictedZones = [phx_safeZones, "SA_" + (_side call BIS_fnc_sideNameUnlocalized), true] call BIS_fnc_removeFromPairs;
  };
};

// in the remaining, we have both SA and STD markers and triggers.
// validate each before checking, so nil objects and non-existent markers don't interfere.
flatten (_restrictedZones apply {_x # 1}) findIf {
  if (typeName _x == "STRING") then {
    if (markerColor _x != "") then {
      (vehicle _unit) inArea _x
    };
  } else {
    if (!isNil {missionNamespace getVariable str(_x)}) then {
      (vehicle _unit) inArea _x
    };
  };
} > -1


