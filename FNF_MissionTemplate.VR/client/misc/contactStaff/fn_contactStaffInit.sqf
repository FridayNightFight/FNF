
[{!isNil "phx_adminChannelId" && time > 0 && !isNull player}, {

	private _isStaff = true;
	if (!isNil "fnf_staffInfo") then {
		_isStaff = (getPlayerUID player) in fnf_staffInfo;
	};
	// phx_adminChannelId = radioChannelCreate [
	// 	[1,1,0, 1], // RGBA color
	// 	"Staff Channel", // channel name
	// 	"[STAFF/REPORTS] %UNIT_NAME", // callsign
	// 	[]
	// ];
	
	// if (_isStaff || isServer) then {
		phx_adminChannelId radioChannelAdd [player];
		(5 + phx_adminChannelId) enableChannel [true, false];
		PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_MessageLog", "STAFF - Reports", "description\images\fnfsmall.paa"];
	// };

	phx_adminChannelId radioChannelSetCallSign "NOTICE:";
	player customChat [phx_adminChannelId, "Administrative channel initialized. Listening for user reports."];
	phx_adminChannelId radioChannelSetCallSign "[STAFF] %UNIT_SIDE %UNIT_GRP_NAME %UNIT_NAME";

}] call CBA_fnc_waitUntilAndExecute;


phxAdminMessageReceiver = ["phxAdminMessageSent", {
	params ["_sender", "_infoText", "_msgText"];

	showChat true;
	// enableRadio true;
	phx_adminChannelId radioChannelSetCallSign "[REPORT] %UNIT_SIDE %UNIT_GRP_NAME %UNIT_NAME";
	_sender customChat [phx_adminChannelId, _infoText # 0];
	{
		_sender customChat [phx_adminChannelId, _x];
		// _sender customChat [phx_adminChannelId, "MSG " + str(_forEachIndex + 1) + ": " + _x];
	} forEach _msgText;
	phx_adminChannelId radioChannelSetCallSign "[STAFF] %UNIT_SIDE %UNIT_GRP_NAME %UNIT_NAME";
	// [] spawn {sleep 10; enableRadio false;};

	date apply {
		if (count str(_x) isEqualTo 1) then {
			"0" + str(_x)
		} else {
			str(_x);
		};
	} params ["_year", "_month", "_day", "_hours", "_minutes"];

	missionNamespace setVariable ["phx_lastAdminReporter", [_sender, position _sender]];
	private _mark = createMarkerLocal ["AdminReportMrk_" + str(random(36000) + 14000), position _sender];

	player createDiaryRecord [
		"PHX_Diary_Admin_MessageLog",
		[
			format [
				"[%1:%2] %3",
				_hours,
				_minutes,
				name _sender
			],
			format [
				"<font face=""PuristaMedium""><font size=""14"" color=""#22FF22"">%1</font><br/>%2<br/><marker name=""%3"">Go to position of report</marker><br/><br/>MESSAGE:</font><br/><font face=""RobotoCondensed"">%4</font>",
				name _sender,
				(_infoText joinString '<br/>'),
				_mark,
				(_msgText joinString '<br/>')
			]
		]
	];

	// add LOG to diary with clickable map marker for location
}] call CBA_fnc_addEventHandler;



// on taking admin/logging in
/* 
	if (diarySubjectExists "adminSubject") then {
		player removeDiarySubject "adminSubject"
	};

	player createDiarySubject ["adminSubject", _admin, _image];
	player createDiaryRecord ... do this again
*/

// hide ACE UI
/*
	ace_spectator_uivisible
*/