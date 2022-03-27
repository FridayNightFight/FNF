if (!isServer) exitWith {};

params ["_objectives"];

fnf_briefing_table_objects = createHashMap;
fnf_briefing_table_views = [];

// {
//   _x params ["_name", "_position"];
//   _marker = createMarkerLocal [format["fnf_objectiveArea_%1", _forEachIndex + 1], _position, -1];
//   _marker setMarkerAlphaLocal 0;
//   _marker setMarkerColorLocal "ColorBlack";
//   _marker setMarkerShapeLocal "RECTANGLE";
//   _marker setMarkerSize [300, 300];
//   fnf_briefing_table_views pushBack [_name, _marker];
// } forEach _objectives;

{
  _x params ["_name", "_position"];
  fnf_briefing_table_views pushBack [_name, _position];
} forEach _objectives;

private _missionVehicles = (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"});
private _squads = ["PLT", "ALPHA", "BRAVO", "CHARLIE", "DELTA", "GOLF", "HOTEL"];

{

  private _side = _x;
  private _sideString = format["%1", _x call BIS_fnc_sideNameUnlocalized];
  private _sideStringVar = format["_%1", _x call BIS_fnc_sideNameUnlocalized];
  private _briefingTableStart = missionNamespace getVariable [format["fnf_briefingTable_%1", _sideString], objNull];
  if (isNull _briefingTableStart) then {
    deleteVehicle _briefingTableStart;
    continue;
  };

  private _briefingTableStartPos = getPos _briefingTableStart;
  deleteVehicle _briefingTableStart;

  // for "_i" from 1 to (count fnf_briefing_table_views) do {
  {
    private _thisSquad = _x;
    // private _thisPos = [[
    //   [markerPos (([nil, _side, true] call fnf_fnc_inSafeZone) select 0), 50]
    // ], [], {[_this, _side] call fnf_fnc_inSafeZone}] call BIS_fnc_randomPos;



    private _thisPos = [[
      [_briefingTableStartPos, 50]
    ], [], {
      private _pos = _this;
      [_pos, _side] call fnf_fnc_inSafeZone &&
      (fnf_briefing_table_objects getOrDefault [_sideStringVar, [], true]) findIf {_pos distance2D _x < 20} == -1 &&
      _missionVehicles findIf {_pos distance2D _x < 8} == -1 &&
      !(isOnRoad _pos)
    }] call BIS_fnc_randomPos;

    _thisPos = _thisPos getPos [5, _thisPos getDir _briefingTableStartPos];
    private _emptyPos = _thisPos findEmptyPosition [0, 10, "Land_PortableDesk_01_black_F"];
    if (count _emptyPos > 0) then {_thisPos = _emptyPos};


    private _var = format["fnf_briefingTable_%1_%2", _sideString, _forEachIndex + 1];
    private _table = "Land_PortableDesk_01_black_F" createVehicle _thisPos;
    if (isNull _table) then {diag_log text format["Failed to create table %1 for %2", _forEachIndex + 1, _sideString]; continue};
    missionNamespace setVariable [_var, _table, true];
    (missionNamespace getVariable _var) animateSource ["wing_l_hide_source", 2, true];
    (missionNamespace getVariable _var) animateSource ["wing_r_hide_source", 2, true];
    _table enableSimulationGlobal false;
    _table setPos (getPos _table vectorAdd [0,0,-0.25]);
    _table setVectorUp [0,0,1];
    createVehicle ["Land_ClutterCutter_medium_F", getPos _table, [], 0, "CAN_COLLIDE"];

    (fnf_briefing_table_objects getOrDefault [_sideStringVar, [], true]) pushBack _table;
    // private _name = format["Briefing Table %1", _forEachIndex + 1];
    private _name = format["%1 Brief", _thisSquad];
    _table setVariable ["helperName", _name, true];
    _table setVariable ["checkVar", _var, true];

    [[_side, _var, _table, _thisSquad], {
      params ["_side", "_var", "_table", "_thisSquad"];
      if (playerSide != _side) exitWith {};
      _tableMark = createMarkerLocal [format["%1_mark", _var], _table, -1];
      _tableMark setMarkerShapeLocal "ICON";
      _tableMark setMarkerTypeLocal "mil_box_noShadow";
      _tableMark setMarkerTextLocal _thisSquad;
      _tableMark setMarkerSizeLocal [0.4, 0.4];
      [{!(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {
        if (typeName _this == "STRING") then {
          deleteMarkerLocal _this;
        };
      }, _tableMark] call CBA_fnc_waitUntilAndExecute;
    }] remoteExec ["call", 0, true];

  } forEach _squads;
} forEach [west, east, independent];


publicVariable "fnf_briefing_table_views";
publicVariable "fnf_briefing_table_objects";
