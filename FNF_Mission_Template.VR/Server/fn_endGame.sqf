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

if (isClass (configFile >> "CfgPatches" >> "OCAP")) then
{
	if (count _winningSides isEqualTo 1) then
	{
		[(_winningSides select 0),_winningOCAP] call ocap_fnc_exportData;
	} else {
		[_winningOCAP] call ocap_fnc_exportData;
	};
};

_mvpScores = [];
{
  _scores = getPlayerScores _x;
  _name = name _x;
  _mvpScores pushBack [_scores select 0, _name];
} forEach allPlayers;

_mvpScores sort false;

//Done to ensure always 3 people for leaderboard
_mvpScores pushBack [0, "N/A"];
_mvpScores pushBack [0, "N/A"];
_mvpScores pushBack [0, "N/A"];

_string = "<t align='center' size='1.4' color='#FFFFFF'>MVP Scores:</t><t align='center'><br/><br/>1st: " + (_mvpScores select 0 select 1) + " - " + str(_mvpScores select 0 select 0) + " Kills<br/>2nd: " + (_mvpScores select 1 select 1) + " - " + str(_mvpScores select 1 select 0) + " Kills<br/>3rd: " + (_mvpScores select 2 select 1) + " - " + str(_mvpScores select 2 select 0) + " Kills</t>";

["<t align='center' size='2' color='#FFFFFF'>GAME ENDED</t><t align='center' size='1.5'><br/><br/>" + _winningOCAP + "</t>", "info", 22] remoteExec ["FNF_ClientSide_fnc_notificationSystem", 0, false];

[{
  [_this, "info", 19] remoteExec ["FNF_ClientSide_fnc_notificationSystem", 0, false];
}, _string, 3] call CBA_fnc_waitAndExecute;

[{
  [_this, true] remoteExecCall ["BIS_fnc_endMission"];
}, _winningEnding, 13] call CBA_fnc_waitAndExecute;
