params ["_enabled", "_data"];

{
  private _hash = createHashMapFromArray _x;
  (values _hash) params (keys _hash);

  [
    {
      _this spawn BIS_fnc_fireSupportVirtual;
    },
    [_target, _mag, _radius, _rounds, _delay, _conditionEnd, _safeZone, _spawnAlt, _speed],
    _startDelay
  ] call CBA_fnc_waitAndExecute;
} forEach _data;

