/*
	Author: Mallen

	Description:
		Starts counting down until safezone can be removed

	Parameter(s):
		0: STRING -	The zone prefix used by the zone
		1: INTEGER -	The amount of minutes from mission sart until the safe zone is removed

	Returns:
		None
*/

params["_zonePrefix", "_timeZoneIsDeleted"];

//wait until the zone is said to be deleted
[{
	params["_zonePrefix", "_timeZoneIsDeleted"];
	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
	_result = objNull;
	if (isServer and hasInterface) then
	{
		_result = time > (_timeZoneIsDeleted * 60);
	} else {
		_result = (serverTime - _timeServerStarted) > (_timeZoneIsDeleted * 60);
		if (_timeServerStarted isEqualTo -1) then
		{
			_result = false;
		};
	};
	_result;
},{
	params["_zonePrefix", "_timeZoneIsDeleted"];
	["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
	//check if any safe zones still in group
	if (not (["safeZoneGroup"] call FNF_ClientSide_fnc_areAnyZonesInRestrictionGroup)) then
	{
		//if there are not this is the last safe zone and therefor the notification can be sent to player that they can play
		["<t size='1.5' align='center'>Safe Zones Dropped</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now starting</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;

		if (not ace_spectator_isset) then
		{
			fnf_playerLoadout = getUnitLoadout player;
		};

		fnf_timerMessage = nil;
		fnf_timerEndTime = nil;
		false call FNF_ClientSide_fnc_showTimerInHUD;

		fnf_showSelectors = false;

		call FNF_ClientSide_fnc_disableFortify;

		["safeZoneGroup"] call FNF_ClientSide_fnc_removeRestrictionGroup;
	};
	[_zonePrefix] call FNF_ClientSide_fnc_removeZone;
}, [_zonePrefix, _timeZoneIsDeleted]] call CBA_fnc_waitUntilAndExecute;
