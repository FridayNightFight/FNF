if (isNil "fnf_briefing_table_objects" || !isServer) exitWith {};

(values fnf_briefing_table_objects) params (keys fnf_briefing_table_objects);
{
  _x params ["_thisSide", "_sideTables"];
  {
    private _table = _x;
    [{deleteVehicle _this}, _table, 15] call CBA_fnc_waitAndExecute;
  } forEach (_sideTables select {!isNull _x});
} forEach [
  [west, _west],
  [east, _east],
  [independent, _guer]
];
