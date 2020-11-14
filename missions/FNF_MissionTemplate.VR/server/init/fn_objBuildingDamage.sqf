//disallow damage for whatever building objects the objective is under or over

sleep 0.001;
private _obj = _this select 0;
private _pos = getPosASL _obj;
private _invinc = [];

private _buildings = lineIntersectsObjs [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 20]];
_buildings = _buildings + (lineIntersectsObjs [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 20]]);

if !(count _buildings == 0) then {
  {
    if (!(_x == _obj) && !(_x in _invinc)) then {
      [_x,false] remoteExec ["allowDamage",0,_x];
      _invinc pushBack _x;
    };
  } forEach _buildings;
};

_invinc;
