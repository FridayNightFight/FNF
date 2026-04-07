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

if (fnf_debug) then { systemChat format ["[fnf_reinsert] Called - %1 unit(s) to pos %2", count _reinsertUnits, _reinsertPos]; };

_landingPos = _reinsertPos;

//get a safe direction to spawn helicopter
_playerSide = side _caller;

_enemyPlayers = allPlayers select {(not ([_playerSide, (side _x)] call BIS_fnc_sideIsFriendly)) and (alive _x)};

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

_enemyDir = _landingPos getDir _averageEnemyLocation;

_friendlyDir = 0;

if (_enemyDir >= 180) then
{
	_friendlyDir = _enemyDir - 180;
} else {
	_friendlyDir = _enemyDir + 180;
};
//====================================
//get safe position to spawn helicopter (in air)

_safeSpawnPos = _landingPos getPos [2000, _friendlyDir];
_landingPos = _safeSpawnPos getPos [2050, _enemyDir];

if (fnf_debug) then { systemChat format ["[fnf_reinsert] Spawning heli at %1 facing %2", _safeSpawnPos, _enemyDir]; };

_spawned = [_safeSpawnPos, _enemyDir, "RHS_MELB_MH6M", _playerSide] call BIS_fnc_spawnVehicle;
_spawned params ["_heli", "_crew", "_group"];

if (fnf_debug) then { systemChat format ["[fnf_reinsert] Heli spawned: %1", _heli]; };

