params [["_unit", objNull, [objNull]], ["_side", sideEmpty, [sideEmpty]]];

// check if a unit is inside a zone that is a safeZone for their side

if (isNull _unit) exitWith {
  ["Warning: Unit is null"] call BIS_fnc_error;
  false
};

if (_side == sideEmpty) then {_side = side (group _unit)};

private "_safeZones";
switch (phx_gameMode == "sustainedAssault") do {
  case false: {
    _safeZones = [phx_safeZones, "STD_" + (_side call BIS_fnc_sideNameUnlocalized), []] call BIS_fnc_getFromPairs;
  };
  case true: {
    _safeZones = [phx_safeZones, "SA_" + (_side call BIS_fnc_sideNameUnlocalized), []] call BIS_fnc_getFromPairs;
  };
};

_safeZones findIf {vehicle _unit inArea _x} > -1
