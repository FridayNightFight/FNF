/*
	Author: Mallen

	Description:
		Ends the game depending on which winning sides are passed

	Parameter(s):
		0: ARRAY -	An array of all winning sides (Example: [west, independent])

	Returns:
		None
*/

params["_winningSides"];
if (!isServer) exitWith {};

_winningEnding = "";
_winningOCAP = "";

switch (count _winningSides) do
{
	case 1: {
		switch (_winningSides select 0) do
		{
			case west: {
				_winningOCAP = "Blufor have Won!";
				_winningEnding = "bluforWin";
			};
			case east: {
				_winningOCAP = "Opfor have Won!";
				_winningEnding = "opforWin";
			};
			case independent: {
				_winningOCAP = "Independent have Won!";
				_winningEnding = "independentWin";
			};
		}
	};
	case 2: {
		switch (_winningSides select 0) do
		{
			case west: {
				switch (_winningSides select 1) do
				{
					case east: {
						_winningOCAP = "Blufor and Opfor have Won!";
						_winningEnding = "bluforAndOpforWin";
					};
					case independent: {
						_winningOCAP = "Blufor and Independent have Won!";
						_winningEnding = "bluforAndIndependentWin";
					};
				}
			};
			case east: {
				switch (_winningSides select 1) do
				{
					case west: {
						_winningOCAP = "Blufor and Opfor have Won!";
						_winningEnding = "bluforAndOpforWin";
					};
					case independent: {
						_winningOCAP = "Opfor and Independent have Won!";
						_winningEnding = "opforAndIndependentWin";
					};
				}
			};
			case independent: {
				switch (_winningSides select 1) do
				{
					case west: {
						_winningOCAP = "Blufor and Independent have Won!";
						_winningEnding = "bluforAndIndependentWin";
					};
					case east: {
						_winningOCAP = "Opfor and Independent have Won!";
						_winningEnding = "opforAndIndependentWin";
					};
				}
			};
		}
	};
	case 3: {
		_winningOCAP = "Blufor, Opfor, and Independent have Won!";
		_winningEnding = "allWin";
	};
	default {
		_winningOCAP = "No side have Won!";
		_winningEnding = "draw";
	};
};

if (isDedicated) then
{
	_currentReviews = missionNamespace getVariable "fnf_missionsReviews";
	_missionName = missionName;
	_author = getMissionConfigValue "author";
	_reviewArray = _currentReviews toArray false;
	["fnf.call_slow_review_submit", [_missionName, _author, _reviewArray]] call py3_fnc_callExtension;
};

if (count _winningSides isEqualTo 1) then
{
	["ocap_exportData", [(_winningSides select 0), _winningOCAP]] call CBA_fnc_serverEvent;
} else {
	["ocap_exportData", [sideUnknown, _winningOCAP]] call CBA_fnc_serverEvent;
};

[_winningEnding, true] remoteExecCall ["BIS_fnc_endMission"];
