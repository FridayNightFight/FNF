params ["_vehicle"];

_vehicle addAction ["<t color='#FF0000'>Takeoff<\t>", {
  params ["_target", "_caller", "_actionId", "_arguments"];

  phx_takeoffScript = [_target] spawn {
    params ["_vehicle"];
    _takeoffTime = 15;

    _vehicle engineOn true;

    while {vehicle player == _vehicle && _takeoffTime > 0} do {
      hintSilent format ["Takeoff in %1 seconds", _takeoffTime];
      _takeoffTime = _takeoffTime - 1;
      sleep 1;
    };

    hint "";

    if ((getpos vehicle player) select 2 > 1) exitWith {hint " Auto-takeoff disabled; you're already in the air.";};

    if (vehicle player == _vehicle) then {
      _vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, 500];

      _dir = direction _vehicle;
      _speed = 100;
      _vehicle setVelocity [
      	sin _dir * _speed,
      	cos _dir * _speed,
      	0
      ];
    } else {
      hint "You left the vehicle. Auto-takeoff disabled.";
      _vehicle engineOn false;
    };
  };
}, nil, 0.1, false, true, "", "_this == driver _target && !phx_safetyEnabled && (getpos _target) select 2 < 1 && scriptDone (missionNamespace getVariable ['phx_takeoffScript',scriptNull])"];
