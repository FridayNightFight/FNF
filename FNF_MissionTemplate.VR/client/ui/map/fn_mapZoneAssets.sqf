[{!isNil "fnf_safeZoneAssets"}, {
  [{
    if (!visibleMap) exitWith {};
    if (fnf_gameMode == "sustainedAssault" || !(missionNamespace getVariable ["fnf_safetyEnabled", true])) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    private _worldCoord = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition;
    private _markerImIn = [_worldCoord, playerSide, false, false] call fnf_fnc_inSafeZone;

    if (_markerImIn == "") exitWith {
      {
        private _markers = _y;
        {
          if (markerAlpha _x != 0) then {_x setMarkerAlphaLocal 0};
        } forEach (flatten(values _y));
      } forEach fnf_safeZoneAssets;
    };

    private _markersForThisZone = (fnf_safeZoneAssets get playerSide) get _markerImIn;
    {
      if (markerAlpha _x != 1) then {
        _x setMarkerAlphaLocal 1;
      };
    } forEach _markersForThisZone;

  }] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
