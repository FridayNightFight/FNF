if (isDedicated) exitWith {};

if (not isNil "fnf_playerLoadout") exitWith {};

//get player loadout and store for future use
fnf_playerLoadout = getUnitLoadout player;

_lives = missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), -2];
if (_lives isEqualTo -2) then
{
	missionNamespace setVariable [("fnf_livesLeft_" + getPlayerUID player), 2, true];
};

_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _initModule isEqualTo 0) exitWith {systemChat "DANGER: No FNF Init found, exiting mission prep"};
if (count _initModule > 1) exitWith {systemChat "DANGER: Multiple FNF Init found, exiting mission prep"};
_initModule = _initModule select 0;
fnf_debug = _initModule getVariable ["fnf_debug", true];

//restrict players vanilla actions
[_initModule] call FNF_ClientSide_fnc_restrictPlayer;

//mark custom things
call FNF_ClientSide_fnc_markEditorPlacedObjects;

//if player is in a spectator slot get them out of here
if (typeOf player isEqualTo "ace_spectator_virtual") exitWith
{
	[_modules, _initModule] call FNF_ClientSide_fnc_initSpectatorSlot;
};

//setup player radio stereo settings
call FNF_ClientSide_fnc_initRadios;

//init zones
call FNF_ClientSide_fnc_initZones;

//init Overall Timer
[_initModule] call FNF_ClientSide_fnc_initOverallTimer;

//init ORBAT
call FNF_ClientSide_fnc_initOrbat;

//check how often player has played and do new player experience
call FNF_ClientSide_fnc_initNewPlayerExperience;

//setup fortify options
[_initModule] call FNF_ClientSide_fnc_initFortify;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules isEqualTo 0) then
{
	if (fnf_debug) then {
		systemChat "WARNING: No objectives present"
	};
} else {
	call FNF_ClientSide_fnc_initTaskControl;
	[_objModules] call FNF_ClientSide_fnc_initObjs;
};

//check if there is a playzone
_playZoneModules = [_modules, "playZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _playZoneModules isEqualTo 0) then
{
	if (fnf_debug) then {
		systemChat "WARNING: No playzone present"
	};
} else {
	[_playZoneModules] call FNF_ClientSide_fnc_initPlayZones;
};

//check there are safe zones
_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _safeZoneModules isEqualTo 0) then
{
	if (fnf_debug) then {
		systemChat "WARNING: No safe zones present";
	};
	call FNF_ClientSide_fnc_disableFortify;
} else {
	[_safeZoneModules] call FNF_ClientSide_fnc_initSafeZones;
};

//check there are teleport poles
_teleportModules = [_modules, "teleportPoles"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _teleportModules isNotEqualTo 0) then
{
	[_teleportModules] call FNF_ClientSide_fnc_initTeleportPoles;
};

//check there are selectors
_selectorModules = [_modules, "selectorHost"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _selectorModules isNotEqualTo 0) then
{
	[_selectorModules] call FNF_ClientSide_fnc_initSelectors;
};

//check there are asset selectors
_assetSelectorModules = [_modules, "selectorAssetHost"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _assetSelectorModules isNotEqualTo 0) then
{
	[_assetSelectorModules] call FNF_ClientSide_fnc_initAssetSelectors;
};

//init breifing
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules, _kitInfoModules, _initModule, _assetSelectorModules] call FNF_ClientSide_fnc_initBreifing;

//start gps icons
call FNF_ClientSide_fnc_initGPSUnitMarkers;

//add zues options
call FNF_ClientSide_fnc_zuesAceOptions;

//start backpack locking system
call FNF_ClientSide_fnc_initBackpackLocking;

//if there are objectives start watching them
if (not isNil "fnf_objectives") then
{
	[{call FNF_ClientSide_fnc_watchObjs;}, 1] call CBA_fnc_addPerFrameHandler;
};

inGameUISetEventHandler ["Action", "
	params ['_target', '_caller', '_index', '_engineName', '_text', '_priority', '_showWindow', '_hideOnUse', '_shortcut', '_visibleMenu', '_eventName'];
	_actionList = ['MoveToCommander', 'MoveToDriver', 'MoveToGunner', 'MoveToPilot', 'MoveToTurret', 'GetInCommander', 'GetInDriver', 'GetInGunner', 'GetInPilot', 'GetInTurret'];
	if (!(_engineName in _actionList)) exitWith {false;};
	_return = false;

	_ffvSeats = (allTurrets [_target, true] - allTurrets [_target, false]);
	_ffvSeatFound = false;
	{
		_config = [_target, _x] call BIS_fnc_turretConfig;
		_ffvName = getText (_config >> 'gunnerName');
		_isGunner = getNumber (_config >> 'primaryGunner');
		_isCommander = getNumber (_config >> 'primaryObserver');

		if (_isGunner isEqualTo 1 or _isCommander isEqualTo 1) then
		{
			continue;
		};

		if (_ffvName in _text) then
		{
			_ffvSeatFound = true;
			break;
		};
	} forEach _ffvSeats;

	if (_ffvSeatFound) exitWith {false;};

	if (_target getVariable ['fnf_golfAsset', false]) then
	{
		_listOfKeywords = ['Golf', 'Alpha', 'Bravo', 'Charlie', 'Company HQ'];
		_return = true;
		{
			if (_x in (roleDescription player)) then
			{
				_return = false;
			};
		} forEach _listOfKeywords;
		if (_return) then
		{
			['<t align=""center"">Cannot operate this vehicle, you must be a golf unit to do this</t>', 'error'] call FNF_ClientSide_fnc_notificationSystem;
		};
	};
	if (_target getVariable ['fnf_hotelAsset', false]) then
	{
		_return = true;
		if ('Hotel' in (roleDescription player)) then
		{
			_return = false;
		} else {
			['<t align=""center"">Cannot operate this vehicle, you must be a hotel unit to do this</t>', 'error'] call FNF_ClientSide_fnc_notificationSystem;
		};
	};
	_return;
"];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (not (equipmentDisabled _vehicle select 1)) then
	{
		_vehicle disableTIEquipment true;
	};
}];

