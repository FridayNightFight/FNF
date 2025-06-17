/*
	Author: Mallen

	Description:
		Shows the units on players side in the GPS screen

	Parameter(s):
		0: STRING -	The ID of the Image to display
		1: INTEGER - The expected amount of data packets that should have been recieved

	Returns:
		None
*/

params["_id", "_amount"];

[{
	params["_id", "_amount"];
	_currentDataCount = count (fnf_imageRecieveHashMap getOrDefault [_id, createHashMap]);
	_currentDataCount isEqualTo _amount;
}, {
	params["_id", "_amount"];

	_currentData = fnf_imageRecieveHashMap getOrDefault [_id, createHashMap];
	_stringToJoin = [];

	for [{_i = 0}, {_i < _amount}, { _i = _i + 1 }] do
	{
		_packet = _currentData getOrDefault [_i, ""];
		_stringToJoin pushBack _packet;
	};

	_string = _stringToJoin joinString "";

	[_string, "info", 20, 0, true] call FNF_ClientSide_fnc_notificationSystem;

}, [_id, _amount], 5, {
	params["_id", "_amount"];
	fnf_imageRecieveHashMap deleteAt _id;
}] call CBA_fnc_waitUntilAndExecute;
