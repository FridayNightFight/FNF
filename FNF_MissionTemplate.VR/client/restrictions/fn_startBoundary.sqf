/*
Forces the player to stay within their starting zone until safe start ends.
*/

private "_marker";

switch (playerSide) do {
  case east: {_marker = "opforSafeMarker"};
  case west: {_marker = "bluforSafeMarker"};
  case independent: {_marker = "indforSafeMarker"};
  case civilian: {_marker = "civilianSafeMarker"};
};

if !(vehicle player inArea _marker) exitWith {}; //Exit if player doesn't start within a safe marker

[{
  params ["_marker"];
  if (!phx_safetyEnabled || !alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
  if (serverCommandAvailable "#kick" && !isServer) exitWith {}; //Doesn't run if player is game admin

  private _playerObj = vehicle player;

  if (_playerObj inArea _marker) then {
    phx_startGoodPos = getPosASL _playerObj;
  } else {
    _playerObj setPosASL phx_startGoodPos;
  };
}, 1, _marker] call CBA_fnc_addPerFrameHandler;
