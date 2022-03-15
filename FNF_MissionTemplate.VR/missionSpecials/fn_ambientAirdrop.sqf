///////////////////////////////////////////////////
params ["_enabled", "_flightBearings", "_numPlanes", "_dropSpread"];

waitUntil {getClientStateNumber == 10};
fnf_ambientAirdrop = call CBA_fnc_createNamespace;
{
  private _thisSide = _x;
  private _thisSideStr = toLower(_thisSide call BIS_fnc_sideNameUnlocalized);
  private _thisSideStrLoc = _thisSide call BIS_fnc_sideName;


  _destinationMarkers = [
    format["fnf_ambientAirdrop_%1_", _thisSideStr]
  ] call BIS_fnc_getMarkers;


  {
    if !(missionNamespace getVariable ["fnf_debug", false]) then {_x setMarkerAlpha 0};
  } forEach _destinationMarkers;


  private "_planeClass";
  switch (_thisSide) do {
    case west: {_planeClass = "RHS_C130J_Cargo"};
    case east: {_planeClass = "UK3CB_CW_SOV_O_EARLY_Antonov_AN2"};
  };


  private _bearing = _flightBearings#_forEachIndex;
  {
    private _marker = _x;

    private _formationOffset = _bearing + 90;
    if (_formationOffset > 359) then {_formationOffset = _formationOffset - 360};
    private _dropTarget = (markerPos _marker);
    private _dropTargetAdjusted = _dropTarget getPos [(_numPlanes - 1) * 100, _formationOffset];

    private _bearingRev = _bearing + 180;
    if (_bearingRev > 359) then {_bearingRev = _bearingRev - 360};

    // start dropping cargo 150m before reaching the actual target
    private _startDropPos = _dropTargetAdjusted getPos [300, _bearingRev];
    private _endDropPos = _dropTargetAdjusted getPos [300, _bearing];

    // for "_i" from 2 to 4 do {
      // private _startPos = _startDropPos getPos [worldSize*0.5, selectRandom([_bearingRev - _i, _bearingRev + _i])];
      // private _endPos = _startDropPos getPos [worldSize*0.5, selectRandom([_bearing - _i, _bearing + _i])];
      // private _startPos = _startDropPos getPos [2500, selectRandom([_bearingRev - _i, _bearingRev + _i])];
      // private _endPos = _startDropPos getPos [2500, selectRandom([_bearing - _i, _bearing + _i])];

      private _startPos = _startDropPos getPos [worldSize*0.5, _bearingRev];
      private _endPos = _endDropPos getPos [worldSize*0.5, [_startDropPos, _endDropPos] call BIS_fnc_dirTo];

      private _flyHeight = 150;

      [
        [_startPos, _startDropPos, _dropTarget, _dropTargetAdjusted, _endDropPos, _endPos],
        [_bearing, _bearingRev],
        _dropSpread,
        _flyHeight,
        "NORMAL",
        _planeClass,
        _numPlanes,
        _thisSide
      ] call fnf_missionSpecials_fnc_ambientAirdrop_plane;

    // };

  } forEach _destinationMarkers;
} forEach [west, east];