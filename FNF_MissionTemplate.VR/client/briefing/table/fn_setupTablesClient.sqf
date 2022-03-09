[{time > 5 && !isNil "fnf_briefing_table_objects"}, {
  (values fnf_briefing_table_objects) params (keys fnf_briefing_table_objects);
  {
    _x params ["_thisSide", "_sideTables"];
    _thisSideStr = _thisSide call BIS_fnc_sideNameUnlocalized;
    {
      private _table = _x;

      // "debug_console" callExtension str(_this);

      private _var = format["fnf_briefingTable_%1_%2", _thisSideStr, _forEachIndex + 1];
      private _name = _table getVariable "helperName";
      private _marker = _table getVariable "markerName";
      // "debug_console" callExtension str(_var);

      (fnf_ui getVariable format["%1HelperTargets", _thisSideStr]) pushBack [
        compile format["missionNamespace getVariable [""%1"", objNull]", _var],
        _name,
        "",
        false,
        _thisSide
      ];

      if (_thisSide != playerSide) then {continue};
      [_table, _marker, 10, 2, true] spawn fnf_briefing_fnc_createTable;
    } forEach (_sideTables select {!isNull _x});
  } forEach [
    [west, _west],
    [east, _east],
    [independent, _guer]
  ];
}] call CBA_fnc_waitUntilAndExecute;
