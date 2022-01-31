/*
Forces the player to stay within their starting zone until safe start ends.
*/

private "_marker";
private _maxTime = 10;
phx_startTimer = 10;
phx_startGoodPos = getpos vehicle player;

// clear previous instance if it exists (respawn)
if (!isNil "phx_restrictions_handle_startBoundary") then {
    [phx_restrictions_handle_startBoundary] call CBA_fnc_removePerFrameHandler;
    phx_restrictions_handle_startBoundary = nil;
};

phx_restrictions_handle_startBoundary = [{
  _this select 0 params ["_maxTime"];
  if (!(missionNamespace getVariable ["phx_safetyEnabled", true]) || !alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; hintSilent ""};

  if (missionNamespace getVariable ["f_var_mission_timer",10] < 1) then {_maxTime = 0};

  if ([vehicle player, playerSide] call phx_fnc_inSafeZone) then {
    phx_startGoodPos = getpos vehicle player;

    if (phx_startTimer != _maxTime) then {phx_startTimer = _maxTime; hintSilent ""};
  } else {
    if (phx_startTimer <= 0) then {
      if (phx_startGoodPos select 2 > 0.2) then {vehicle player setpos phx_startGoodPos} else {
        vehicle player setpos (phx_startGoodPos findEmptyPosition [0, 50, typeOf vehicle player]);
      };
      hintSilent "";
    } else {
      // hint format ["You have %1 seconds to get back to the starting area", phx_startTimer];
      [format ["<t align='center'><t color='#FF0000' size='1.5'>%1</t><br/>seconds to get back to the safe start zone", phx_startTimer], "warning", 1] call phx_ui_fnc_notify;
      phx_startTimer = phx_startTimer - 1;
    };
  };
}, 1, [_maxTime]] call CBA_fnc_addPerFrameHandler;
