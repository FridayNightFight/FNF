if (count phx_playerSafeMarkers == 1) exitWith {};

_action = ["Zone_Selector","Safe Zone Selector","",{},{phx_safetyEnabled}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;

_num = 1;
{

  _action = ["Zone_Selector","Safe Zone " + str _num,"",{
    if (vehicle player != player) exitWith {hint "Error: You cannot teleport from within a vehicle"};

    _marker = _this select 2;
    getMarkerPos _marker params ["_x","_y"];
    player setpos ([_x,_y] findEmptyPosition [0, 30, typeOf player]);
  },{true}, {}, _x] call ace_interact_menu_fnc_createAction;

  [(typeOf player), 1, ["ACE_SelfActions","Zone_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;

  _num = _num + 1;
} forEach phx_playerSafeMarkers;

[{!phx_safetyEnabled}, {
  [(typeOf player), 1, ["ACE_SelfActions","Zone_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
}] call CBA_fnc_waitUntilAndExecute;
