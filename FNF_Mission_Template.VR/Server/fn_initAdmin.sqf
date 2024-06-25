/*
	Author: Mallen

	Description:
		Sets up the admin channel for admins to talk in

	Parameter(s):
		None

	Returns:
		None
*/
fnf_staffInfo = [
  "76561198004582151",
  "76561198089279362",
  "76561198106536334",
  "76561198045877943",
  "76561197963359463",
  "76561198077070073",
  "76561197972754614",
  "76561198111741251",
  //Mallen, For testing:
  "76561198061743924"
];

[{not isNil "fnf_staffInfo"},{

	_adminChannelId = radioChannelCreate [
		[1,1,0,1], // RGBA color
		"Staff Channel", // channel name
		"[STAFF] %UNIT_SIDE %UNIT_GRP_NAME %UNIT_NAME", // callsign
		allPlayers select {getPlayerUID _x in fnf_staffInfo}
	];

	[{
		params["_adminChannelId"];
		_adminChannelId radioChannelAdd (allPlayers select {getPlayerUID _x in fnf_staffInfo});
	}, 15, _adminChannelId] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_waitUntilAndExecute;
