if (isNil "fnf_briefing_table_objects" || !hasInterface) exitWith {};

(values fnf_briefing_table_objects) params (keys fnf_briefing_table_objects);
{
  _x params ["_thisSide", "_sideTables"];
  {
    private _table = _x;
    private _handle = [_table] spawn fnf_briefing_fnc_clearTable;
    waitUntil {scriptDone _handle};
  } forEach (_sideTables select {!isNull _x});
} forEach [
  [west, _west],
  [east, _east],
  [independent, _guer]
];
