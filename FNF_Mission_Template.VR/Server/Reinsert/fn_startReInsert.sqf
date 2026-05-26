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

params["_caller", "_landingPos", "_reinsertUnits"];

//get a safe direction to spawn helicopter
_playerSide = side _caller;

//get all enemy players
_enemyPlayers = allPlayers select {(not ([_playerSide, (side _x)] call BIS_fnc_sideIsFriendly)) and (alive _x)};

//get average enemy player position
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

//get the direction to the enemy position from landing pos
_enemyDir = _landingPos getDir _averageEnemyLocation;

//get friendly direction by rotating 180
_friendlyDir = 0;
if (_enemyDir >= 180) then
{
	_friendlyDir = _enemyDir - 180;
} else {
	_friendlyDir = _enemyDir + 180;
};

//get safe position to spawn helicopter
_safeSpawnPos = _landingPos getPos [2000, _friendlyDir];

//place landing pos 50m past flare point to account for AI bullshittery
_landingPos = _safeSpawnPos getPos [2050, _enemyDir];

//spawn heli
_spawned = [_safeSpawnPos, _enemyDir, "RHS_MELB_MH6M", _playerSide] call BIS_fnc_spawnVehicle;
_spawned params ["_heli", "_crew", "_group"];

//set crew to be as dumb as possible and set loadout
{
	_x setBehaviour "CARELESS";
	_x allowFleeing 0;
	_x setUnitLoadout [[],[],[],["U_O_R_Gorka_01_black_F",[]],["UK3CB_V_Pilot_Vest_Black",[]],[],"rhsusf_hgu56p_visor_mask_Empire_black","G_Balaclava_TI_blk_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
} forEach _crew;

//pick heli texture
_heliTexture = "fnf_reSkins\rih_blu_co.paa";
switch (_playerSide) do {
	case east: { _heliTexture = "fnf_reSkins\rih_opf_co.paa"; };
	case independent: { _heliTexture = "fnf_reSkins\rih_ind_co.paa"; };
	default { };
};

//remove items from Heli cargo
clearItemCargoGlobal _heli;

//put texture on heli
_heli setObjectTextureGlobal [0, _heliTexture];

//used to determine what seats reinserts are assigned
_cargoIndexOrder = [1, 2, 5, 6];

{
	//get current cargo index
	_cargoIndex = _cargoIndexOrder select _forEachIndex;

	[{
		//immediately respawn player
		setPlayerRespawnTime -1;

		//wait until he is alive
		[{
			alive player
		}, {
			//get the barebones loadout from kit module
			_modules = call FNF_ClientSide_fnc_findFNFModules;
			_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;

			_kitInfoModule = _kitInfoModules select 0;

			{
				_module = _x;
				_syncedObjects = synchronizedObjects _x;
				_modSide = sideEmpty;
				{
					_objectType = typeOf _x;
					_modSide = sideEmpty;

					switch (_objectType) do
					{
						case "SideBLUFOR_F":
						{
							_modSide = west;
						};
						case "SideOPFOR_F":
						{
							_modSide = east;
						};
						case "SideResistance_F":
						{
							_modSide = independent;
						};
						default
						{
							continue;
						};
					};

					if (_modSide isEqualTo playerSide) then
					{
						_kitInfoModule = _module;
					};
				} forEach _syncedObjects;
			} forEach _kitInfoModules;

			_bareBonesLoadout = _kitInfoModule getVariable ["fnf_bareBonesLoadout", str(fnf_playerLoadout)];

			//ensure he can talk
			player setVariable ["tf_globalVolume", 1];
			player setVariable ["tf_voiceVolume", 1, true];

			//reset loadout, make him invisible and invincible and disable respawn again
			player setUnitLoadout ((parseSimpleArray _bareBonesLoadout) select 0);
			[player, true] remoteExec ["hideObjectGlobal", 2];
			player allowDamage false;
			setPlayerRespawnTime 99999;
		}] call CBA_fnc_waitUntilAndExecute;

		//wait until player is inside the helicopter
		[{
			not (isNull (objectParent player));
		}, {
			//disable spectator, allow damage, make visible
			[false, false, false] call ace_spectator_fnc_setSpectator;
			player allowDamage true;
			[player, false] remoteExec ["hideObjectGlobal", 2];

			//do the spectator shuffle to prevent invincibility
			[{
				[true, true, true] call ace_spectator_fnc_setSpectator;
				[{
					[false, false, false] call ace_spectator_fnc_setSpectator;
					call FNF_ClientSide_fnc_initRadios;
				},[],1] call CBA_fnc_waitAndExecute;
			},[],1] call CBA_fnc_waitAndExecute;
		}] call CBA_fnc_waitUntilAndExecute;
	}] remoteExec ["call", (_x call BIS_fnc_getUnitByUID)];

	//wait until player is alive
	[{
		params ["_playerUID"];
		alive (_playerUID call BIS_fnc_getUnitByUID);
	}, {
		params ["_playerUID", "_heli", "_cargoIndex"];

		//put player in the heli
		[(_playerUID call BIS_fnc_getUnitByUID), [_heli, _cargoIndex]] remoteExec ["moveInCargo", (_playerUID call BIS_fnc_getUnitByUID)];
	}, [_x, _heli, _cargoIndex]] call CBA_fnc_waitUntilAndExecute;
} forEach _reinsertUnits;

//tell AI to fly to landing position as low as possible with object avoidance
(driver _heli) doMove _landingPos;
(gunner _heli) doMove _landingPos;
_heli flyInHeight [20, true];

//prep fastroping
[_heli] call ace_fastroping_fnc_prepareFRIES;

//wait until heli has slowed significantly within 200m of landing position
[{
	params ["_heli", "_landingPos", "_reinsertUnits", "_safeSpawnPos"];
	_heliVelocity = velocity _heli;
	_horizontalVelocity = (abs(_heliVelocity select 0)) + (abs(_heliVelocity select 1));
	(_horizontalVelocity < 10) and ((_heli distance2D _landingPos) < 200);
},
{
	params ["_heli", "_landingPos", "_reinsertUnits", "_safeSpawnPos"];

	_heliPos = getPos _heli;

	//check heli is alive and not landed (means it has been shot down)
	if ((alive _heli) and ((_heliPos select 2) > 5)) then
	{
		//tell heli to descend while ignoring obstacle avoidance
		_heli flyInHeight [9.99, true];

		//wait until helis height is less than 43m
		[{
			params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
			((getPos _heli) select 2) < 43;
		}, {
			params ["_heli", "_reinsertUnits", "_safeSpawnPos"];

			_heliPos = getPos _heli;

			//check heli is alive and not landed (means it has been shot down)
			if ((alive _heli) and ((_heliPos select 2) > 5)) then
			{

				//disable AI move behaviour which forces heli into an autohover at current altitude
				(driver _heli) disableAI "MOVE";
				(gunner _heli) disableAI "MOVE";

				//start wiggledown manuver to continualy move heli down if it isn't already until required altitude is reached
				_wiggleDownHandle = [{
					(_this select 0) params ["_heli"];
					_velocity = velocity _heli;
					if ((_velocity select 2) > -1) then
					{
						_velocity set [2, -1];
						_heli setVelocity _velocity;
					}
				}, 0.1, [_heli]] call CBA_fnc_addPerFrameHandler;

				//wait until heli altitude is below 32m
				[{
					params ["_heli", "_reinsertUnits", "_safeSpawnPos"];
					_heliPos = getPos _heli;
					_heliHeight = _heliPos select 2;
					_heliHeight < 32;
				}, {
					params ["_heli", "_wiggleDownHandle", "_reinsertUnits", "_safeSpawnPos"];

					//stop wiggling down
					[_wiggleDownHandle] call CBA_fnc_removePerFrameHandler;

					//stop all heli velocity
					_heli setVelocity [0,0,0];

					//deploy ropes for fast roping
					[_heli, ((_reinsertUnits select 0) call BIS_fnc_getUnitByUID), "ACE_rope36"] call ace_fastroping_fnc_deployRopes;

					//wait 5 seconds to allow ropes to fully drop
					[{
						params ["_heli", "_reinsertUnits", "_safeSpawnPos"];

						// Fast rope each unit 1 second apart
						{
							private _unit = (_x call BIS_fnc_getUnitByUID);
							private _delay = _forEachIndex;
							[{
								params ["_unit", "_heli"];
								[_unit, _heli] remoteExec ["ace_fastroping_fnc_fastRope", _unit];
							}, [_unit, _heli], _delay] call CBA_fnc_waitAndExecute;
						} forEach _reinsertUnits;

						// Cut ropes 8 seconds after last fastroped unit
						private _cutDelay = ((count _reinsertUnits) - 1) + 8;
						[{
							params ["_heli", "_safeSpawnPos"];

							//cut the ropes
							[_heli] call ace_fastroping_fnc_cutRopes;

							//wait 2 seconds for ropes to clear the heli and it doesn't hit them
							[{
								params ["_heli", "_safeSpawnPos"];

								//set heli to move to spawn position
								_heli flyInHeight [20, true];
								(driver _heli) enableAI "MOVE";
								(driver _heli) doMove _safeSpawnPos;
								(gunner _heli) enableAI "MOVE";
								(gunner _heli) doMove _safeSpawnPos;
							}, [_heli, _safeSpawnPos], 2] call CBA_fnc_waitAndExecute;

							//wait until heli is within 200m of spawn position
							[{
								params ["_heli", "_safeSpawnPos"];
								(_heli distance2D _safeSpawnPos) < 200;
							}, {
								params ["_heli"];

								//delete heli crew and the heli
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
