// get safeZone TP flags that exist


{
  private _thisSide = _x;
  private _thisSideStr = toLower (_thisSide call BIS_fnc_sideNameUnlocalized);
  private _flagPrefix = format["%1_safeZone_flag_", _thisSideStr];
  private _safeMarkerPrefix = format["%1_safeZone_marker_", _thisSideStr];
  private _process = true;

  // check if flag 1 exists and if not, warn if in mission preview
  if (isNull (missionNamespace getVariable [_flagPrefix + "1", objNull])) then {
    if (is3DENPreview) then {
      format["[PreviewOnly] %1_safeZone_flag_1 not present. Safezone teleport disabled for %2", _thisSideStr, _thisSide call BIS_fnc_sideName] remoteExec ["systemChat", 0];
    };
    _process = false;

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
    _flagNum = str(_x) select [(count str(_x)) - 1, 1];
    private _markParam = [
      "",
      format["safeZone_flagmarker_%1_%2", _thisSideStr, _flagNum],
      position _x,
      "waypoint",
      "ICON",
      [1,1],
      0,
      "Solid",
      [_thisSide, true] call BIS_fnc_sideColor,
      1,
      format["SafeZone %1", _flagNum]
    ] joinString "|";
    _markParam remoteExecCall ["BIS_fnc_stringToMarkerLocal", _thisSide, true];
    // _markParam remoteExecCall ["BIS_fnc_stringToMarkerLocal", 0, true];
  } forEach _flagsPresent;
} forEach [west, east, independent];
