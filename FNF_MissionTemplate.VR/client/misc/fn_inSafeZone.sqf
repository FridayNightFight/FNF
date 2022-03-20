params [
  ["_unit", objNull, [objNull]],
  ["_side", sideEmpty, [sideEmpty]],
  ["_justReturnMarkers", false, [false]],
  ["_returnBool", true, [true]]
];

// check if a unit is inside a zone that is a safeZone for their side
private _safeZones = [];

if (_side != sideEmpty) then {

  // if _side IS provided, check only safezones for the side being queried
  switch (fnf_gameMode == "sustainedAssault") do {
    case false: {
      // standard markers are on a prefix system.
      // first get any prefixes specific to the side for standard, since _side != sideEmpty
      // then get any markers in mission which match any of the prefixes and add them to safe zones.
      _safeZonePrefixes = [fnf_safeZones, "STD_" + (_side call BIS_fnc_sideNameUnlocalized), []] call BIS_fnc_getFromPairs;
      {
        {_safeZones pushBackUnique _x} forEach ([_x] call BIS_fnc_getMarkers);
      } forEach _safeZonePrefixes;
    };
    case true: {
      _safeZones = [fnf_safeZones, "SA_" + (_side call BIS_fnc_sideNameUnlocalized), []] call BIS_fnc_getFromPairs;
    };
  };
} else {

  // if _side isn't provided, we're checking ALL safe zones for all sides (like vehicles)
  switch (fnf_gameMode == "sustainedAssault") do {
    case false: {
      // standard markers are on a prefix system.
      // first get any prefixes for any side for standard mode
      // then get any markers in mission which match any of the prefixes and add them to safe zones.
      _safeZonePrefixes = flatten(fnf_safeZones select {(_x select 0) find "STD_" > -1} apply {_x select 1});
      {
        {_safeZones pushBackUnique _x} forEach ([_x] call BIS_fnc_getMarkers);
      } forEach _safeZonePrefixes;
    };
    case true: {
      _safeZones = flatten(fnf_safeZones select {(_x select 0) find "SA_" > -1} apply {_x select 1});
    };
  };
};

_safeZones = _safeZones select {
  // make sure we're only checking valid markers (that are created)
  if (typeName _x == "STRING") then {
    markerShape _x != ""
  };
};

if (_justReturnMarkers) exitWith {_safeZones};

private _checkIndex = _safeZones findIf {vehicle _unit inArea _x};
if (_returnBool) exitWith {_checkIndex > -1};

if (!_returnBool) exitWith {
  if (_checkIndex == -1) exitWith {""};
  _safeZones select _checkIndex;
};

format["%1 :: %2: Improper parameters", _fnc_scriptNameParent, _fnc_scriptName] remoteExec ["systemChat", 0];
false
