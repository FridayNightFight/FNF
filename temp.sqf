//put this on the OBJ modules:
this setVariable ["fnf_codeOnCompletion", "if (isServer) then {missionNamespace setVariable ['rush_currentStage', '2 Safe', true]; _timeServerStarted = missionNamespace getVariable ['fnf_startTime', -1];_result = 99999999;if (isServer and hasInterface) then{	_result = time + (5*60);} else {	_result = (serverTime - _timeServerStarted) + (5*60);};missionNamespace setVariable ['rush_breakEnd', _result, true];};"];

//on init:
if (isServer) then
{
	missionNamespace setVariable ['rush_currentStage', '1 Safe', true];
	[{
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > (1*60);
		} else {
			_result = (serverTime - _timeServerStarted) > (1*60);
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		missionNamespace setVariable ['rush_currentStage', '1 Play', true];
	}] call CBA_fnc_waitUntilAndExecute;

	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "2 Safe"}, {
		[{
			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
			_timeBreakEnds = missionNamespace getVariable ["rush_breakEnd", 99999999999];
			_result = objNull;
			if (isServer and hasInterface) then
			{
				_result = time > _timeBreakEnds;
			} else {
				_result = (serverTime - _timeServerStarted) > _timeBreakEnds;
				if (_timeServerStarted isEqualTo -1) then
				{
					_result = false;
				};
			};
			_result;
		},{
			missionNamespace setVariable ['rush_currentStage', '2 Play', true];
		}] call CBA_fnc_waitUntilAndExecute;
	}] call CBA_fnc_waitUntilAndExecute;

	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "3 Safe"}, {
		[{
			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
			_timeBreakEnds = missionNamespace getVariable ["rush_breakEnd", 99999999999];
			_result = objNull;
			if (isServer and hasInterface) then
			{
				_result = time > _timeBreakEnds;
			} else {
				_result = (serverTime - _timeServerStarted) > _timeBreakEnds;
				if (_timeServerStarted isEqualTo -1) then
				{
					_result = false;
				};
			};
			_result;
		},{
			missionNamespace setVariable ['rush_currentStage', '3 Play', true];
		}] call CBA_fnc_waitUntilAndExecute;
	}] call CBA_fnc_waitUntilAndExecute;

};

if (not hasInterface) exitWith {};

