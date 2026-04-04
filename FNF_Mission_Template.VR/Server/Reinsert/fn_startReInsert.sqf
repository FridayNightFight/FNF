/*
	Author: Mallen and OrthyOliver

	Description:
		Spawns helicopter and sends it to fast rope players as a re-insert

	Parameter(s):
		0: OBJECT -		The player that called the Re-insert
		1: POSITION -	The landing position (ATL) sampled from the flare projectile
		2: ARRAY -		Array of up to 4 dead units to reinsert

	Returns:
		None
*/

params["_caller", "_reinsertPos", "_reinsertUnits"];

_landingPos = _reinsertPos;

// Prepare each dead unit: exit spectator, restore loadout, hide and disable
{
	_x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach _reinsertUnits;
{
	[{
		setPlayerRespawnTime -1;
		[false, false, false] call ace_spectator_fnc_setSpectator;
		player setUnitLoadout [fnf_playerLoadout, false];
		player allowDamage false;
		setPlayerRespawnTime 9999;
		// Fix spectator rendering bug: briefly re-enter then exit spectator
		[{
			[true, true, true] call ace_spectator_fnc_setSpectator;
			[{
				[false, false, false] call ace_spectator_fnc_setSpectator;
			}, [], 1] call CBA_fnc_waitAndExecute;
		}, [], 1] call CBA_fnc_waitAndExecute;
	}] remoteExec ["call", _x];
} forEach _reinsertUnits;

//get a safe direction to spawn helicopter
_playerSide = side _caller;

_enemyPlayers = allPlayers select {([_playerSide, (side _x)] call BIS_fnc_sideIsFriendly) and (alive _x)};

_totalX = 0;
_totalY = 0;

{
	_pos = getPosATL _x;
	_totalX = _totalX + (_pos select 0);
	_totalY = _totalY + (_pos select 1);
} forEach _enemyPlayers;

_averageEnemyLocation = [0,0,0];
if ((count _enemyPlayers) isNotEqualTo 0) then
{
	_averageEnemyLocation = [_totalX / (count _enemyPlayers), _totalY / (count _enemyPlayers), 0];
};

_enemyDir = _caller getDir _averageEnemyLocation;

_friendlyDir = 0;

if (_enemyDir >= 180) then
{
	_friendlyDir = _enemyDir - 180;
} else {
	_friendlyDir = _enemyDir + 180;
};
//====================================
//get safe position to spawn helicopter (in air)

_safeSpawnPos = _caller getRelPos [2000, _friendlyDir];

_spawned = [_safeSpawnPos, _enemyDir, "RHS_MELB_MH6M", _playerSide] call BIS_fnc_spawnVehicle;
_spawned params ["_heli", "_crew", "_group"];

{
	_x setBehaviour "CARELESS";
	_x allowFleeing 0;
	//_x setUnitLoadout [[[],[],[],["U_O_R_Gorka_01_black_F",[]],["UK3CB_V_Pilot_Vest_Black",[]],[],"rhsusf_hgu56p_visor_mask_Empire_black","G_Balaclava_TI_blk_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]]
} forEach _crew;

[{
	params ["_crew"];
	{
		_x setUnitLoadout [[],[],[],["U_O_R_Gorka_01_black_F",[]],["UK3CB_V_Pilot_Vest_Black",[]],[],"rhsusf_hgu56p_visor_mask_Empire_black","G_Balaclava_TI_blk_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	} forEach _crew;
},[_crew],1] call CBA_fnc_waitAndExecute;

// Move dead units into helicopter and re-enable them
{
	_x moveInCargo _heli;
	_x hideObjectGlobal false;
	_x enableSimulationGlobal true;
} forEach _reinsertUnits;
{
	[{ player allowDamage true; }] remoteExec ["call", _x];
} forEach _reinsertUnits;

(driver _heli) doMove _landingPos;

[_heli] call ace_fastroping_fnc_prepareFRIES;


[{
	params ["_heli", "_landingPos", "_reinsertUnits", "_safeSpawnPos"];
	_heliVelocity = velocity _heli;
	_horizontalVelocity = (abs(_heliVelocity select 0)) + (abs(_heliVelocity select 1));
	(_horizontalVelocity < 10) and ((_heli distance _landingPos) < 1950);
},
{
	params ["_heli", "_landingPos", "_reinsertUnits", "_safeSpawnPos"];
	_heliPos = getPos _heli;
	if ((alive _heli) and ((_heliPos select 2) > 5)) then
	{
		_heli flyInHeight [9.99, true];
		[{
			params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
			((getPos _heli) select 2) < 43;
		}, {
			params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
			(driver _heli) disableAI "MOVE";
			_wiggleDownHandle = [{
				(_this select 0) params ["_heli"];
				_velocity = velocity _heli;
				if ((_velocity select 2) > -1) then
				{
					_velocity set [2, -1];
					_heli setVelocity _velocity;
				}
			}, 0.1, [_heli]] call CBA_fnc_addPerFrameHandler;
			[{
				params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
				_heliPos = getPos _heli;
				_heliHeight = _heliPos select 2;
				_heliHeight < 32;
			}, {
				params ["_heli", "_wiggleDownHandle", "_reinsertUnits", "_safeSpawnPos"];
				[_wiggleDownHandle] call CBA_fnc_removePerFrameHandler;
				_heli setVelocity [0,0,0];

				[_heli, (_reinsertUnits select 0), "ACE_rope36"] call ace_fastroping_fnc_deployRopes;

				[{
					params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
					// Fast rope each unit 1 second apart
					{
						private _unit = _x;
						private _delay = _forEachIndex;
						[{
							params ["_unit", "_heli"];
							[_unit, _heli] remoteExec ["ace_fastroping_fnc_fastRope", _unit];
						}, [_unit, _heli], _delay] call CBA_fnc_waitAndExecute;
					} forEach _reinsertUnits;
					// Cut ropes, fly back to spawn position and delete
					[{
						params ["_heli", "_safeSpawnPos"];
						[_heli] call ace_fastroping_fnc_cutRopes;
						_heli flyInHeight [20, true];
						(driver _heli) enableAI "MOVE";
						(driver _heli) doMove _safeSpawnPos;
						[{
							params ["_heli", "_safeSpawnPos"];
							(_heli distance _safeSpawnPos) < 50;
						}, {
							params ["_heli"];
							{ deleteVehicle _x; } forEach (crew _heli);
							deleteVehicle _heli;
						}, [_heli, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
					}, [_heli, _safeSpawnPos], ((count _reinsertUnits) - 1) + 8] call CBA_fnc_waitAndExecute;
				}, [_heli, _reinsertUnits, _safeSpawnPos], 5] call CBA_fnc_waitAndExecute;

			}, [_heli, _wiggleDownHandle, _reinsertUnits, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
		}, [_heli, _reinsertUnits, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
	};
}, [_heli, _landingPos, _reinsertUnits, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
