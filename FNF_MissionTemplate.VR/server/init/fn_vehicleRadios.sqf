// Set encryption code of vehicles to side of safe start marker they are in
private _vics = entities [["Car", "Tank", "Ship", "Plane", "Helicopter"], [], false, true];

{
  _x setVariable ["tf_side", "west", true];
  [{call TFAR_fnc_hasVehicleRadio}, {
    params ["_vehicle"];
    _radios = _vehicle call TFAR_fnc_getVehicleRadios;
    {
      [_x, "_bluefor"] call TFAR_fnc_setLrRadioCode;
    } forEach _radios;
  }, [_x], 10, {}] call CBA_fnc_waitUntilAndExecute;
} forEach (_vics select {[_x, west] call phx_fnc_inSafeZone});

{
  _x setVariable ["tf_side", "east", true];
  [{call TFAR_fnc_hasVehicleRadio}, {
    params ["_vehicle"];
    _radios = _vehicle call TFAR_fnc_getVehicleRadios;
    {
      [_x, "_opfor"] call TFAR_fnc_setLrRadioCode;
    } forEach _radios;
  }, [_x], 10, {}] call CBA_fnc_waitUntilAndExecute;
} forEach (_vics select {[_x, east] call phx_fnc_inSafeZone});

{
  _x setVariable ["tf_side", "independent", true];
  [{call TFAR_fnc_hasVehicleRadio}, {
    params ["_vehicle"];
    _radios = _vehicle call TFAR_fnc_getVehicleRadios;
    {
      [_x, "_independent"] call TFAR_fnc_setLrRadioCode;
    } forEach _radios;
  }, [_x], 10, {}] call CBA_fnc_waitUntilAndExecute;
} forEach (_vics select {[_x, independent] call phx_fnc_inSafeZone});