[{not isNil "fnf_playerLoadout"}, {
call FNF_ClientSide_fnc_initWeaponDisable;
_initialSafestartTime = 1;

["playzone_visual_", "", false, false] call FNF_ClientSide_fnc_addZone;
_currentStage = missionNamespace getVariable ["rush_currentStage", "1 Safe"];

rush_respawnPlayer =
{
	params["_respawnObject"];
	setPlayerRespawnTime -1;

	[false, false, false] call ace_spectator_fnc_setSpectator;
	[{
		alive player
	},{
		player setUnitLoadout [fnf_playerLoadout, false];
		setPlayerRespawnTime 99999;

		player setVariable ["tf_voiceVolume", 1, true];

		[{
			[true, true, true] call ace_spectator_fnc_setSpectator;
			[{
				[false, false, false] call ace_spectator_fnc_setSpectator;
				call FNF_ClientSide_fnc_initRadios;
				player setVehiclePosition [_this, [], 100];
			},_this,1] call CBA_fnc_waitAndExecute;
		},_this,1] call CBA_fnc_waitAndExecute;
	}, _respawnObject] call CBA_fnc_waitUntilAndExecute;
};

_startStageSafe2 =
{
	["objSafezone_1_", "colorOPFOR"] call FNF_ClientSide_fnc_setZoneColour;

	player setVariable ["fnf_backpackLocked", 2, true];

	_result = ["playzone_small_1_"] call FNF_ClientSide_fnc_verifyZone;
	if (not _result) then
	{
		["playzone_small_1_", "", true, true] call FNF_ClientSide_fnc_addZone;
		["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	};

	fnf_fortifyDisabled = false;

	["safeZoneGroup", "objSafezone_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	["playZoneGroup", true, true, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;

	if (playerSide isEqualTo east) then
	{
		if (alive player) then
		{
			[{[player, "objSafezone_1_"] call FNF_ClientSide_fnc_isObjectInZone;}, {
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_small_1_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}, [], 120, {
				player setDamage 1;
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_small_1_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}] call CBA_fnc_waitUntilAndExecute;
		} else {
			["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
			["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
			["playzone_small_1_"] call FNF_ClientSide_fnc_removeZone;
			["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
			["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			[rush_obj1RespawnMark] call rush_respawnPlayer;
		};
	} else {
		if (alive player) then
		{
			["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
			["playzone_small_1_"] call FNF_ClientSide_fnc_removeZone;
			["playzone_big_1_", "", true, true] call FNF_ClientSide_fnc_addZone;
			["playZoneGroup", "playzone_big_1_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			[{[player, "objSafezone_2_"] call FNF_ClientSide_fnc_isObjectInZone;}, {
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_big_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_big_1_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}, [], 120, {
				player setDamage 1;
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_big_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_big_1_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}] call CBA_fnc_waitUntilAndExecute;
		} else {
			["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
			["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
			["playzone_small_1_"] call FNF_ClientSide_fnc_removeZone;
			["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
			["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			[rush_obj2RespawnMark] call rush_respawnPlayer;
		};
	};

	fnf_timerMessage = "Regroup Remaining: %1";

	true call FNF_ClientSide_fnc_showTimerInHUD;


	[{
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_timeBreakEnds = missionNamespace getVariable ["rush_breakEnd", 99999999999];
		fnf_timerEndTime = _timeBreakEnds;
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > _timeBreakEnds;
		} else {
			_result = (serverTime - _timeServerStarted) > _timeBreakEnds;
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		["safeZoneGroup", "objSafezone_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
		["safeZoneGroup", false, false, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;
		["playZoneGroup", false, true, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;
		["objSafezone_1_"] call FNF_ClientSide_fnc_removeZone;
		["<t size='1.5' align='center'>Regroup Finished</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now resuming</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
		false call FNF_ClientSide_fnc_showTimerInHUD;
		fnf_fortifyDisabled = true;
		fnf_timerMessage = nil;
		fnf_timerEndTime = nil;
	}] call CBA_fnc_waitUntilAndExecute;
};

_startStageSafe3 =
{
	["objSafezone_2_", "colorOPFOR"] call FNF_ClientSide_fnc_setZoneColour;

	player setVariable ["fnf_backpackLocked", 2, true];

	_result = ["playzone_small_2_"] call FNF_ClientSide_fnc_verifyZone;
	if (not _result) then
	{
		["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
		["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	};

	fnf_fortifyDisabled = false;

	["safeZoneGroup", "objSafezone_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	["playZoneGroup", true, true, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;

	if (playerSide isEqualTo east) then
	{
		if (alive player) then
		{
			[{[player, "objSafezone_2_"] call FNF_ClientSide_fnc_isObjectInZone;}, {
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_small_2_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}, [], 120, {
				player setDamage 1;
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_small_2_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}] call CBA_fnc_waitUntilAndExecute;
		} else {
			["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
			["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
			["playzone_small_2_"] call FNF_ClientSide_fnc_removeZone;
			["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
			["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			[rush_obj2RespawnMark] call rush_respawnPlayer;
		};
	} else {
		if (alive player) then
		{
			["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
			["playzone_small_2_"] call FNF_ClientSide_fnc_removeZone;
			["playzone_big_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
			["playZoneGroup", "playzone_big_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			[{[player, "objSafezone_3_"] call FNF_ClientSide_fnc_isObjectInZone;}, {
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_big_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_big_2_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}, [], 120, {
				player setDamage 1;
				["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
				["playZoneGroup", "playzone_big_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
				["playzone_big_2_"] call FNF_ClientSide_fnc_removeZone;
				["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
				["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			}] call CBA_fnc_waitUntilAndExecute;
		} else {
			["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_editRestrictionGroup;
			["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
			["playzone_small_2_"] call FNF_ClientSide_fnc_removeZone;
			["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
			["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
			[rush_obj3RespawnMark] call rush_respawnPlayer;
		};
	};

	fnf_timerMessage = "Regroup Remaining: %1";

	true call FNF_ClientSide_fnc_showTimerInHUD;


	[{
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_timeBreakEnds = missionNamespace getVariable ["rush_breakEnd", 99999999999];
		fnf_timerEndTime = _timeBreakEnds;
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > _timeBreakEnds;
		} else {
			_result = (serverTime - _timeServerStarted) > _timeBreakEnds;
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		["safeZoneGroup", "objSafezone_2_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
		["safeZoneGroup", false, false, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;
		["playZoneGroup", false, true, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;
		["objSafezone_2_"] call FNF_ClientSide_fnc_removeZone;
		["<t size='1.5' align='center'>Regroup Finished</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now resuming</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
		false call FNF_ClientSide_fnc_showTimerInHUD;
		fnf_fortifyDisabled = true;
		fnf_timerMessage = nil;
		fnf_timerEndTime = nil;
	}] call CBA_fnc_waitUntilAndExecute;
};



if (_currentStage isEqualTo "1 Safe") then
{
	fnf_timerMessage = "Safe Start Remaining: %1";
	fnf_timerEndTime = _initialSafestartTime * 60;

	["safeZoneGroup", true, true, true, true] call FNF_ClientSide_fnc_addRestrictionGroup;
	["opforSafezone_1_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_1_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["safeZoneGroup", "opforSafezone_1_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	["safeZoneGroup", "objSafezone_1_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;

	["objSafezone_2_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_3_", "", true, false] call FNF_ClientSide_fnc_addZone;

	["playZoneGroup", false, true, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["playzone_small_1_", "", true, true] call FNF_ClientSide_fnc_addZone;
	["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;


	_timeToNotify = (_initialSafestartTime * 60) - 300;
	[{
		params["_timeToNotify"];
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > _timeToNotify;
		} else {
			_result = (serverTime - _timeServerStarted) > _timeToNotify;
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		true call FNF_ClientSide_fnc_showTimerInHUD;
		["<t size='1.5' align='center'>Safe Zones Drop in 5 Minutes</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
	}, _timeToNotify] call CBA_fnc_waitUntilAndExecute;


	[{
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > (1*60);
		} else {
			_result = (serverTime - _timeServerStarted) > (1*60);
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		["safeZoneGroup", "opforSafezone_1_"] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
		["safeZoneGroup", false, false, false, false] call FNF_ClientSide_fnc_editRestrictionGroup;
		["opforSafezone_1_"] call FNF_ClientSide_fnc_removeZone;
		["<t size='1.5' align='center'>Safe Zones Dropped</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now starting</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
		false call FNF_ClientSide_fnc_showTimerInHUD;
		fnf_fortifyDisabled = true;
		player setVariable ["fnf_backpackLocked", 2, true];
		fnf_timerMessage = nil;
		fnf_timerEndTime = nil;
	}] call CBA_fnc_waitUntilAndExecute;

	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "2 Safe"}, {call _this;}, _startStageSafe2] call CBA_fnc_waitUntilAndExecute;
	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "3 Safe"}, {call _this;}, _startStageSafe3] call CBA_fnc_waitUntilAndExecute;
};

if (_currentStage isEqualTo "1 Play") then
{
	[true, true, true] call ace_spectator_fnc_setSpectator;
	player setDamage 1;
	["safeZoneGroup", false, false, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["objSafezone_1_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_2_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_3_", "", true, false] call FNF_ClientSide_fnc_addZone;

	["playZoneGroup", false, true, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["playzone_small_1_", "", true, true] call FNF_ClientSide_fnc_addZone;
	["playZoneGroup", "playzone_small_1_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;

	player setVariable ["fnf_backpackLocked", 2, true];
	fnf_fortifyDisabled = true;
	false call FNF_ClientSide_fnc_showTimerInHUD;
	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "2 Safe"}, {call _this;}, _startStageSafe2] call CBA_fnc_waitUntilAndExecute;
	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "3 Safe"}, {call _this;}, _startStageSafe3] call CBA_fnc_waitUntilAndExecute;
};

if (_currentStage isEqualTo "2 Play") then
{
	[true, true, true] call ace_spectator_fnc_setSpectator;
	player setDamage 1;
	["safeZoneGroup", false, false, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["objSafezone_2_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_3_", "", true, false] call FNF_ClientSide_fnc_addZone;

	["playZoneGroup", false, true, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["playzone_small_2_", "", true, true] call FNF_ClientSide_fnc_addZone;
	["playZoneGroup", "playzone_small_2_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;

	player setVariable ["fnf_backpackLocked", 2, true];
	fnf_fortifyDisabled = true;
	false call FNF_ClientSide_fnc_showTimerInHUD;
	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "3 Safe"}, {call _this;}, _startStageSafe3] call CBA_fnc_waitUntilAndExecute;
};

if (_currentStage isEqualTo "3 Play") then
{
	[true, true, true] call ace_spectator_fnc_setSpectator;
	player setDamage 1;
	["safeZoneGroup", false, false, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["objSafezone_3_", "", true, false] call FNF_ClientSide_fnc_addZone;

	["playZoneGroup", false, true, false, false] call FNF_ClientSide_fnc_addRestrictionGroup;
	["playzone_small_3_", "", true, true] call FNF_ClientSide_fnc_addZone;
	["playZoneGroup", "playzone_small_3_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;

	player setVariable ["fnf_backpackLocked", 2, true];
	fnf_fortifyDisabled = true;
	false call FNF_ClientSide_fnc_showTimerInHUD;
};

if (_currentStage isEqualTo "2 Safe") then
{
	["objSafezone_1_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_2_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_3_", "", true, false] call FNF_ClientSide_fnc_addZone;
	call _startStageSafe2;
	if (playerSide isEqualTo east) then
	{
		player setVehiclePosition [rush_obj1RespawnMark, [], 100];
	} else {
		player setVehiclePosition [rush_obj2RespawnMark, [], 100];
	};
	[{_currentStage = missionNamespace getVariable ["rush_currentStage", "NA"]; _currentStage isEqualTo "3 Safe"}, {call _this;}, _startStageSafe3] call CBA_fnc_waitUntilAndExecute;
};

if (_currentStage isEqualTo "3 Safe") then
{
	["objSafezone_2_", "", true, false] call FNF_ClientSide_fnc_addZone;
	["objSafezone_3_", "", true, false] call FNF_ClientSide_fnc_addZone;
	call _startStageSafe3;
	if (playerSide isEqualTo east) then
	{
		player setVehiclePosition [rush_obj2RespawnMark, [], 100];
	} else {
		player setVehiclePosition [rush_obj3RespawnMark, [], 100];
	};
};


}] call CBA_fnc_waitUntilAndExecute;
