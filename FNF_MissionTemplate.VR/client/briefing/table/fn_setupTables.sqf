if (!isServer) exitWith {};

params ["_objectives"];

fnf_briefing_table_objects = createHashMap;
fnf_briefing_table_views = [];

{
  _x params ["_name", "_position"];
  _marker = createMarker [format["fnf_objectiveArea_%1", _forEachIndex + 1], _position, -1];
  _marker setMarkerAlpha 0;
  _marker setMarkerColor "ColorBlack";
  _marker setMarkerShape "RECTANGLE";
  _marker setMarkerSize [200, 200];
  fnf_briefing_table_views pushBack [_name, _marker];
} forEach _objectives;

{
  private _side = _x;
  private _sideString = format["%1", _x call BIS_fnc_sideNameUnlocalized];
  private _sideStringVar = format["_%1", _x call BIS_fnc_sideNameUnlocalized];
  private _briefingTableStart = missionNamespace getVariable [format["fnf_briefingTable_%1", _sideString], objNull];
  if (isNull _briefingTableStart) then {continue};

  private _briefingTableStartPos = getPos _briefingTableStart;
  deleteVehicle _briefingTableStart;

  // for "_i" from 1 to (count fnf_briefing_table_views) do {
  {
    private _thisPos = [
      _briefingTableStartPos, // reference pos
      1, // minDist
      20, // maxDist
      3, // objDist
      0, // can't be in water
      0.35, // max gradient
      0, // does not have to be at a shore
      [],
      [_briefingTableStartPos findEmptyPosition [17, 50, "Land_PortableDesk_01_black_F"], [0,0]]
    ] call BIS_fnc_findSafePos;
    if (count _thisPos == 0) then {diag_log text format["Failed to find pos for table %1 for %2", _forEachIndex + 1, _sideString]; continue};

    private _var = format["fnf_briefingTable_%1_%2", _sideString, _forEachIndex + 1];
    private _table = "Land_PortableDesk_01_black_F" createVehicle _thisPos;
    if (isNull _table) then {diag_log text format["Failed to create table %1 for %2", _forEachIndex + 1, _sideString]; continue};
    missionNamespace setVariable [_var, _table, true];
    _table animateSource ["wing_l_hide_source", 2, true];
    _table animateSource ["wing_r_hide_source", 2, true];

    _x params ["_name", "_marker"];
    (fnf_briefing_table_objects getOrDefault [_sideStringVar, [], true]) pushBack _table;
    _table setVariable ["helperName", _name, true];
    _table setVariable ["markerName", _marker, true];

  } forEach fnf_briefing_table_views;
} forEach [west, east, independent];


publicVariable "fnf_briefing_table_views";
publicVariable "fnf_briefing_table_objects";
