/*
	Author: Mallen

	Description:
		Sets up the admin channel for admins to talk in

	Parameter(s):
		None

	Returns:
		None
*/
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
