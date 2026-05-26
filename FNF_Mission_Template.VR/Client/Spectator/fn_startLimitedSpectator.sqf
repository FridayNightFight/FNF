/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players who have died but can still be reinserted

	Parameter(s):
		None

	Returns:
		None
*/

[true, true, true] call ace_spectator_fnc_setSpectator;

//get all fnf modules
_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if there is a misc options module
_miscOptionsModule = [_modules, "miscOptions"] call FNF_ClientSide_fnc_findSpecificModules;
_miscOptionsModule = _miscOptionsModule select 0;

//reinsert, respawn
_deathMode = (_miscOptionsModule getVariable ["fnf_deathMode", "reinsert"]);
//full, side, squad
_limitedSpectatorUnits = (_miscOptionsModule getVariable ["fnf_limitedSpectatorUnits", "side"]);

_limitedSpectatorMuteTFAR = (_miscOptionsModule getVariable ["fnf_limitedSpectatorMuteTFAR", false]);

if (_limitedSpectatorUnits isEqualTo "squad") then
{
	if (not (isNil "fnf_restrictToSquad")) then
	{
		[fnf_restrictToSquad] call CBA_fnc_removePerFrameHandler;
	};
};

switch (_limitedSpectatorUnits) do {
	case "full": {
		[[west, east, independent, civilian], []] call ace_spectator_fnc_updateSides;
		[[], [player]] call ace_spectator_fnc_updateUnits;
		[[0,1,2], []] call ace_spectator_fnc_updateCameraModes;
	};
	case "side": {
		[[playerSide], ([west, east, independent, civilian] - [playerSide])] call ace_spectator_fnc_updateSides;
		[[], [player]] call ace_spectator_fnc_updateUnits;
		[[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
	};
	case "squad": {
		[[playerSide], ([west, east, independent, civilian] - [playerSide])] call ace_spectator_fnc_updateSides;

		fnf_restrictToSquad = [{
			_allPlayerBarSquad = (allPlayers - (units (group player)));
			[[], [_allPlayerBarSquad]] call ace_spectator_fnc_updateUnits;
		}, 0.5] call CBA_fnc_addPerFrameHandler;

		[[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
	};
	default { };
};

if (_limitedSpectatorMuteTFAR) then
{
	player setVariable ["tf_globalVolume", 0];
	player setVariable ["tf_voiceVolume", 0, true];
};

true call FNF_ClientSide_fnc_showTimerInHUD;

//setup map shading
[{!isNull findDisplay 60000},{
findDisplay 60000 displayCtrl 60014 ctrlAddEventHandler ["Draw",
{
	_map = _this select 0;
	{
		_rgbaValues = _y select 1;
		{
			_pos1 = _x select 0;
			_pos2 = _x select 1;
			_pos3 = _x select 2;
			_map drawTriangle [[_pos1, _pos2, _pos3], _rgbaValues, "#(rgb,1,1,1)color(1,1,1,1)"];
		} forEach (_y select 0);
	} forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

call BIS_fnc_showMissionStatus;

if (_deathMode isEqualTo "reinsert") then
{
	//check if init module is found
	_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
	_initModule = _initModule select 0;

	_disableWindow = (_initModule getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);

	//check if player is reinserted or reinsert window runs out
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
		_reinsertRequested = group player getVariable ["fnf_reinsertRequested", false];

		_result or _reinsertRequested;
	},{
		params["_disableWindow"];

		_reinsertedPlayers = group player getVariable ["fnf_reinsertedPlayers", []];
		_reinsertRequested = group player getVariable ["fnf_reinsertRequested", false];

		if (_reinsertRequested) then
		{
			if (not ((getplayerUID player) in _reinsertedPlayers)) then
			{
				call FNF_ClientSide_fnc_upgradeSpectator;
				["<t align='center' size='1.5'>REINSERT UNAVAILABLE</t><t align='center'><br/><br/>Reinsert has been called for the squad, but 4 other squadmates died before you so you did not make the cut </t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;
			};
		} else {
			call FNF_ClientSide_fnc_upgradeSpectator;
		};

	}, [_disableWindow]] call CBA_fnc_waitUntilAndExecute;
};

if (_deathMode isEqualTo "respawn") then
{
	//get time to respawn
	_timeToRespawn = missionNamespace getVariable [("fnf_timeToRespawn_" + getPlayerUID player), -1];

	_respawnModules = [_modules, "respawnPosition"] call FNF_ClientSide_fnc_findSpecificModules;

	_respawnPosition = (getPos player);
	{
		_respawnSide = _x getVariable ["fnf_respawnSide", sideUnknown];
		if (_respawnSide isEqualTo playerSide) then
		{
			_respawnPosition = (getPos _x);
			break;
		};
	} forEach _respawnModules;


	//wait until respawn timer is up
	[{
		params["_timeToRespawn"];
		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > _timeToRespawn;
		} else {
			_result = (serverTime - _timeServerStarted) > _timeToRespawn;
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
		};
		_result;
	},{
		params["_timeToRespawn", "_respawnPosition"];
		//if player is already being handeled (denoted by respawn timer being -1) don't touch it
		_timeToRespawn = missionNamespace getVariable [("fnf_timeToRespawn_" + getPlayerUID player), 0];
		if (_timeToRespawn isEqualTo -1) exitWith {};

		//set time to respawn to -1 to inform other systems that respawn is being handeled
		missionNamespace setVariable [("fnf_timeToRespawn_" + getPlayerUID player), -1, true];

		setPlayerRespawnTime -1;

		[false, false, false] call ace_spectator_fnc_setSpectator;
		[{
			alive player
		},{
			params["_respawnPosition"];

			player setUnitLoadout [fnf_playerLoadout, false];
			[player, true] remoteExec ["hideObjectGlobal", 2];
			player allowDamage false;
			player enableSimulationGlobal false;
			setPlayerRespawnTime 99999;

			player setVariable ["tf_globalVolume", 1];
			player setVariable ["tf_voiceVolume", 1, true];

			player setPos _respawnPosition;

			player allowDamage true;
			[player, false] remoteExec ["hideObjectGlobal", 2];
			player enableSimulationGlobal true;
			[{
				[true, true, true] call ace_spectator_fnc_setSpectator;
				[{
					[false, false, false] call ace_spectator_fnc_setSpectator;
					call FNF_ClientSide_fnc_initRadios;
				},[],1] call CBA_fnc_waitAndExecute;
			},[],1] call CBA_fnc_waitAndExecute;
		}, [_respawnPosition]] call CBA_fnc_waitUntilAndExecute;
	}, [_timeToRespawn, _respawnPosition]] call CBA_fnc_waitUntilAndExecute;
};
