if (isNil "fnf_briefing_table_objects" || !isServer) exitWith {};

(values fnf_briefing_table_objects) params (keys fnf_briefing_table_objects);
{
  _x params ["_thisSide", "_sideTables"];
  {
    private _table = _x;
    // [_table] spawn fnf_briefing_fnc_clearTable;
    deleteVehicle _table;
  } forEach (_sideTables select {!isNull _x});
} forEach [
  [west, _west],
  [east, _east],
  [independent, _guer]
];
