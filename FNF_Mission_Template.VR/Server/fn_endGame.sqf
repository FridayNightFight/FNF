/*
	Author: Mallen

	Description:
		Ends the game depending on which winning sides are passed

	Parameter(s):
		0: ARRAY -  An array of all winning sides (Example: [west, independent])

	Returns:
		None
*/

params["_winningSides"];
if (!isServer) exitWith {};

switch (count _winningSides) do
{
	case 1: {
		switch (_winningSides select 0) do
		{
			case west: {["bluforWin", true] remoteExecCall ["BIS_fnc_endMission"];};
			case east: {["opforWin", true] remoteExecCall ["BIS_fnc_endMission"];};
			case independent: {["independentWin", true] remoteExecCall ["BIS_fnc_endMission"];};
		}
	};
	case 2: {
		switch (_winningSides select 0) do
		{
			case west: {
				switch (_winningSides select 1) do
				{
					case east: {["bluforAndOpforWin", true] remoteExecCall ["BIS_fnc_endMission"];};
					case independent: {["bluforAndIndependentWin", true] remoteExecCall ["BIS_fnc_endMission"];};
				}
			};
			case east: {
				switch (_winningSides select 1) do
				{
					case west: {["bluforAndOpforWin", true] remoteExecCall ["BIS_fnc_endMission"];};
					case independent: {["opforAndIndependentWin", true] remoteExecCall ["BIS_fnc_endMission"];};
				}
			};
			case independent: {
				switch (_winningSides select 1) do
				{
					case west: {["bluforAndIndependentWin", true] remoteExecCall ["BIS_fnc_endMission"];};
					case east: {["opforAndIndependentWin", true] remoteExecCall ["BIS_fnc_endMission"];};
				}
			};
		}
	};
	case 3: {["allWin", true] remoteExecCall ["BIS_fnc_endMission"];};
	default {["draw", true] remoteExecCall ["BIS_fnc_endMission"];};
}