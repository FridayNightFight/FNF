if (!isServer) exitWith {};

params ["_objectiveMarkers"];

fnf_briefing_table_objects = createHashMap;
fnf_briefing_table_views = _objectiveMarkers;

{
  private _side = _x;
  private _sideString = _x call BIS_fnc_sideNameUnlocalized;
  private _briefingTableStart = missionNamespace getVariable [format["fnf_briefingTable_%1", _sideString], objNull];
  if (isNull _briefingTableStart) then {continue};

  private _briefingTableStartPos = getPos _briefingTableStart;
  deleteVehicle _briefingTableStart;

  for "_i" from 1 to (count _objectiveMarkers) do {
    private _thisPos = _briefingTableStartPos findEmptyPosition [17, 50, "Land_PortableDesk_01_black_F"];
    if (count _thisPos == 0) then {diag_log text format["Failed to find pos for table %1 for %2", _i, _sideString]; continue};
    private _thisTable = "Land_PortableDesk_01_black_F" createVehicle _thisPos;
    if (isNull _thisTable) then {diag_log text format["Failed to create table %1 for %2", _i, _sideString]; continue};
    (fnf_briefing_table_objects getOrDefault [_sideString, []]) pushBack _thisTable;
    _thisTable animateSource ["wing_l_hide_source", 2, true];
    _thisTable animateSource ["wing_r_hide_source", 2, true];

    [[_side, _thisTable, fnf_briefing_table_views select (_i - 1)], {

      [{time > 0}, {
        params ["_side", "_table", "_marker"];
        if (_side != playerSide) exitWith {};
        [_table, _marker, 20, 1.5] spawn fnf_briefing_fnc_createTable;
      }, _this] call CBA_fnc_waitUntilAndExecute;
    }] remoteExec ["call", [0, -2] select isDedicated, _thisTable];
  };
} forEach [west, east, independent];
