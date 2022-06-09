/*
Disables typing in chat if player is not staff
*/

[{!isNil "fnf_staffInfo"}, {
  _display = _this select 0;

  if !((getPlayerUID player) in fnf_staffInfo) then {
    (findDisplay _display) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
  };

  if ((getPlayerUID player) in fnf_staffInfo) then {
    0 enableChannel true;
  } else {
    0 enableChannel false;
  };
}, [_this], 60] call CBA_fnc_waitUntilAndExecute;
