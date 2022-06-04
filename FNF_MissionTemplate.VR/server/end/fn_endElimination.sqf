/*
Ends the game due to elimination. Admin triggered by onPause control.
*/

params ["_sideWon"];

[_sideWon, "has won by elimination!"] spawn phx_fnc_gameEnd;
