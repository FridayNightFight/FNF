// don't allow fortify on SA
if (fnf_gameMode == "sustainedAssault") exitWith {};

fnf_fortify_objArr = [];

[{!isNil "term1"}, {fnf_fortify_objArr append [term1]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "term2"}, {fnf_fortify_objArr append [term2]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "term3"}, {fnf_fortify_objArr append [term3]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "fnf_destroyObjs"}, {fnf_fortify_objArr append fnf_destroyObjs}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "ctf_flag"}, {fnf_fortify_objArr append [ctf_flag]}, [], 10] call CBA_fnc_waitUntilAndExecute;
[{!isNil "ctf_attackTrig"}, {fnf_fortify_objArr append [ctf_attackTrig]}, [], 10] call CBA_fnc_waitUntilAndExecute;

[{
  {
    if (isNull _x) then {fnf_fortify_objArr = fnf_fortify_objArr - [_x]};
  } forEach fnf_fortify_objArr;
}, [], 15] call CBA_fnc_waitAndExecute;

if (fnf_gameMode == "connection" || fnf_gameMode == "neutralSector") exitWith {};
if (!(playerSide == fnf_defendingSide) || fnf_fortifyPoints <= 0) exitWith {};

#define PLAYERLOADOUTVAR (player getVariable "fnfLoadout")
if (PLAYERLOADOUTVAR != "CE") exitWith {
  [{
    if (!(missionNamespace getVariable ["fnf_safetyEnabled", true])) then {[_handle] call CBA_fnc_removePerFrameHandler};
    if ("ACE_Fortify" in (items player)) then {
      _weaponHolder = createVehicle ["GroundWeaponHolder_Scripted", getPosATL player, [], 0, "CAN_COLLIDE"];
      player removeItem "ACE_Fortify";
      [_weaponHolder, "ACE_Fortify"] call CBA_fnc_addItemCargo;
      hint "You cannot carry a fortify tool. It has been dropped on the ground."
    };
  }, 1] call CBA_fnc_addPerFrameHandler;
};

switch (playerSide) do {
  case east: {fnf_fortifyMarkers = [nil, east, true] call fnf_fnc_inSafeZone};
  case west: {fnf_fortifyMarkers = [nil, west, true] call fnf_fnc_inSafeZone};
  case independent: {fnf_fortifyMarkers = [nil, independent, true] call fnf_fnc_inSafeZone};
};

//Function made by Killzone_Kid. From A3 Wiki.
KK_fnc_inHouse = {
  lineIntersectsSurfaces [
    getPosWorld _this,
    getPosWorld _this vectorAdd [0, 0, 50],
    _this, objNull, true, 1, "GEOM", "NONE"
  ] select 0 params ["","","","_house"];

  if (_house isKindOf "House") exitWith { true };

  false
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

    if (_object call KK_fnc_inHouse) then {
      _canPlace = false;
      _errorStr = "Cannot place objects within buildings."
    };

    {
      if (_pos distance (position _x) < _minDistance || _pos inArea _x) then {
        _canPlace = false;
        _errorStr = format ["Cannot place objects within %1 meters away from an objective.", _minDistance];

        if (_pos inArea _x) then {_errorStr = "Cannot place object within objective area."};
      };
    } forEach fnf_fortify_objArr;

    if ((count (_object nearRoads 12) > 0 || isOnRoad _object) && (getPosATL _object) select 2 < 3.5) then {
      _canPlace = false;
      _errorStr = "Cannot place objects near roads.";
    };

    if (fnf_fortifyMarkers findIf {_pos inArea _x} == -1) then {
      _canPlace = false;
      _errorStr = "Cannot place objects outside the start zone boundary."
    };

    if (_cost > fnf_fortifyPoints) then {
      _canPlace = false;
      _errorStr = "Cannot place object. Not enough funds.";
    };

    // hintSilent _errorStr;
    [_errorStr, "error", 7] call fnf_ui_fnc_notify;

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
      fnf_fortifyPoints = fnf_fortifyPoints - _cost;
      // hintSilent format ["Fortify Budget: $%1", fnf_fortifyPoints];
      [format ["Fortify Budget: $%1", fnf_fortifyPoints], "info", 7] call fnf_ui_fnc_notify;
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

  fnf_fortifyPoints = fnf_fortifyPoints + _cost;

  hintSilent format ["Fortify Budget: $%1", fnf_fortifyPoints];
}] call CBA_fnc_addEventHandler;

["ace_interactMenuOpened", {
  if ((_this select 0) == 0) exitWith {};

  switch (playerSide) do {
    case east: {
      missionNamespace setVariable ["ace_fortify_budget_east", fnf_fortifyPoints, false];
    };
    case west: {
      missionNamespace setVariable ["ace_fortify_budget_west", fnf_fortifyPoints, false];
    };
    case independent: {
      missionNamespace setVariable ["ace_fortify_budget_guer", fnf_fortifyPoints, false];
    };
  };
}] call CBA_fnc_addEventHandler;
