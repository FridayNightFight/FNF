/*
Forces the player to stay within their starting zone until safe start ends.
*/

private "_marker";
private _maxTime = 10;
fnf_startTimer = 10;
fnf_startGoodPos = getpos vehicle player;

// clear previous instance if it exists (respawn)
if (!isNil "fnf_restrictions_handle_startBoundary") then {
    [fnf_restrictions_handle_startBoundary] call CBA_fnc_removePerFrameHandler;
    fnf_restrictions_handle_startBoundary = nil;
};

fnf_restrictions_handle_startBoundary = [{
  _this select 0 params ["_maxTime"];
  if (!(missionNamespace getVariable ["fnf_safetyEnabled", true]) || !alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; hintSilent ""};

  if (missionNamespace getVariable ["f_var_mission_timer",10] < 1) then {_maxTime = 0};

  if ([vehicle player, playerSide] call fnf_fnc_inSafeZone) then {
    fnf_startGoodPos = getpos vehicle player;

    if (fnf_startTimer != _maxTime) then {fnf_startTimer = _maxTime; hintSilent ""};
  } else {
    if (fnf_startTimer <= 0) then {
      if (fnf_startGoodPos select 2 > 0.2) then {vehicle player setpos fnf_startGoodPos} else {
        vehicle player setpos (fnf_startGoodPos findEmptyPosition [0, 50, typeOf vehicle player]);
      };
      hintSilent "";
    } else {
      // hint format ["You have %1 seconds to get back to the starting area", fnf_startTimer];
      [format ["<t align='center'><t color='#FF0000' size='1.5'>%1</t><br/>seconds to get back to the safe start zone", fnf_startTimer], "warning", 1] call fnf_ui_fnc_notify;
      fnf_startTimer = fnf_startTimer - 1;
    };
  };
}, 1, [_maxTime]] call CBA_fnc_addPerFrameHandler;
