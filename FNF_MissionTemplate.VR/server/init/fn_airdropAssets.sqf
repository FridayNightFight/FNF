private _dropTargets = [];
private _objectsToDeleteAfter = [];
// "debug_console" callExtension "----------------------------";
// "debug_console" callExtension "airdropAssets";
// private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
// _systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});
// "debug_console" callExtension format _systemTimeFormat;

{
  private _thisSide = _x;
  private _thisSideKey = switch (_thisSide) do {
    case west: {"BLU"};
    case east: {"OPF"};
    case independent: {"IND"};
  };


  private _thisSideAssetsObjects = [fnf_vehiclesToProcess, _thisSideKey, []] call BIS_fnc_getFromPairs;
  if (count _thisSideAssetsObjects == 0 || playableSlotsNumber _thisSide < 4) then {continue};

  _thisSideAssetsObjects = _thisSideAssetsObjects select {!(_x isKindOf "Air") && !(_x isKindOf "Ship")};
  _thisSideAssetTypes = _thisSideAssetsObjects apply {typeOf _x};
  private _thisSideAssets = _thisSideAssetTypes call BIS_fnc_consolidateArray;

  private _thisSideMainSafeMarker = ([nil, _thisSide, true] call fnf_fnc_inSafeZone)#0;

  _dropTargets pushBack [
    _thisSide,
    [
      [
        2,
        // (((markerSize _thisSideMainSafeMarker) select 0) min ((markerSize _thisSideMainSafeMarker) select 1)) - 30, // 30 inside of the smallest safestart edge
        200,
        markerPos _thisSideMainSafeMarker,
        random(359),
        _thisSideAssets
      ]
    ]
  ];

  _objectsToDeleteAfter append _thisSideAssetsObjects;
} forEach fnf_airdropAssets;

[
  true,
  true,
  false,
  0, // no delay
  _dropTargets
] call fnf_missionSpecials_fnc_ambientAirdrop;

{deleteVehicle _x} forEach _objectsToDeleteAfter;
