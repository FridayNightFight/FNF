/*
	Author: Mallen

	Description:
		Respawns the player and puts them in limbo until admin TP's them

	Parameter(s):
		None

	Returns:
		None
*/

if (alive player) exitWith {};

//get all fnf modules
_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if there is a misc options module
_miscOptionsModule = [_modules, "miscOptions"] call FNF_ClientSide_fnc_findSpecificModules;
_miscOptionsModule = _miscOptionsModule select 0;

//reinsert, onelife, respawn
_deathMode = (_miscOptionsModule getVariable ["fnf_deathMode", "reinsert"]);

if (_deathMode isEqualTo "respawn") then
{
	//if player is already being handeled (denoted by respawn timer being -1) don't touch it
	_timeToRespawn = missionNamespace getVariable [("fnf_timeToRespawn_" + getPlayerUID player), 0];
	if (_timeToRespawn isEqualTo -1) exitWith {};

	//set time to respawn to -1 to inform other systems that respawn is being handeled
	missionNamespace setVariable [("fnf_timeToRespawn_" + getPlayerUID player), -1, true];
};

if (_deathMode isEqualTo "reinsert") then
{
	//if player is respawned remove him from the death queue
	_playerGroup = group player;
	_deathQueue = _playerGroup getVariable ["fnf_deathQueue", []];
	_deathQueue = _deathQueue - [(getplayerUID player)];
	_playerGroup setVariable ["fnf_deathQueue", _deathQueue, true];
};

setPlayerRespawnTime -1;

[false, false, false] call ace_spectator_fnc_setSpectator;
["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>You have been respawned, you are currently hidden and set to invincible until an admin teleports you to a safe location near to your death spot, please wait...</t>", "deep-purple", 10] call FNF_ClientSide_fnc_notificationSystem;

[{
	alive player
},{
	player setUnitLoadout [fnf_playerLoadout, false];
	[player, true] remoteExec ["hideObjectGlobal", 2];
	player allowDamage false;
	player enableSimulationGlobal false;
	setPlayerRespawnTime 99999;

	player setVariable ["tf_globalVolume", 1];
	player setVariable ["tf_voiceVolume", 1, true];

	_playerPos = getPos player;
	[{
		params["_playerPos"];
		getPos player isNotEqualTo _playerPos;
	},{
		player allowDamage true;
		[player, false] remoteExec ["hideObjectGlobal", 2];
		player enableSimulationGlobal true;
		["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>You have been teleported to a reletivly safe space, take in your surroundings and play on!</t>", "deep-purple"] call FNF_ClientSide_fnc_notificationSystem;
		[{
			[true, true, true] call ace_spectator_fnc_setSpectator;
			[{
				[false, false, false] call ace_spectator_fnc_setSpectator;
				call FNF_ClientSide_fnc_initRadios;
			},[],1] call CBA_fnc_waitAndExecute;
		},[],1] call CBA_fnc_waitAndExecute;
	},[_playerPos], 30, {
		player allowDamage true;
		[player, false] remoteExec ["hideObjectGlobal", 2];
		player enableSimulationGlobal true;
		["<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><t align='center'><br/><br/>No Admin has Teleported you in 30 seconds, take in your surroundings and play on!</t>", "deep-purple"] call FNF_ClientSide_fnc_notificationSystem;
		[{
			[true, true, true] call ace_spectator_fnc_setSpectator;
			[{
				[false, false, false] call ace_spectator_fnc_setSpectator;
			},[],1] call CBA_fnc_waitAndExecute;
		},[],1] call CBA_fnc_waitAndExecute;
	}] call CBA_fnc_waitUntilAndExecute
}] call CBA_fnc_waitUntilAndExecute;
