/*
Ends the game due to elimination. Admin triggered by onPause control.
*/

params ["_sideWon"];

fnf_gameEnd = true;
publicVariable "fnf_gameEnd";

[_sideWon, "has won by elimination!"] spawn fnf_server_fnc_gameEnd;
