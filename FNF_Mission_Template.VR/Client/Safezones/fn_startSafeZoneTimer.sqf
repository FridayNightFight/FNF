/*
	Author: Mallen

	Description:
		Starts counting down until safezone can be removed

	Parameter(s):
		0: STRING -	The zone prefix used by the zone
		1: INTEGER -	The amount of minutes from mission sart until the safe zone is removed
		2: BOOL -	Whether the zone is a switching zone and should not be deleted

	Returns:
		None
*/

params["_zonePrefix", "_timeZoneIsDeleted", "_switchingZone"];

//wait until the zone is said to be deleted
[{
	params["_zonePrefix", "_timeZoneIsDeleted", "_switchingZone"];
	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
	_result = objNull;
	if (isServer and hasInterface) then
	{
		_result = time > (_timeZoneIsDeleted * 60);
	} else {
		_result = (serverTime - _timeServerStarted) > (_timeZoneIsDeleted * 60);
	};
	if (time < 1) then
	{
		_result = false;
	};
	_result;
},{
	params["_zonePrefix", "_timeZoneIsDeleted", "_switchingZone"];
	["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
	//check if any safe zones still in group
	if ((not (["safeZoneGroup"] call FNF_ClientSide_fnc_areAnyZonesInRestrictionGroup)) and (not fnf_safeZoneFinalZoneSent)) then
	{
		//if there are not this is the last safe zone and therefor the notification can be sent to player that they can play
		["<t size='1.5' align='center'>Safe Zones Dropped</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now starting</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;

		fnf_safeZoneFinalZoneSent = true;

		fnf_timerMessage = nil;
		fnf_timerEndTime = nil;
		false call FNF_ClientSide_fnc_showTimerInHUD;

		call FNF_ClientSide_fnc_disableFortify;

		player setVariable ["fnf_backpackLocked", 2, true];

		["safeZoneGroup"] call FNF_ClientSide_fnc_removeRestrictionGroup;
	};
	if (!_switchingZone) then
	{
		["safeZoneSwitchingGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
		[_zonePrefix] call FNF_ClientSide_fnc_removeZone;
	};
}, [_zonePrefix, _timeZoneIsDeleted, _switchingZone]] call CBA_fnc_waitUntilAndExecute;
