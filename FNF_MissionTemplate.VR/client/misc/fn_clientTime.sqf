if (!hasInterface) exitWith {};

phx_updateTimeLeftUI = true;
[] spawn {
  disableSerialization;
  _missionSafeTime = phx_safeStartTime;
  _missionRunTimeMins = phx_missionTimelimit;
  _missionTime = _missionRuntimeMins + _missionSafeTime;
  //Create displays in bottom left
  ("timeRsc" call BIS_fnc_rscLayer) cutRsc ["timeleftStructText", "PLAIN"];
  //If displays weren't created then exit the script
  if (uiNameSpace getVariable "timeleftStructText" isEqualTo displayNull) exitWith {hint "TIMELEFT display not defined in description.ext"};

  while {phx_updateTimeLeftUI} do {
    //Update text in the displays to match the points markers
    _display = uiNameSpace getVariable "timeleftStructText";
    _setText = _display displayCtrl 1003;
    if (CBA_missionTime <= (_missionTime*60)) then {
        _mins = (_missionTime - floor(CBA_missionTime/60)) -1;
        _secs = 60-floor(CBA_missionTime%60);
        if ((_secs < 10) || (_secs isEqualTo 60)) then {
            if (_secs isEqualTo 60) then {
                if (_secs isEqualTo 60) then {
                    _secs = "00";
                    _mins = (_missionTime - floor(CBA_missionTime/60));
                };
            } else {
                _secs = "0" + str(60-floor(CBA_missionTime%60));
            };
        };
        _setText ctrlSetStructuredText (parseText format ["Approximate Mission Time Remaining: %1:%2",_mins,_secs]);
    } else {
      _mins = floor((CBA_missionTime-(_missionTime*60))/60);
      _secs = floor((CBA_missionTime-(_missionTime*60))%60);
      if (_secs < 10) then {
        if (_secs isEqualTo 0) then {
          _secs = "00";
          _mins = floor((CBA_missionTime-(_missionTime*60))/60);
        };
        _secs = "0" + str(floor((CBA_missionTime-(_missionTime*60))%60));
      };
      _setText ctrlSetStructuredText (parseText format ["Mission Overtime: + %1:%2",_mins,_secs]);
    };

    uiSleep 1;
  };
};
