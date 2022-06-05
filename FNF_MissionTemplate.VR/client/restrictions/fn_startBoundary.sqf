/*
Forces the player to stay within their starting zone until safe start ends.
*/

private "_markers";
private _maxTime = 10;
phx_startTimer = 10;
phx_startGoodPos = getpos vehicle player;

switch (playerSide) do {
  case east: {
    _markers = phx_opforSafeMarkers;
  };
  case west: {
    _markers = phx_bluforSafeMarkers;
  };
  case independent: {
    _markers = phx_indforSafeMarkers;
  };
};


[{
  _this select 0 params ["_markers","_maxTime"];
  if (!phx_safetyEnabled || !alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; hintSilent ""};
  if (missionNamespace getVariable ["f_var_mission_timer",10] < 1) then {_maxTime = 0};

  _playerInSafe = false;

  {
    if (vehicle player inArea _x) exitWith {
      _playerInSafe = true;
    };
  } forEach _markers;

  if (_playerInSafe) then {
    phx_startGoodPos = getpos vehicle player;

    if (phx_startTimer != _maxTime) then {phx_startTimer = _maxTime; hintSilent ""};
  } else {
    if (phx_startTimer <= 0) then {
      if (phx_startGoodPos select 2 > 0.2) then {vehicle player setpos phx_startGoodPos} else {
        vehicle player setpos (phx_startGoodPos findEmptyPosition [0, 50, typeOf vehicle player]);
      };
      hintSilent "";
    } else {
      hint format ["You have %1 seconds to get back to the starting area", phx_startTimer];
      phx_startTimer = phx_startTimer - 1;
    };
  };
}, 1, [_markers,_maxTime]] call CBA_fnc_addPerFrameHandler;
