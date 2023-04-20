/*
	Author: Mallen

	Description:
		Adds a function that is run every 60 seconds

	Parameter(s):
		0: FUNCTION -  A function to be run

	Returns:
		Integer Function ID
*/

params ["_function"];

_currentID = 0;

if (count fnf_minuteTimerFunctions != 0) then
{
  _currentID = (fnf_minuteTimerFunctions select -1) select 1;
};

_newID = _currentID + 1;

fnf_minuteTimerFunctions pushBack [_function, _newID];

_newID;
