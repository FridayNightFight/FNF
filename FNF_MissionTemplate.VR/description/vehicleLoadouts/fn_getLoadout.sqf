params [["_vehicle", objNull, [objNull]]];
// _vehicle = vehicle player;

if (isNull _vehicle) then {
  _vehicle = cursorObject;
};
if (isNil "_vehicle") exitWith {};

[
  {
    params ["_vehicle"];
    count (_vehicle getVariable ["turretsOriginal", []]) > 0 &&
    count (_vehicle getVariable ["turretsModified", []]) > 0
  },
  {
    params ["_vehicle"];
    private _typeOf = typeOf _vehicle;
    private _displayName = (configOf _vehicle) call BIS_fnc_displayName;
    _rawOut = [
      _displayName,
      [[
        ["className", _typeOf],
        ["displayName", _displayName],
        ["hierarchy", [configOf _vehicle, true] call BIS_fnc_returnParents],
        ["turretsOriginal", [_vehicle getVariable ["turretsOriginal", []], []] call CBA_fnc_hashCreate],
        ["turretsModified", [_vehicle getVariable ["turretsModified", []], []] call CBA_fnc_hashCreate]
      ], []] call CBA_fnc_hashCreate
    ];

    _dest = missionNamespace getVariable ["fnf_vehicleLoadout_trackChangesArr", []];
    if (_dest findIf {_x#0 == _displayName} == -1) then {
      _dest pushBackUnique _rawOut;
      missionNamespace setVariable ["fnf_vehicleLoadout_trackChangesArr", _dest];
    };
  },
  [_vehicle],
  3,
  {
    params ["_vehicle"];

    [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;

    private _typeOf = typeOf _vehicle;
    private _displayName = (configOf _vehicle) call BIS_fnc_displayName;
    _rawOut = [
      _displayName,
      [[
        ["className",_typeOf],
        ["displayName", _displayName],
        ["hierarchy", [configOf _vehicle, true] call BIS_fnc_returnParents],
        ["turretsOriginal", [_vehicle getVariable ["turretsOriginal", []], []] call CBA_fnc_hashCreate],
        ["turretsModified", ["NOT MODIFIED", []]]
      ], []] call CBA_fnc_hashCreate
    ];

    _dest = missionNamespace getVariable ["fnf_vehicleLoadout_trackChangesArr", []];
    if (_dest findIf {_x#0 == _displayName} == -1) then {
      _dest pushBackUnique _rawOut;
      missionNamespace setVariable ["fnf_vehicleLoadout_trackChangesArr", _dest];
    };
  }
] call CBA_fnc_waitUntilAndExecute;

