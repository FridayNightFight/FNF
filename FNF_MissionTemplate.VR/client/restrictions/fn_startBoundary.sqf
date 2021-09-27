/*
Forces the player to stay within their starting zone until safe start ends.
*/

private "_marker";
private _maxTime = 10;
phx_startTimer = _maxTime;
phx_playerSpawnPos = getPosASL player;

switch (playerSide) do {
  case east: {_marker = "opforSafeMarker"};
  case west: {_marker = "bluforSafeMarker"};
  case independent: {_marker = "indforSafeMarker"};
  case civilian: {_marker = "civilianSafeMarker"};
};

if !(vehicle player inArea _marker) exitWith {}; //Exit if player doesn't start within a safe marker

phx_startBoundary_setPos = {
  params ["_object","_marker","_fix"];
  hintSilent "";

  if (_object inArea _marker) exitWith {}; //Exit if object is back in boundary by the time this fnc runs

  if !(isNil {_fix}) exitWith {
    _object setpos (phx_playerSpawnPos findEmptyPosition [0, 100, typeOf _object])
  };

  if (_object == player || _object isKindOf "Air") then {
    _object setPosASL phx_startGoodPos;
  } else {
    phx_startGoodPos params ["_x","_y"];
    _object setpos ([_x,_y] findEmptyPosition [0, 100, typeOf _object]);
  };
};


[{
  _this select 0 params ["_marker","_maxTime"];
  if (!phx_safetyEnabled || !alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; hintSilent ""};

  if (serverCommandAvailable "#kick" && !isServer) exitWith {}; //Doesn't run if player is game admin
  if (missionNamespace getVariable ["f_var_mission_timer",10] < 1) then {_maxTime = 0};

  if (vehicle player inArea _marker) then {
    phx_startGoodPos = getPosASL vehicle player;

    if (phx_startTimer != _maxTime) then {phx_startTimer = _maxTime; hintSilent ""};
  } else {
    if (phx_startTimer <= 0) then {
      if (local vehicle player) then {
        [vehicle player,_marker] call phx_startBoundary_setPos;
      } else {
        //This is to cover a player being inside a non-local vehicle with a vehicle owner that is disconnected/has network issues
        //In the case that the vehicle owner doesn't move the vehicle (DC, etc.), non-owner occupants will still be moved
        [phx_startBoundary_setPos, [player,_marker], 2] call CBA_fnc_waitAndExecute;
      };
      //It's possible that findEmptyPosition will choose a pos outside of the start boundary. If that happens, this line will move the player to their spawn
      [{vehicle player inArea _this}, {}, _marker, 5, {[vehicle player,_this,true] call phx_startBoundary_setPos}] call CBA_fnc_waitUntilAndExecute;
    } else {
      hint format ["You have %1 seconds to get back to the starting area", phx_startTimer];
      phx_startTimer = phx_startTimer - 1;
    };
  };
}, 1, [_marker,_maxTime]] call CBA_fnc_addPerFrameHandler;
