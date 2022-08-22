// "debug_console" callExtension "----------------------------";
// "debug_console" callExtension (_fnc_scriptName);
// private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
// _systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});
// "debug_console" callExtension format _systemTimeFormat;

fnf_safeZoneAssets = createHashMapFromArray [
  [west, createHashMap],
  [east, createHashMap],
  [independent, createHashMap]
];

{
  private _thisSide = _x;
  private _thisSideKey = switch (_thisSide) do {
    case west: {"BLU"};
    case east: {"OPF"};
    case independent: {"IND"};
  };


  private _thisSideAssetsObjects = [fnf_vehiclesToProcess, _thisSideKey, []] call BIS_fnc_getFromPairs;
  if (count _thisSideAssetsObjects == 0 || playableSlotsNumber _thisSide < 4) then {continue};


  // private _PLTplayers = (units _thisSide) select {"PLTHQ" in (roleDescription _x)};
  // private _markerPlayer = if (count _PLTplayers > 0) then {selectRandom(_PLTplayers)} else {selectRandom (units _thisSide)};

  // iterate through this side's assets and use a hashmap to group vehicles under which safezone they belong to
  private _sideSafeMarkers = [nil, _thisSide, true] call fnf_fnc_inSafeZone;
  private _safeZoneContents = createHashMap;
  {
    _safeMarkerName = _x;
    _safeZoneContents set [_safeMarkerName, []];

    {
      if (_x inArea _safeMarkerName) then {
        (_safeZoneContents get _safeMarkerName) pushBackUnique _x;
      };
    } forEach _thisSideAssetsObjects;
  } forEach _sideSafeMarkers;

  {
    private _markerName = _x;
    // "debug_console" callExtension str(_x);
    if (_markerName == "") then {continue};
    private _objects = +_y;
    // "debug_console" callExtension str(_objects);

    _objects = _objects arrayIntersect _objects;
    _objects = _objects select {!isNull _x && locked _x < 2} apply {getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName")};
    private _objectLabels = _objects call BIS_fnc_consolidateArray;

    private _labelPosOffset = ((getMarkerSize _markerName)#0) max ((getMarkerSize _markerName)#1);
    private _labelPos = (getMarkerPos _markerName) vectorAdd [_labelPosOffset, _labelPosOffset, 0];

    private _thisZoneMarkers = [];
    {
      _x params ["_displayName", "_count"];
      private _label = createMarker [format["%1_assetList_%2", _markerName, _forEachIndex], _labelPos, -1];
      _label setMarkerShapeLocal "ICON";
      _label setMarkerTypeLocal "mil_dot_noShadow";
      _label setMarkerColorLocal "ColorBlack";
      _label setMarkerAlphaLocal 0;
      _label setMarkerTextLocal format["%1x %2", _count, _displayName];
      _label setMarkerSize [0.3,0.3];

      _thisZoneMarkers pushBack _label;

      _labelPos = _labelPos vectorAdd [0, -15, 0];
    } forEach _objectLabels;

    _safeZoneContents set [_markerName, _thisZoneMarkers];

  } forEach _safeZoneContents;

  fnf_safeZoneAssets set [_thisSide, _safeZoneContents];

} forEach [west, east, independent];

publicVariable "fnf_safeZoneAssets";
