/*
Forces the player to stay within their starting zone until safe start ends.
*/

private "_marker";
private _maxTime = 10;
phx_startTimer = 10;
phx_startGoodPos = getpos vehicle player;

switch (playerSide) do {
  case east: {
    _marker = "opforSafeMarker";
  };
  case west: {
    _marker = "bluforSafeMarker";
  };
  case independent: {
    _marker = "indforSafeMarker";
  };
};


[{
  _this select 0 params ["_marker","_maxTime"];
  if (!phx_safetyEnabled || !alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; hintSilent ""};

  if (missionNamespace getVariable ["f_var_mission_timer",10] < 1) then {_maxTime = 0};

  if (vehicle player inArea _marker) then {
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
}, 1, [_marker,_maxTime]] call CBA_fnc_addPerFrameHandler;
