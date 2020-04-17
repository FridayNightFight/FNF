if !((playerSide == phx_defendingSide) && phx_allowFortify && ((typeOf player == "B_soldier_exp_F") || (typeOf player == "O_soldier_exp_F") || (typeOf player == "I_Soldier_exp_F"))) exitWith {};

phx_fortifyNoFire = player addEventHandler ["FiredMan", {
   params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

   deleteVehicle _projectile;

   if (_muzzle in phx_safetyMuzzles) then {
     player addItem _magazine;
   };
}];

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

switch (playerSide) do {
  case east: {phx_fortifyMarker = "opforSafeMarker";};
  case west: {phx_fortifyMarker = "bluforSafeMarker";};
  case independent: {phx_fortifyMarker = "indforSafeMarker";};
};

{
  if (isNull _x) then {phx_fortify_objArr = phx_fortify_objArr - [_x]};
} forEach phx_fortify_objArr;

[{
    params ["_unit", "_object", "_cost"];
    private _canPlace = true;
    private _type = typeOf _object;
    private _pos = position _object;
    private _minDistance = 15;
    private _errorStr = "";

    if !((typeOf _unit == "O_soldier_exp_F") || (typeOf _unit == "B_soldier_exp_F") || (typeOf _unit == "I_Soldier_exp_F")) then {
      _canPlace = false;
      _errorStr = "Cannot place object. You are not a combat engineer.";
    };

    if (_type != "Land_Plank_01_4m_F" && _type != "Land_Plank_01_8m_F" && (_type find "BagFence" == -1)) then {
      if !(isTouchingGround _object) then {
        _canPlace = false;
        _errorStr = "Cannot place object. Object must be touching a surface."
      };
    };

    {
      if (_pos distance (position _x) < _minDistance) then {
        _canPlace = false;
        _errorStr = format ["Cannot place object. Object needs to be at least %1 meters away from an objective.", _minDistance];
      };
    } forEach phx_fortify_objArr;

    if !(_pos inArea phx_fortifyMarker) then {
      _canPlace = false;
      _errorStr = "Cannot place object. Object needs to be within safestart boundary."
    };

    hintSilent _errorStr;

    if (_canPlace) then {
      switch (playerSide) do {
        case east: {
          missionNamespace setVariable ["acex_fortify_budget_east", -1, false];
        };
        case west: {
          missionNamespace setVariable ["acex_fortify_budget_west", -1, false];
        };
        case independent: {
          missionNamespace setVariable ["acex_fortify_budget_guer", -1, false];
        };
      };
      phx_fortifyPoints = phx_fortifyPoints - _cost;
      hintSilent format ["Fortify Budget: $%1", phx_fortifyPoints];
    };

    _canPlace
}] call acex_fortify_fnc_addDeployHandler;

["acex_fortify_objectDeleted", {
  private _type = typeOf (_this select 2);
  private _fortifyObjsArr = [];
  private _fortifyVarStr = "";
  private _cost = 0;

  switch (playerSide) do {
    case east: {
      _fortifyVarStr = "acex_fortify_objects_east";
    };
    case west: {
      _fortifyVarStr = "acex_fortify_objects_west";
    };
    case independent: {
      _fortifyVarStr = "acex_fortify_objects_guer";
    };
  };

  _fortifyObjsArr = missionNamespace getVariable _fortifyVarStr;

  {
    if ((_x select 0) isEqualTo _type) then {
      _cost = (_x select 1);
    };
  } forEach _fortifyObjsArr;

  phx_fortifyPoints = phx_fortifyPoints + _cost;

  hintSilent format ["Fortify Budget: $%1", phx_fortifyPoints];
}] call CBA_fnc_addEventHandler;

["ace_interactMenuOpened", {
  if ((_this select 0) == 0) exitWith {};

  switch (playerSide) do {
    case east: {
      missionNamespace setVariable ["acex_fortify_budget_east", phx_fortifyPoints, false];
    };
    case west: {
      missionNamespace setVariable ["acex_fortify_budget_west", phx_fortifyPoints, false];
    };
    case independent: {
      missionNamespace setVariable ["acex_fortify_budget_guer", phx_fortifyPoints, false];
    };
  };
}] call CBA_fnc_addEventHandler;

phx_fortifyPlacing = [{
  if (acex_fortify_isPlacing == -1) then {
    if (!isNil "phx_safeStartNoFire") then {
      player removeAction phx_safeStartNoFire;
      phx_safeStartNoFire = nil;
    };
  } else {
    if (isNil "phx_safeStartNoFire") then {
      phx_safeStartNoFire = player addAction ["", {}, nil, 0, false, true, "defaultAction", "
      {
        _this setWeaponReloadingTime [_this, _x, 1];
      } forEach phx_safetyMuzzles;
      "];
    };
  };
} , 0.25, []] call CBA_fnc_addPerFrameHandler;
