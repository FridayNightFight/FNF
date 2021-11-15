phx_fortify_objArr = [];

[{!isNil "term1"}, {phx_fortify_objArr append [term1]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "term2"}, {phx_fortify_objArr append [term2]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "term3"}, {phx_fortify_objArr append [term3]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "phx_destroyObjs"}, {phx_fortify_objArr append phx_destroyObjs}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "ctf_flag"}, {phx_fortify_objArr append [ctf_flag]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "ctf_attackTrig"}, {phx_fortify_objArr append [ctf_attackTrig]}, [], 10] call CBA_fnc_waitUntilAndExecute;

[{
  {
    if (isNull _x) then {phx_fortify_objArr = phx_fortify_objArr - [_x]};
  } forEach phx_fortify_objArr;
}, [], 15] call CBA_fnc_waitAndExecute;

if (phx_gameMode == "connection" || phx_gameMode == "neutralSector") exitWith {};
if (!(playerSide == phx_defendingSide) || phx_fortifyPoints <= 0) exitWith {};

#define PLAYERLOADOUTVAR (player getVariable "phxLoadout")
if (PLAYERLOADOUTVAR != "CE") exitWith {
  [{
    if (!phx_safetyEnabled) then {[_handle] call CBA_fnc_removePerFrameHandler};
    if ("ACE_Fortify" in (items player)) then {player removeItem "ACE_Fortify"};
  }, 1] call CBA_fnc_addPerFrameHandler;
};

switch (playerSide) do {
  case east: {phx_fortifyMarker = "opforSafeMarker";};
  case west: {phx_fortifyMarker = "bluforSafeMarker";};
  case independent: {phx_fortifyMarker = "indforSafeMarker";};
};

[{
    params ["_unit", "_object", "_cost"];
    private _canPlace = true;
    private _type = typeOf _object;
    private _pos = position _object;
    private _minDistance = 35;
    private _errorStr = "";

    if !((typeOf _unit == "O_soldier_exp_F") || (typeOf _unit == "B_soldier_exp_F") || (typeOf _unit == "I_Soldier_exp_F")) then {
      _canPlace = false;
      _errorStr = "Cannot place object. You are not a combat engineer.";
    };

    if (_type != "Land_Plank_01_4m_F" && _type != "Land_Plank_01_8m_F" && (_type find "BagFence" == -1)) then {
      if ((getPosATL _object) select 2 > 0.35) then {
        _canPlace = false;
        _errorStr = "Cannot place object. Object must be on the terrain."
      };
    };

    {
      if (_pos distance (position _x) < _minDistance || _pos inArea _x) then {
        _canPlace = false;
        _errorStr = format ["Cannot place object. Object needs to be at least %1 meters away from an objective.", _minDistance];

        if (_pos inArea _x) then {_errorStr = "Cannot place object within objective area."};
      };
    } forEach phx_fortify_objArr;

    if ((count (_object nearRoads 12) > 0) || (isOnRoad _object)) then {
      _canPlace = false;
      _errorStr = "Cannot place object. Object cannot be near a road";
    };

    if !(_pos inArea phx_fortifyMarker) then {
      _canPlace = false;
      _errorStr = "Cannot place object. Object needs to be within start zone boundary."
    };

    if (_cost > phx_fortifyPoints) then {
      _canPlace = false;
      _errorStr = "Cannot place object. Not enough funds.";
    };

    hintSilent _errorStr;

    if (_canPlace) then {
      switch (playerSide) do {
        case east: {
          missionNamespace setVariable ["ace_fortify_budget_east", -1, false];
        };
        case west: {
          missionNamespace setVariable ["ace_fortify_budget_west", -1, false];
        };
        case independent: {
          missionNamespace setVariable ["ace_fortify_budget_guer", -1, false];
        };
      };
      phx_fortifyPoints = phx_fortifyPoints - _cost;
      hintSilent format ["Fortify Budget: $%1", phx_fortifyPoints];
    };

    _canPlace
}] call acex_fortify_fnc_addDeployHandler;

["acex_fortify_objectDeleted", {
  if !((_this select 0) == player) exitWith {};
  private _type = typeOf (_this select 2);
  private _fortifyObjsArr = [];
  private _fortifyVarStr = "";
  private _cost = 0;

  switch (playerSide) do {
    case east: {
      _fortifyVarStr = "ace_fortify_objects_east";
      missionNamespace setVariable ["ace_fortify_budget_east", -1, false];
    };
    case west: {
      _fortifyVarStr = "ace_fortify_objects_west";
      missionNamespace setVariable ["ace_fortify_budget_west", -1, false];
    };
    case independent: {
      _fortifyVarStr = "ace_fortify_objects_guer";
      missionNamespace setVariable ["ace_fortify_budget_guer", -1, false];
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
      missionNamespace setVariable ["ace_fortify_budget_east", phx_fortifyPoints, false];
    };
    case west: {
      missionNamespace setVariable ["ace_fortify_budget_west", phx_fortifyPoints, false];
    };
    case independent: {
      missionNamespace setVariable ["ace_fortify_budget_guer", phx_fortifyPoints, false];
    };
  };
}] call CBA_fnc_addEventHandler;
