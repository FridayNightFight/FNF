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

    private "_rawOut";
    switch (fnf_debug_loadoutStyle) do {
      case 0: {
        _rawOut = [ // this will create a JSON object
          _displayName,
          [[
            ["className", _typeOf],
            ["displayName", _displayName],
            ["hierarchy", [configOf _vehicle, true] call BIS_fnc_returnParents],
            ["turretsOriginal", [_vehicle getVariable ["turretsOriginal", []], []] call CBA_fnc_hashCreate],
            ["turretsModified", [_vehicle getVariable ["turretsModified", []], []] call CBA_fnc_hashCreate]
          ], []] call CBA_fnc_hashCreate
        ];
      };
      case 1: {
        private _arr = [
          ["className", _typeOf],
          ["displayName", _displayName],
          ["hierarchy", ([configOf _vehicle, true] call BIS_fnc_returnParents) joinString ',']
        ];

        {
          private _turretData = _x;
          if (count _turretData < 3) then {continue};
          if (typeName _turretData == "STRING") then {
            _arr pushBack [format["turretsOriginal_%1", _turretData], []];
            continue;
          };

          private _turretName  = format["turretsOriginal_%1", _turretData#0];
          // _arr pushBack [_turretName, _turretData#1];
          {
            _arr pushBack [format["%1_wep_%2", _turretName, _forEachIndex + 1], _x];
          } forEach (_turretData#2);
          {
            _arr pushBack [format["%1_pylon_%2", _turretName, _forEachIndex + 1], _x];
          } forEach (_turretData#3);
        } forEach (_vehicle getVariable ["turretsOriginal", []]);

        {
          private _turretData = _x;
          if (count _turretData < 3) then {continue};
          if (typeName _turretData == "STRING") then {
            _arr pushBack [format["turretsOriginal_%1", _x], []];
            continue;
          };

          private _turretName  = format["turretsModified_%1", _turretData#0];
          {
            _arr pushBack [format["%1_wep_%2", _turretName, _forEachIndex + 1], _x];
          } forEach (_turretData#2);
          {
            _arr pushBack [format["%1_pylon_%2", _turretName, _forEachIndex + 1], _x];
          } forEach (_turretData#3);
        } forEach (_vehicle getVariable ["turretsModified", []]);


        _rawOut = [ // this will create a JSON object
          _displayName,
          [_arr, []] call CBA_fnc_hashCreate
        ];
      };
    };

    _dest = missionNamespace getVariable ["fnf_vehicleLoadout_trackChangesArr", []];
    if (_dest findIf {_x#0 == _displayName} == -1) then {
      _dest pushBackUnique _rawOut;
      missionNamespace setVariable ["fnf_vehicleLoadout_trackChangesArr", _dest];
    };

  },
  [_vehicle],
  7,
  {
    params ["_vehicle"];

    [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;

    private _typeOf = typeOf _vehicle;
    private _displayName = (configOf _vehicle) call BIS_fnc_displayName;

    private "_rawOut";
    switch (fnf_debug_loadoutStyle) do {
      case 0: {
        _rawOut = [ // JSON object
          _displayName,
          [[
            ["className",_typeOf],
            ["displayName", _displayName],
            ["hierarchy", [configOf _vehicle, true] call BIS_fnc_returnParents],
            ["turretsOriginal", [_vehicle getVariable ["turretsOriginal", []], []] call CBA_fnc_hashCreate],
            ["turretsModified", ["NOT MODIFIED", []]]
          ], []] call CBA_fnc_hashCreate
        ];
      };
      case 1: {
        private _arr = [
          ["className", _typeOf],
          ["displayName", _displayName],
          ["hierarchy", ([configOf _vehicle, true] call BIS_fnc_returnParents) joinString ',']
        ];

        {
          private _turretData = _x;
          if (count _turretData < 3) then {continue};
          if (typeName _turretData == "STRING") then {
            _arr pushBack [format["turretsOriginal_%1", _x], []];
            continue;
          };

          private _turretName  = format["turretsOriginal_%1", _turretData#0];
          // _arr pushBack [_turretName, _turretData#1];
          {
            _arr pushBack [format["%1_wep_%2", _turretName, _forEachIndex + 1], _x];
          } forEach (_turretData#2);
          {
            _arr pushBack [format["%1_pylon_%2", _turretName, _forEachIndex + 1], _x];
          } forEach (_turretData#3);
        } forEach (_vehicle getVariable ["turretsOriginal", []]);

        _arr pushBack [
          format["turretsModified"],
          "NOT MODIFIED"
        ];

        _rawOut = [ // this will create a JSON object
          _displayName,
          [_arr, []] call CBA_fnc_hashCreate
        ];
      };
    };


    _dest = missionNamespace getVariable ["fnf_vehicleLoadout_trackChangesArr", []];
    if (_dest findIf {_x#0 == _displayName} == -1) then {
      _dest pushBackUnique _rawOut;
      missionNamespace setVariable ["fnf_vehicleLoadout_trackChangesArr", _dest];
    };


    // _rawOut = [ // this will create a JSON array
    //   ["className", _typeOf],
    //   ["displayName", _displayName],
    //   ["hierarchy", [configOf _vehicle, true] call BIS_fnc_returnParents],
    //   ["turretsOriginal", [_vehicle getVariable ["turretsOriginal", []], []] call CBA_fnc_hashCreate],
    //   ["turretsModified",  ["turretsModified", ["NOT MODIFIED", []]]]
    // ];


    // if (_dest findIf {_x#0#0 == _typeOf} == -1) then {
    //   _dest pushBackUnique _rawOut;
    //   missionNamespace setVariable ["fnf_vehicleLoadout_trackChangesArr", _dest];
    // };
  }
] call CBA_fnc_waitUntilAndExecute;

