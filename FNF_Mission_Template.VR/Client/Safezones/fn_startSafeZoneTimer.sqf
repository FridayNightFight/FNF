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
	if ((not (["safeZoneGroup"] call FNF_ClientSide_fnc_areAnyZonesInRestrictionGroup)) and (not fnf_safeZoneFinalZoneSent)) then
	{
		//if there are not this is the last safe zone and therefor the notification can be sent to player that they can play
		["<t size='1.5' align='center'>Safe Zones Dropped</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now starting</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;

		fnf_safeZoneFinalZoneSent = true;

		if (not ace_spectator_isset) then
		{
			fnf_playerLoadout = getUnitLoadout player;
		};

		_disableWindow = (missionNamespace getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);

		fnf_timerMessage = "Reinsert Window Remaining: %1";
		fnf_timerEndTime = _disableWindow * 60;

		//wait until the zone is said to be deleted
		[{
			_disableWindow = (missionNamespace getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);
			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
			_result = objNull;
			if (isServer and hasInterface) then
			{
				_result = time > (_disableWindow * 60);
			} else {
				_result = (serverTime - _timeServerStarted) > (_disableWindow * 60);
				if (_timeServerStarted isEqualTo -1) then
				{
					_result = false;
				};
			};
			_result;
		},{
			["<t align='center' size='1.5'>REINSERT UNAVAILABLE</t><t align='center'><br/><br/>Reinsert window has passed</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;
			fnf_timerMessage = nil;
			fnf_timerEndTime = nil;
		}] call CBA_fnc_waitUntilAndExecute;


		false call FNF_ClientSide_fnc_showTimerInHUD;

		fnf_showSelectors = false;

		call FNF_ClientSide_fnc_disableFortify;

		player setVariable ["fnf_backpackLocked", 2, true];

		["safeZoneGroup"] call FNF_ClientSide_fnc_removeRestrictionGroup;
	};
	[_zonePrefix] call FNF_ClientSide_fnc_removeZone;
}, [_zonePrefix, _timeZoneIsDeleted]] call CBA_fnc_waitUntilAndExecute;
