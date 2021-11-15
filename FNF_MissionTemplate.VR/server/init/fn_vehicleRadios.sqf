// Set encryption code of vehicles to side of safe start marker they are in
private _vics = entities [["Car", "Tank", "Ship", "Plane", "Helicopter"], [], false, true];

{
  _x setVariable ["tf_side", "west", true];
  [{call TFAR_fnc_hasVehicleRadio}, {
    params ["_vehicle"];
    _radios = _vehicle call TFAR_fnc_getVehicleRadios;
    {
      [_x, "blufor"] call TFAR_fnc_setLrRadioCode;
    } forEach _radios;
  }, [_x], 10, {}] call CBA_fnc_waitUntilAndExecute;
} forEach (_vics inAreaArray "bluforSafeMarker");

{
  _x setVariable ["tf_side", "east", true];
  [{call TFAR_fnc_hasVehicleRadio}, {
    params ["_vehicle"];
    "debug_console" callExtension str(_this);

    _radios = _vehicle call TFAR_fnc_getVehicleRadios;
    {
      [_x, "opfor"] call TFAR_fnc_setLrRadioCode;
    } forEach _radios;
  }, [_x], 10, {}] call CBA_fnc_waitUntilAndExecute;
} forEach (_vics inAreaArray "opforSafeMarker");

{
  _x setVariable ["tf_side", "independent", true];
  [{call TFAR_fnc_hasVehicleRadio}, {
    params ["_vehicle"];
    _radios = _vehicle call TFAR_fnc_getVehicleRadios;
    {
      [_x, "indfor"] call TFAR_fnc_setLrRadioCode;
    } forEach _radios;
  }, [_x], 10, {}] call CBA_fnc_waitUntilAndExecute;
} forEach (_vics inAreaArray "indforSafeMarker");




