/*
	Author: Mallen

	Description:
		Sets up a timer used to track items in minute intervals

	Parameter(s):
		None

	Returns:
		None
*/

fnf_minuteTimerFunctions = [];

[{
  {
    call (_x select 0);
  } forEach fnf_minuteTimerFunctions;
}, 60] call CBA_fnc_addPerFrameHandler;
