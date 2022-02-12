// get safeZone TP flags that exist

// Remind vetters they will see all safezone markers
if (is3DENPreview) then {
  systemChat "[FNF] (safeZoneTeleport) [PreviewOnly] During preview, you will see all safezone markers. On Dedicated, players will only see those matching their side."
};

{
  private _thisSide = _x;
  private _thisSideStr = toLower (_thisSide call BIS_fnc_sideNameUnlocalized);
  private _flagPrefix = format["%1_safeZone_flag_", _thisSideStr];
  private _safeMarkerPrefix = format["%1_safeZone_marker_", _thisSideStr];

  // check if flag 1 exists and if not, warn if in mission preview
  if (isNull (missionNamespace getVariable [_flagPrefix + "1", objNull])) then {
    if (is3DENPreview) then {
      format["[FNF] (safeZoneTeleport) [PreviewOnly] %1_safeZone_flag_1 not present. Safezone teleport disabled for %2", _thisSideStr, _thisSide call BIS_fnc_sideName] remoteExec ["systemChat", 0];
    };

    // set empty array for this var
    missionNamespace setVariable [
      format["fnf_%1_safeZone_flags", _thisSideStr],
      [],
      true
    ];

    continue
  };

  // if (!_process) then {continue};

  // find flags on this side
  #define FLAGOBJ (missionNamespace getVariable [(_flagPrefix + str(_i)), nil])
  private _flagsPresent = [];
  for "_i" from 1 to 5 do {
    if (!isNil {FLAGOBJ}) then {
      _flagsPresent pushBack FLAGOBJ;
    };
  };
  // "debug_console" callExtension str(_flagsPresent);

  // set global var with these flags
  missionNamespace setVariable [
    format["fnf_%1_safeZone_flags", _thisSideStr],
    _flagsPresent,
    true
  ];

  // set markers for safeZone TP flags (if they exist)
  {
    private _thisFlag = _x;
    private _flagNum = str(_x) select [(count str(_x)) - 1, 1];
    private _markerName = format["safeZone_flagmarker_%1_%2", _thisSideStr, _flagNum];
    private _markParam = [
      "", // initial empty space so overall string is preceded by the join character (|)
      _markerName, // markername
      position _thisFlag,
      "waypoint",
      "ICON",
      [1,1],
      0,
      "Solid",
      // [_thisSide, true] call BIS_fnc_sideColor,
      "ColorCIVILIAN",
      1,
      format["SafeZone %1", _flagNum]
    ] joinString "|";

    // set up markers for appropriate side, add to JIP queue (until flag is null)
    // The JIP parameter can only be used if the targets parameter is 0 or a negative number.
    // wait until safe zones have been recreated (markCustomObjs script)
    [{missionNamespace getVariable ["fnf_markCustomObjs_done", false]}, {
      params ["_thisSide", "_markParam", "_thisFlag"];

      [[_thisSide, _markParam], {
        params ["_thisSide", "_markParam"];
        if (isServer) exitWith {_markParam call BIS_fnc_stringToMarkerLocal};
        if (playerSide == _thisSide) exitWith {_markParam call BIS_fnc_stringToMarkerLocal};
      }] remoteExecCall ["call", 0, _thisFlag];

    }, [_thisSide, _markParam, _thisFlag]] call CBA_fnc_waitUntilAndExecute;

    // when safe start ends, delete flag
    ["FNF_Safety_Ended", {
      _thisArgs params ["_thisFlag"];
      deleteVehicle _thisFlag;
      [_thisType, _thisId] call CBA_fnc_removeEventHandler;
    }, [_thisFlag]] call CBA_fnc_addEventHandlerArgs;

  } forEach _flagsPresent;
} forEach [west, east, independent];


