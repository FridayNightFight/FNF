/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows the further text box for contacting staff with the message

	Parameter(s):
	  0: STRING -  A string containing the message sent byy the player

	Returns:
		None
*/

params["_playerName", "_pos", "_message"];

if !(serverCommandAvailable "#kick") exitWith {};
if !(player diarySubjectExists "adminMessages") then
{
  player createDiarySubject ["adminMessages", "Staff Reports"];
};

_mark = createMarkerLocal ["AdminReportMrk_" + str(time) + str(_pos), _pos];

["<t size='1.5' align='center'>New Staff Report</t><br/><br/><t align='center'>From " + _playerName + "</t><br/><br/>" + _message, "error"] call FNF_ClientSide_fnc_notificationSystem;

player createDiaryRecord [
"adminMessages",
[
  [time, "MM:SS"] call BIS_fnc_secondsToString,
    format [
      "<font face=""PuristaMedium""><font size=""14"" color=""#22FF22"">%1</font><br/><marker name=""%2"">Go to position of report</marker><br/><br/>MESSAGE:</font><br/><font face=""RobotoCondensed"">%3</font>",
      _playerName,
      _mark,
      (_message + '<br/>')
    ]
  ]
];
