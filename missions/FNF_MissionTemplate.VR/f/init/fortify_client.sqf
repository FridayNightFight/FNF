_fortifyMarker = "";
_playerItems = [];
phx_fortify_objArr = [];

if (!isNil "term1") then {
 phx_fortify_objArr append [term1];
};
if (!isNil "term2") then {
 phx_fortify_objArr append [term2];
};
if (!isNil "term1") then {
 phx_fortify_objArr append [term3];
};
if (!isNil "phx_destroyObjs") then {
 phx_fortify_objArr append phx_destroyObjs;
};

player addItem "ACE_Fortify";

switch (playerSide) do {
  case east: {_fortifyMarker = "opforSafeMarker";};
  case west: {_fortifyMarker = "bluforSafeMarker";};
  case independent: {_fortifyMarker = "indforSafeMarker";};
};

{
  if (isNull _x) then {phx_fortify_objArr = phx_fortify_objArr - [_x]};
} forEach phx_fortify_objArr;

[{
    params ["_unit", "_object", "_cost"];
    private _return = ((typeOf _unit == "O_soldier_exp_F") || (typeOf _unit == "B_soldier_exp_F") || (typeOf _unit == "I_Soldier_exp_F"));
    _return
}] call acex_fortify_fnc_addDeployHandler;

[{
    params ["_unit", "_object", "_cost"];
    _type = typeOf _object;

    private _return =
    if (_type != "Land_Plank_01_4m_F" && _type != "Land_Plank_01_8m_F" && (_type find "BagFence" == -1)) then {
      isTouchingGround _object;
    };
    _return
}] call acex_fortify_fnc_addDeployHandler;

[{
    params ["_unit", "_object", "_cost"];

    _pos = position _object;
    _minDistance = 10;
    _close = false;

    {
      if (_pos distance (position _x) < _minDistance) then {
        _close = true;
        "Too close to an objective to fortify" call phx_fnc__hintThenClear;
      };
    } forEach phx_fortify_objArr;

    if !(_pos inArea _fortifyMarker) then {
      _close = true;
      "Cannot place object outside of safestart boundary" call phx_fnc__hintThenClear;
    };

    !_close
}] call acex_fortify_fnc_addDeployHandler;
