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

//check if there is a misc options module
_miscOptionsModule = [_modules, "miscOptions"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _miscOptionsModule > 1) then {systemChat "WARNING: Multiple FNF Misc Options found, only one will have values read correctly"};
if (count _miscOptionsModule < 1) then
{
	//if no module found create one with default values ONLY on client
	_miscOptionsModule = "fnf_module_miscOptions" createVehicleLocal [0,0,0];
} else {
	_miscOptionsModule = _miscOptionsModule select 0;
};

//if player is in a spectator slot get them out of here
fnf_spectatorSlotUsed = false;
if (typeOf player isEqualTo "ace_spectator_virtual") exitWith
{
	fnf_spectatorSlotUsed = true;
	[_modules, _initModule, _miscOptionsModule] call FNF_ClientSide_fnc_initSpectatorSlot;
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
	_fortifyAfterSafeStart = (_miscOptionsModule getVariable ["fnf_fortifyAfterSafeStart", false]);

	if (not _fortifyAfterSafeStart) then
	{
		call FNF_ClientSide_fnc_disableFortify;
	};
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

//check if there are mobile Spawn Points
_mobileSpawnPoints = [_modules, "mobileSpawnPointHandeler"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _mobileSpawnPoints isNotEqualTo 0) then
{
	[_mobileSpawnPoints] call FNF_ClientSide_fnc_initMobileSpawnPoints;
};

//check if there are asset restrictions
_assetRestrictions = [_modules, "assetRestriction"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _assetRestrictions isNotEqualTo 0) then
{
	[_assetRestrictions] call FNF_ClientSide_fnc_initAssetRestrictions;
};

//check if there are personal Rearms
_personalRearms = [_modules, "personalRearm"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _personalRearms isNotEqualTo 0) then
{
	[_personalRearms] call FNF_ClientSide_fnc_initAssetRestrictions;
};

//start gps icons
call FNF_ClientSide_fnc_initGPSUnitMarkers;

//add zues options
call FNF_ClientSide_fnc_zuesAceOptions;

//start backpack locking system
call FNF_ClientSide_fnc_initBackpackLocking;

//start custom rearm init
call FNF_ClientSide_fnc_initVicRearmReplacement;

//if there are objectives start watching them
if (not isNil "fnf_objectives") then
{
	[{call FNF_ClientSide_fnc_watchObjs;}, 1] call CBA_fnc_addPerFrameHandler;
};

//Remove thermals from a vic/uav when a player controls said vic/uav
addMissionEventHandler ["PlayerViewChanged", {
	params ["_oldUnit", "_newUnit", "_vehicleIn", "_oldCameraOn", "_newCameraOn", "_uav"];
	if (not isNull _uav) then
	{
		if (not (equipmentDisabled _uav select 1)) then
		{
			_uav disableTIEquipment true;
		};
	};
	if (not isNull _vehicleIn) then
	{
		if (not (equipmentDisabled _vehicleIn select 1)) then
		{
			_vehicleIn disableTIEquipment true;
		};
	};
}];

//Start death event handelers and timers
[_initModule, _miscOptionsModule] call FNF_ClientSide_fnc_initDeath;

//handle JIP players
[_safeZoneModules, _miscOptionsModule] call FNF_ClientSide_fnc_handleJIP;
