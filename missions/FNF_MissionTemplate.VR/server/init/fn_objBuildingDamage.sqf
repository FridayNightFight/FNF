_obj = _this select 0;

_building = (nearestObjects [_obj, ["house"], 25]) select 0;
if (!isNil "_building") then {
  if (_building != _obj) then {
    _building allowDamage false;
  };
};
