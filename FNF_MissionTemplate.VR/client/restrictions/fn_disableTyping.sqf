/*
Disables typing in global, side and spectator chat if player is not staff
*/

0 enableChannel false;
1 enableChannel [false, true];
6 enableChannel false;

[{!isNil "fnf_staffInfo"}, {
  if ((getPlayerUID player) in fnf_staffInfo) then {
    0 enableChannel true;
    1 enableChannel true;
  };
}] call CBA_fnc_waitUntilAndExecute;

setCurrentChannel 1;
