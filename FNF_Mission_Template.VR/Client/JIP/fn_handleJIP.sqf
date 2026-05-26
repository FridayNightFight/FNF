/*
	Author: Mallen

	Description:
		handles what to do with a player that has joined in progress

	Parameter(s):
		0: ARRAY -	The FNF safezone modules
		1: MODULE -	The FNF misc options module

	Returns:
		None
*/
params["_safeZoneModules", "_miscOptionsModule"];

if (not didJIP) exitWith {};

//reinsert, onelife, respawn
_deathMode = (_miscOptionsModule getVariable ["fnf_deathMode", "reinsert"]);
if (_deathMode isEqualTo "respawn") then
{
	//check if they have any lives left, if not kill them
	_livesLeft = missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), 3];

	if (_livesLeft < 0) then
	{
		player setDamage 1;
	} else {
		//check if there is a current time to respawn, if there is check if it has passed, if it hasn't kill them
		_storedTimeToRespawn = missionNamespace getVariable [("fnf_timeToRespawn_" + getPlayerUID player), -1];
		if (missionNamespace getVariable ["fnf_startTime", 0] isNotEqualTo 0) then
		{
			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
			if ((serverTime - _timeServerStarted) < _storedTimeToRespawn) then
			{
				player setDamage 1;
			};
		} else {
			[{
				_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
				_timeServerStarted isNotEqualTo -1;
			},{
				params["_storedTimeToRespawn"];
				_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
				if ((serverTime - _timeServerStarted) < _storedTimeToRespawn) then
				{
					player setDamage 1;
				};
			}, [_storedTimeToRespawn]] call CBA_fnc_waitUntilAndExecute;
		};
	};
} else {
	//handle if theres safezones whether they have expired
	if (count _safeZoneModules isNotEqualTo 0 and didJIP) then
	{
		if (missionNamespace getVariable ["fnf_startTime", 0] isNotEqualTo 0) then
		{
			_result = [_safeZoneModules] call FNF_ClientSide_fnc_anyNonExpiredSafeZones;
			if (not _result) then
			{
				[true, true, true] call ace_spectator_fnc_setSpectator;
				player setDamage 1;
			};
		} else {
			[{
				_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
				_timeServerStarted isNotEqualTo -1;
			},{
				params["_safeZoneModules"];
				_result = [_safeZoneModules] call FNF_ClientSide_fnc_anyNonExpiredSafeZones;
				if (not _result) then
				{
					[true, true, true] call ace_spectator_fnc_setSpectator;
					player setDamage 1;
				};
			}, [_safeZoneModules]] call CBA_fnc_waitUntilAndExecute;
		};
	};
};
