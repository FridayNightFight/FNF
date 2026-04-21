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

//tell server to save OCAP
if (count _winningSides isEqualTo 1) then
{
	["ocap_exportData", [(_winningSides select 0), _winningOCAP]] call CBA_fnc_serverEvent;
} else {
	["ocap_exportData", [sideUnknown, _winningOCAP]] call CBA_fnc_serverEvent;
};

//get items for ending notification for players
_picture = getText (missionConfigFile >> "CfgDebriefing" >> _winningEnding >> "picture");
_pictureIcon = getText (configfile >> "CfgMarkers" >> _picture >> "icon");

_pictureColor = getArray (missionConfigFile >> "CfgDebriefing" >> _winningEnding >> "pictureColor");
_pictureHTMLColor = _pictureColor call BIS_fnc_colorRGBAtoHTML;

_subtitle = getText (missionConfigFile >> "CfgDebriefing" >> _winningEnding >> "subtitle");

[format["<t size='1.5' align='center'>%1</t><t align='center'></t><br/><img color='%2' size='6' align='center' image='%3'/><br/><t align='center'>%4</t><br/><br/><t align='center'>If you haven't already, please leave a mission review so we can improve our missions for next time!</t>", _winningOCAP, _pictureHTMLColor, _pictureIcon, _subtitle], "info", 30] remoteExec ["FNF_ClientSide_fnc_notificationSystem", 0, false];

//wait 30 seconds for people to post reviews
[{
	params["_winningEnding"];

	//if on server save reviews
	if (isDedicated) then
	{
		_currentReviews = missionNamespace getVariable "fnf_missionsReviews";
		_missionName = missionName;
		_author = getMissionConfigValue "author";
		_reviewArray = _currentReviews toArray false;
		["fnf.call_slow_review_submit", [_missionName, _author, _reviewArray]] call py3_fnc_callExtension;
	};

	//tell clients to end mission
	[_winningEnding, true] remoteExecCall ["BIS_fnc_endMission"];
}, [_winningEnding], 30] call CBA_fnc_waitAndExecute;
