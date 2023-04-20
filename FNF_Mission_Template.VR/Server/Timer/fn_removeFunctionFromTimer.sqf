/*
	Author: Mallen

	Description:
		Adds a function that is run every 60 seconds

	Parameter(s):
		0: INTEGER -  A function to be run

	Returns:
		None
*/

params["_functionID"];

_indexToDelete = 0;

{
  if (_x select 1 == _functionID) then
  {
    _indexToDelete = _forEachIndex;
    break;
  }
} forEach fnf_minuteTimerFunctions;

fnf_minuteTimerFunctions deleteAt _indexToDelete;