if (_lives isEqualTo -1) then
{
	player setDamage 1;
	setPlayerRespawnTime 0;
	[{call FNF_ClientSide_fnc_startSpectator;}, [], 0.5] call CBA_fnc_waitAndExecute;
	[{player enableSimulation false;}, [], 1] call CBA_fnc_waitAndExecute;
};

call FNF_ClientSide_fnc_initVicRearmReplacement;

//check if there are mobileSpawnPoints
_mobileSpawnPoints = [_modules, "mobileSpawnPointHandeler"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _mobileSpawnPoints isNotEqualTo 0) then
{
	[_mobileSpawnPoints] call FNF_ClientSide_fnc_initMobileSpawnPoints;
};

//handle if a player dies, put them into spectator
player addEventHandler ["Killed", {
	_playerLives = missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), 0];
	if (_playerLives isEqualTo 0) then
	{
		setPlayerRespawnTime 0;
		missionNamespace setVariable [("fnf_livesLeft_" + getPlayerUID player), -1, true];
		[{call FNF_ClientSide_fnc_startSpectator;}, [], 0.5] call CBA_fnc_waitAndExecute;
		[{player enableSimulation false;}, [], 1] call CBA_fnc_waitAndExecute;
	} else {
		[false, false, false] call ace_spectator_fnc_setSpectator;
		player enableSimulation true;
		missionNamespace setVariable [("fnf_livesLeft_" + getPlayerUID player), (_playerLives - 1), true];
	};
}];

player addEventHandler ["Respawn", {
	player setUnitLoadout fnf_playerLoadout;
	fnf_selections = [];

	//choose what Encryption Code is required
	_encryptionCode = "fnf_default_code";

	switch (playerSide) do {
		case west: {_encryptionCode = "fnf_blufor_code";};
		case east:
		{
			if ([east, west] call BIS_fnc_sideIsFriendly) then
			{
				_encryptionCode = "fnf_blufor_code";
			} else {
				_encryptionCode = "fnf_opfor_code";
			};
		};
		case independent:
		{
			_encryptionCode = "fnf_indfor_code";
			if ([independent, west] call BIS_fnc_sideIsFriendly) then
			{
				_encryptionCode = "fnf_blufor_code";
			};
			if ([independent, east] call BIS_fnc_sideIsFriendly) then
			{
				_encryptionCode = "fnf_opfor_code";
			};
			if ([east, west] call BIS_fnc_sideIsFriendly) then
			{
				_encryptionCode = "fnf_indfor_code";
			};
		};
		default { };
	};

	_isSrRadio = false;
	{
		if ((_x call TFAR_fnc_isRadio) or (_x call TFAR_fnc_isPrototypeRadio)) then
		{
			_isSrRadio = true;
		};
	} forEach (assignedItems player);

	//if player has SR set up encryption codes and put it in left ear
	if (_isSrRadio) then
	{
		[{
			_test = call TFAR_fnc_activeSWRadio;
			not isNil "_test";
		},{
			[(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
			[(call TFAR_fnc_activeSWRadio), _this] call TFAR_fnc_setSwRadioCode;
		}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;
	};

	//if player has an LR set encryption codes and put it in right ear
	if ((backpack player) call TFAR_fnc_isLrRadio) then
	{
		[{
			_test = call TFAR_fnc_activeLrRadio;
			not isNil "_test";
		},{
			[call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
			[(call TFAR_fnc_activeLrRadio), _this] call TFAR_fnc_setLrRadioCode;
		}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;

		if (_isSrRadio) then
		{
			[{
				_test = call TFAR_fnc_activeSWRadio;
				not isNil "_test";
			},{
				[(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
				[(call TFAR_fnc_activeSWRadio), _this] call TFAR_fnc_setSwRadioCode;
			}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;
		};
	} else {
		//if no LR check if player has SR, if they do have Alt net be setup in right ear
		if (_isSrRadio) then
		{
			[{
				_test = call TFAR_fnc_activeSWRadio;
				not isNil "_test";
			},{
				[(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
				[(call TFAR_fnc_activeSWRadio), _this] call TFAR_fnc_setSwRadioCode;
				_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
				_settings set [5, 1];
				_settings set [6, 2];
				[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
			}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;
		};
	};
}];