{
	_x setBehaviour "CARELESS";
	_x allowFleeing 0;
	_x setUnitLoadout [[],[],[],["U_O_R_Gorka_01_black_F",[]],["UK3CB_V_Pilot_Vest_Black",[]],[],"rhsusf_hgu56p_visor_mask_Empire_black","G_Balaclava_TI_blk_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
} forEach _crew;

_cargoIndexOrder = [1, 2, 5, 6];
{
	_cargoIndex = _cargoIndexOrder select _forEachIndex;
	[{
		setPlayerRespawnTime -1;
		[{
			alive player
		}, {
			player setUnitLoadout [fnf_playerLoadout, false];
			[player, true] remoteExec ["hideObjectGlobal", 2];
			player allowDamage false;
			setPlayerRespawnTime 9999;
		}] call CBA_fnc_waitUntilAndExecute;

		[{
			not (isNull (objectParent player));
		}, {
			[false, false, false] call ace_spectator_fnc_setSpectator;
			player allowDamage true;
			[player, false] remoteExec ["hideObjectGlobal", 2];
			[{
				[true, true, true] call ace_spectator_fnc_setSpectator;
				[{
					[false, false, false] call ace_spectator_fnc_setSpectator;
				},[],1] call CBA_fnc_waitAndExecute;
			},[],1] call CBA_fnc_waitAndExecute;
		}] call CBA_fnc_waitUntilAndExecute;
	}] remoteExec ["call", (_x call BIS_fnc_getUnitByUID)];

	[{
		params ["_playerUID"];
		alive (_playerUID call BIS_fnc_getUnitByUID);
	}, {
		params ["_playerUID", "_heli", "_cargoIndex"];
		[(_playerUID call BIS_fnc_getUnitByUID), [_heli, _cargoIndex]] remoteExec ["moveInCargo", (_playerUID call BIS_fnc_getUnitByUID)];
	}, [_x, _heli, _cargoIndex]] call CBA_fnc_waitUntilAndExecute;
} forEach _reinsertUnits;

if (fnf_debug) then { systemChat format ["[fnf_reinsert] Heli moving to landing pos %1", _landingPos]; };
(driver _heli) doMove _landingPos;
(gunner _heli) doMove _landingPos;
_heli flyInHeight [20, true];

[_heli] call ace_fastroping_fnc_prepareFRIES;

[{
	params ["_heli", "_landingPos", "_reinsertUnits", "_safeSpawnPos"];
	_heliVelocity = velocity _heli;
	_horizontalVelocity = (abs(_heliVelocity select 0)) + (abs(_heliVelocity select 1));
	(_horizontalVelocity < 10) and ((_heli distance _landingPos) < 200);
},
{
	params ["_heli", "_landingPos", "_reinsertUnits", "_safeSpawnPos"];
	if (fnf_debug) then { systemChat format ["[fnf_reinsert] Heli arrived near LZ - height: %1", round ((getPos _heli) select 2)]; };

	_heliPos = getPos _heli;
	if ((alive _heli) and ((_heliPos select 2) > 5)) then
	{
		if (fnf_debug) then { systemChat "[fnf_reinsert] Beginning descent"; };
		_heli flyInHeight [9.99, true];
		[{
			params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
			((getPos _heli) select 2) < 43;
		}, {
			params ["_heli", "_reinsertUnits", "_safeSpawnPos"];

			_heliPos = getPos _heli;
			if ((alive _heli) and ((_heliPos select 2) > 5)) then
			{

				if (fnf_debug) then { systemChat "[fnf_reinsert] Below 43m - disabling AI move, wiggling down"; };
				(driver _heli) disableAI "MOVE";
				(gunner _heli) disableAI "MOVE";
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
					if (fnf_debug) then { systemChat format ["[fnf_reinsert] Below 32m - stopping, deploying ropes. Height: %1", round ((getPos _heli) select 2)]; };
					[_wiggleDownHandle] call CBA_fnc_removePerFrameHandler;

					_heli setVelocity [0,0,0];

					[_heli, ((_reinsertUnits select 0) call BIS_fnc_getUnitByUID), "ACE_rope36"] call ace_fastroping_fnc_deployRopes;

					[{
						params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
						if (fnf_debug) then { systemChat format ["[fnf_reinsert] Fast roping %1 unit(s)", count _reinsertUnits]; };
						// Fast rope each unit 1 second apart
						{
							private _unit = (_x call BIS_fnc_getUnitByUID);
							private _delay = _forEachIndex;
							[{
								params ["_unit", "_heli"];
								if (fnf_debug) then { systemChat format ["[fnf_reinsert] Fast roping unit: %1", _unit]; };
								[_unit, _heli] remoteExec ["ace_fastroping_fnc_fastRope", _unit];
							}, [_unit, _heli], _delay] call CBA_fnc_waitAndExecute;
						} forEach _reinsertUnits;
						// Cut ropes, fly back to spawn position and delete
						private _cutDelay = ((count _reinsertUnits) - 1) + 8;
						if (fnf_debug) then { systemChat format ["[fnf_reinsert] Cutting ropes in %1s", _cutDelay]; };
						[{
							params ["_heli", "_safeSpawnPos"];
							if (fnf_debug) then { systemChat "[fnf_reinsert] Cutting ropes, returning to spawn"; };
							[_heli] call ace_fastroping_fnc_cutRopes;
							[{
								params ["_heli", "_safeSpawnPos"];
								_heli flyInHeight [20, true];
								(driver _heli) enableAI "MOVE";
								(driver _heli) doMove _safeSpawnPos;
								(gunner _heli) enableAI "MOVE";
								(gunner _heli) doMove _safeSpawnPos;
							}, [_heli, _safeSpawnPos], 2] call CBA_fnc_waitAndExecute;
							[{
								params ["_heli", "_safeSpawnPos"];
								(_heli distance2D _safeSpawnPos) < 200;
							}, {
								params ["_heli"];
								if (fnf_debug) then { systemChat "[fnf_reinsert] Back at spawn - deleting heli and crew"; };
								{ deleteVehicle _x; } forEach (crew _heli);
								deleteVehicle _heli;
							}, [_heli, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
						}, [_heli, _safeSpawnPos], _cutDelay] call CBA_fnc_waitAndExecute;
					}, [_heli, _reinsertUnits, _safeSpawnPos], 5] call CBA_fnc_waitAndExecute;

				}, [_heli, _wiggleDownHandle, _reinsertUnits, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
			};
		}, [_heli, _reinsertUnits, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
	};
}, [_heli, _landingPos, _reinsertUnits, _safeSpawnPos]] call CBA_fnc_waitUntilAndExecute;
