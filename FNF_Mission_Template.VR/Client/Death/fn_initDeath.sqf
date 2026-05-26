/*
	Author: OrthyOliver

	Description:
		Sets up reinsert system as well as all reminders

	Parameter(s):
		0: MODULE -	The FNF init module
		1: MODULE -	The FNF misc options module

	Returns:
		None
*/

params["_initModule", "_miscOptionsModule"];

_disableWindow = (_initModule getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);

//reinsert, onelife, respawn
_deathMode = (_miscOptionsModule getVariable ["fnf_deathMode", "reinsert"]);

if (_deathMode isEqualTo "reinsert") then
{
	//setup 5 minute warning
	[{
		params["_disableWindow"];
		_disableWindow = _disableWindow - 5;
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
		["<t align='center' size='1.5'>REINSERT AVAILABLE</t><t align='center'><br/><br/>Reinsert window will close in 5 minutes</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;
	}, [_disableWindow]] call CBA_fnc_waitUntilAndExecute;

	//setup 1 minute warning
	[{
		params["_disableWindow"];
		_disableWindow = _disableWindow - 1;
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
		["<t align='center' size='1.5'>REINSERT AVAILABLE</t><t align='center'><br/><br/>Reinsert window will close in 1 minute</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;
	}, [_disableWindow]] call CBA_fnc_waitUntilAndExecute;

	//setup unavailable notification
	[{
		params["_disableWindow"];
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
		//zero these to ensure time remaining of game is shown
		fnf_timerMessage = nil;
		fnf_timerEndTime = nil;
	}, [_disableWindow]] call CBA_fnc_waitUntilAndExecute;
};


if (fnf_spectatorSlotUsed) exitWith {};

//if deathMode is onelife then set player to main spectator instantly
if (_deathMode isEqualTo "onelife") then
{
	player addEventHandler ["Killed", {
		[{call FNF_ClientSide_fnc_startSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
	}];
};

//if deathMode is reinsert set up reinsert logic
if (_deathMode isEqualTo "reinsert") then
{
	//handle if a player dies, put them into spectator and add to group death list
	player addEventHandler ["Killed", {
		_killedPlayer = _this select 0;

		//add player to groups death queue
		_playerGroup = group _killedPlayer;
		_deathQueue = _playerGroup getVariable ["fnf_deathQueue", []];
		_deathQueue pushBack (getPlayerUID player);
		_playerGroup setVariable ["fnf_deathQueue", _deathQueue, true];

		//get all fnf modules
		_modules = call FNF_ClientSide_fnc_findFNFModules;

		//check if init module is found
		_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
		_initModule = _initModule select 0;

		//check if player could be reinserted, pick spectator script based on this
		_disableWindow = (_initModule getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]) * 60;

		//add 3 seconds to account for time between spectator being situated and this firing
		_disableWindow = _disableWindow + 3;

		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;

		//check if reinsert window has passed
		if (isServer and hasInterface) then
		{
			_result = time > _disableWindow;
		} else {
			_result = (serverTime - _timeServerStarted) > _disableWindow;
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};

		//if it has passed send into regular spectator
		if (_result) then
		{
			[{call FNF_ClientSide_fnc_startSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
			[{["<t align='center' size='1.5'>REINSERT UNAVAILABLE</t><t align='center'><br/><br/>Reinsert window has passed, you cannot be reinserted</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 5] call CBA_fnc_waitAndExecute;
		} else {
			//check if reinsert has already been requested
			_reinsertRequested = group player getVariable ["fnf_reinsertRequested", false];
			if (_reinsertRequested) then
			{
				[{call FNF_ClientSide_fnc_startSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
				[{["<t align='center' size='1.5'>REINSERT UNAVAILABLE</t><t align='center'><br/><br/>Reinsert has already been requested by your squad, you cannot be reinserted</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 5] call CBA_fnc_waitAndExecute;
			} else {
				[{call FNF_ClientSide_fnc_startLimitedSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
				[{["<t align='center' size='1.5'>REINSERT AVAILABLE</t><t align='center'><br/><br/>Reinsert is available provided one of your squadmates calls one in before the window closes</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 5] call CBA_fnc_waitAndExecute;
			};
		};
	}];

	// Track fnf_weap_reinsert_flare flare rounds - 2s after firing, sample the projectile position perform the reinsert
	player addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

		//check if weapon fired is reinsert flare gun
		if !(_weapon isEqualTo "fnf_weap_reinsert_flare") exitWith {};

		//get all fnf modules
		_modules = call FNF_ClientSide_fnc_findFNFModules;

		//check if init module is found
		_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
		_initModule = _initModule select 0;

		//check if reinsert window has closed or not
		_disableWindow = (_initModule getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]) * 60;

		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;

		if (isServer and hasInterface) then
		{
			_result = time > _disableWindow;
		} else {
			_result = (serverTime - _timeServerStarted) > _disableWindow;
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};

		//if window closed, deny reinsert
		if (_result) exitWith {[{["<t align='center' size='1.5'>REINSERT DENIED</t><t align='center'><br/><br/>Reinsert window has passed</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 2] call CBA_fnc_waitAndExecute; };

		//if reinsert already requested, deny reinsert
		if (group _unit getVariable ["fnf_reinsertRequested", false]) exitWith
		{ [{["<t align='center' size='1.5'>REINSERT DENIED</t><t align='center'><br/><br/>Reinsert for this squad has already been called</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 2] call CBA_fnc_waitAndExecute; };

		//get death queue for group
		_deathQueue = group _unit getVariable ["fnf_deathQueue", []];

		//if no one in death queue deny reinsert and use up the reinsert
		if (count _deathQueue isEqualTo 0) exitWith {
			group _unit setVariable ["fnf_reinsertRequested", true, true];
			[{["<t align='center' size='1.5'>REINSERT DENIED</t><t align='center'><br/><br/>No dead squad mates to reinsert</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 2] call CBA_fnc_waitAndExecute;
		};

		//clean up death queue of disconnected and alive players
		_connectedPlayers = _deathQueue select {not isNull (_x call BIS_fnc_getUnitByUID)};
		_deathQueue = _connectedPlayers;
		_deadPlayers = _deathQueue select {not alive (_x call BIS_fnc_getUnitByUID)};
		_deathQueue = _deadPlayers;

		//get up to 4 dead people from the queue
		_reinsertUnits = _deathQueue select [0, ((count _deathQueue) min 4)];

		//remove players from death queue (in case reinsert is re-enabled for some reason)
		_deathQueue deleteRange [0, 4];

		//update variables
		group _unit setVariable ["fnf_deathQueue", _deathQueue, true];
		group _unit setVariable ["fnf_reinsertedPlayers", _reinsertUnits, true];
		group _unit setVariable ["fnf_reinsertRequested", true, true];

		//wait to seconds to allow flare to move
		[{
			params ["_projectile", "_reinsertUnits", "_unit"];
			_pos = getPosASL _projectile;

			//generate list of people being reinserted
			_nameList = "";
			{
				_reinsertObject = (_x call BIS_fnc_getUnitByUID);
				_nameList = (_nameList + "<br/>" + (name _reinsertObject));
			} forEach _reinsertUnits;

			//notify caller
			[format["<t align='center' size='1.5'>REINSERT REQUESTED</t><t align='center'><br/><br/>Please stand by for reinsert of squadmates:%1</t>", _nameList], "success", 10] call FNF_ClientSide_fnc_notificationSystem;

			//ask server to reinsert
			[{
				params ["_pos", "_reinsertUnits", "_unit"];
				[_unit, (ASLToATL _pos), _reinsertUnits] remoteExec ["FNF_ServerSide_fnc_startReinsert", 2];
			}, [_pos, _reinsertUnits, _unit], 28] call CBA_fnc_waitAndExecute;
		}, [_projectile, _reinsertUnits, _unit], 2] call CBA_fnc_waitAndExecute;
	}];
};

//if deathMode is onelife then set player to main spectator instantly
if (_deathMode isEqualTo "respawn") then
{
	//if lives have not been set already set them now
	_defaultLives = (_miscOptionsModule getVariable ["fnf_defaultLives", 3]);
	_currentLives = missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), "NOTSET"];
	if (_currentLives isEqualTo "NOTSET") then
	{
		missionNamespace setVariable [("fnf_livesLeft_" + getPlayerUID player), _defaultLives, true];
	};

	player addEventHandler ["Killed", {
		//get all fnf modules
		_modules = call FNF_ClientSide_fnc_findFNFModules;

		//check if there is a misc options module
		_miscOptionsModule = [_modules, "miscOptions"] call FNF_ClientSide_fnc_findSpecificModules;
		_miscOptionsModule = _miscOptionsModule select 0;

		_respawnTime = (_miscOptionsModule getVariable ["fnf_respawnTime", 300]);
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];

		_timeUntilRespawn = 0;
		if (isServer and hasInterface) then
		{
			_timeUntilRespawn = time + _respawnTime;
		} else {
			_timeUntilRespawn = (serverTime - _timeServerStarted) + _respawnTime;
			if (_timeServerStarted isEqualTo -1) then
			{
				_timeUntilRespawn = time + _respawnTime;
			};
		};

		_storedTimeToRespawn = missionNamespace getVariable [("fnf_timeToRespawn_" + getPlayerUID player), -1];

		if ((_storedTimeToRespawn < _timeUntilRespawn) and (_storedTimeToRespawn > 1)) then
		{
			_timeUntilRespawn = _storedTimeToRespawn;
		};

		_livesLeft = missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), 0];

		_livesLeft = _livesLeft - 1;

		if (_livesLeft < 0) then
		{
			[{call FNF_ClientSide_fnc_startSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
			missionNamespace setVariable [("fnf_timeToRespawn_" + getPlayerUID player), 0, true];
		} else {
			[{call FNF_ClientSide_fnc_startLimitedSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
			missionNamespace setVariable [("fnf_timeToRespawn_" + getPlayerUID player), _timeUntilRespawn, true];
		};

		missionNamespace setVariable [("fnf_livesLeft_" + getPlayerUID player), _livesLeft, true];
	}];
};
