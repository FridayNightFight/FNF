/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows the further text box for contacting staff with the message

	Parameter(s):
		0: STRING -	A string containing the message sent byy the player

	Returns:
		None
*/

params["_playerName", "_pos", "_message"];

fnf_staffInfo = [
  "76561198004582151",
  "76561198089279362",
  "76561198106536334",
  "76561198045877943",
  "76561197963359463",
  "76561198077070073",
  "76561197972754614",
  "76561198111741251"
];

//if player is not logged in admin, kick them
if (not ((getPlayerUID player) in fnf_staffInfo)) exitWith {};

//if the admin messages section in the map doesnt exist, create it
if !(player diarySubjectExists "adminMessages") then
{
	player createDiarySubject ["adminMessages", "Staff Reports"];
};

//create local invisible marker at players location to allow locate button to work
//TODO: this could fail due to REALLY rare circumstances but is possible, lets fix that
_mark = createMarkerLocal ["AdminReportMrk_" + str(time) + str(_pos), _pos];

//show notification of the message
["<t size='1.5' align='center'>New Staff Report</t><br/><br/><t align='center'>From " + _playerName + "</t><br/><br/>" + _message, "deep-purple"] call FNF_ClientSide_fnc_notificationSystem;

//creates the staff report to look at afterwards
player createDiaryRecord [
"adminMessages",
[
	([time, "MM:SS"] call BIS_fnc_secondsToString) + " " + _playerName,
		format [
			"<font face='PuristaMedium'><font size='14' color='#22FF22'>%1</font><br/><marker name='%2'>Go to position of report</marker><br/><br/>MESSAGE:</font><br/><font face='RobotoCondensed'>%3</font>",
			_playerName,
			_mark,
			(_message + '<br/>')
		]
	]
];
