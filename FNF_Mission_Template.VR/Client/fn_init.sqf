if (isDedicated) exitWith {};

if (not isNil "fnf_playerLoadout") exitWith {};

//get player loadout and store for future use
fnf_playerLoadout = getUnitLoadout player;

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
fnf_spectatorSlotUsed = false;
if (typeOf player isEqualTo "ace_spectator_virtual") exitWith
{
	fnf_spectatorSlotUsed = true;
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

//init breifing
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules, _kitInfoModules, _initModule] call FNF_ClientSide_fnc_initBreifing;

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

//handle if a player dies, put them into spectator and add to group death list
player addEventHandler ["Killed", {
	_killedPlayer = _this select 0;
	_playerGroup = group _killedPlayer;
	_deathQueue = _playerGroup getVariable ["fnf_deathQueue", []];
	_deathQueue pushBack _killedPlayer;
	_playerGroup setVariable ["fnf_deathQueue", _deathQueue];
	[{call FNF_ClientSide_fnc_startSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
}];

//Remove thermals from a vic when a player enters said vic
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (not (equipmentDisabled _vehicle select 1)) then
	{
		_vehicle disableTIEquipment true;
	};
}];

// Track rhs_weap_rsp30_white flare rounds - 2s after firing, sample the
// projectile position perform the reinsert
player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

	if !(_weapon isEqualTo "rhs_weap_rsp30_white") exitWith {};

	if (group _unit getVariable ["reinsertRequested", false]) exitWith {};
	group _unit setVariable ["reinsertRequested", true];

	private _deathQueue = group _unit getVariable ["fnf_deathQueue", []];
	if (count _deathQueue isEqualTo 0) exitWith {};

	private _reinsertUnits = _deathQueue select [0, (count _deathQueue) min 4];

	[{
		params ["_projectile", "_reinsertUnits"];
		private _pos = getPosASL _projectile;
		//diag_log format ["FiredMan flare tracker: pos at 2s — %1", _pos];

		// Debug: spawn crate at flare position
		//"B_supplyCrate_F" createVehicle (ASLToATL _pos);

	}, [_projectile, _reinsertUnits], 2] call CBA_fnc_waitAndExecute;
}];


//handle if some one JIP and theres safezones whether they have expired
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
