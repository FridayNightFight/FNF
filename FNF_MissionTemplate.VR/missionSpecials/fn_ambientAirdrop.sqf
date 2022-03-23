///////////////////////////////////////////////////
params [
  ["_enabled", true, [true]],
  ["_requiredItems", true, [true]], // guarantee items are delivered by ramping up speed per object from planes
  ["_hideMarkers", true, [true]],
  ["_startDelay", 0, [0]],
  ["_dropTargets", [], [[]]] // [[west, [[500,500]]], [east, [[1000,1000]]]]
];

if (isNil "fnf_ambientAirdrop") then {
  fnf_ambientAirdrop = call CBA_fnc_createNamespace;
};
// "debug_console" callExtension "----------------------------";
// private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
// _systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});
// "debug_console" callExtension format _systemTimeFormat;
// "debug_console" callExtension "AmbientAirdrop";
// "debug_console" callExtension str(_this);
{
  // "debug_console" callExtension str(_x);
  private _thisSide = _x#0;
  private _thisSideStr = toLower(_thisSide call BIS_fnc_sideNameUnlocalized);
  private _thisSideStrLoc = _thisSide call BIS_fnc_sideName;

  private _dropDetails = _x#1;

  private "_planeClass";
  switch (_thisSide) do {
    case west: {_planeClass = "RHS_C130J_Cargo"};
    case east: {_planeClass = "UK3CB_CW_SOV_O_EARLY_Antonov_AN2"};
    case independent: {_planeClass = "UK3CB_CW_SOV_O_EARLY_Antonov_AN2"};
  };


  {
    _x params ["_numPlanes", "_dropSpread", "_position", "_bearing", "_objects"];

    switch (typeName _position) do {
      case "STRING": {
        if (markerColor _position == "") exitWith {format["[FNF] [AmbientAirdrop] Failed to load marker '%1'", _position] remoteExec ["systemChat"]};
        if (!(missionNamespace getVariable ["fnf_debug", false]) && _hideMarkers) then {_position setMarkerAlpha 0};
        _position = markerPos _position;
      };
      case "ARRAY": {
        if (count _position < 2) then {format["[FNF] [AmbientAirdrop] Invalid position '%1'", _position] remoteExec ["systemChat"]};
      };
    };

    // "debug_console" callExtension format["position: %1", _position];

    private _formationOffset = _bearing + 90;
    if (_formationOffset > 359) then {_formationOffset = _formationOffset - 360};
    private _dropTarget = _position;
    private "_dropTargetAdjusted";
    if (_requiredItems) then {
      _dropTargetAdjusted = _dropTarget getPos [(_numPlanes - 1) * 25, _formationOffset];
    } else {
      _dropTargetAdjusted = _dropTarget getPos [(_numPlanes - 1) * 75, _formationOffset];
    };

    private _bearingRev = _bearing + 180;
    if (_bearingRev > 359) then {_bearingRev = _bearingRev - 360};

    // start dropping cargo 150m before reaching the actual target
    private ["_startDropPos", "_endDropPos"];
    if (_requiredItems) then {
      _startDropPos = _dropTargetAdjusted getPos [20, _bearingRev];
      _endDropPos = _dropTargetAdjusted getPos [20, _bearing];
    } else {
      _startDropPos = _dropTargetAdjusted getPos [_dropSpread, _bearingRev];
      _endDropPos = _dropTargetAdjusted getPos [_dropSpread, _bearing];
    };

    // "debug_console" callExtension str([_startDropPos, _endDropPos]);

    private _startPos = _startDropPos getPos [worldSize*0.25, _bearingRev];
    private _endPos = _endDropPos getPos [worldSize*0.25, [_startDropPos, _endDropPos] call BIS_fnc_dirTo];
    // private _startPos = _startDropPos getPos [800, _bearingRev];
    // private _endPos = _endDropPos getPos [800, [_startDropPos, _endDropPos] call BIS_fnc_dirTo];

    private _flyHeight = 150;

    [ // wait until start delay has passed before calling
      {
        _this call fnf_missionSpecials_fnc_ambientAirdrop_plane;
      }, [
        [_startPos, _startDropPos, _dropTarget, _dropTargetAdjusted, _endDropPos, _endPos],
        [_bearing, _bearingRev],
        _dropSpread,
        _objects,
        _flyHeight,
        "NORMAL",
        _planeClass,
        _numPlanes,
        _thisSide,
        _requiredItems
      ],
      _startDelay
    ] call CBA_fnc_waitAndExecute;

  } forEach _dropDetails;
} forEach _dropTargets;
