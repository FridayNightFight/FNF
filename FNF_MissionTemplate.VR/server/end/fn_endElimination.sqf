/*
Ends the game due to elimination. Admin triggered by onPause control.
*/

params ["_sideWon"];

phx_gameEnd = true;
publicVariable "phx_gameEnd";

[_sideWon, "has won by elimination!"] spawn phx_fnc_gameEnd;
