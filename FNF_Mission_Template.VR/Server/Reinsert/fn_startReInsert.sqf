/*
	Author: Mallen

	Description:
		Spawns helicopter and sends it to fast rope players as a re-insert

	Parameter(s):
		0: OBJECT -	The player that called the Re-insert

	Returns:
		None
*/

params["_caller"];

_landingPos = getPos _caller;

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
		_x setUnitLoadout [[[],[],[],["U_O_R_Gorka_01_black_F",[]],["UK3CB_V_Pilot_Vest_Black",[]],[],"rhsusf_hgu56p_visor_mask_Empire_black","G_Balaclava_TI_blk_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]]
	} forEach _crew;
},[_crew],1] call CBA_fnc_waitAndExecute;

//teleport players into vic

(driver _heli) doMove _landingPos;

[_heli] call ace_fastroping_fnc_prepareFRIES;


[{
	params ["_heli", "_landingPos"];
	_heliVelocity = velocity _heli;
	_horizontalVelocity = (abs(_heliVelocity select 0)) + (abs(_heliVelocity select 1));
	systemChat str(_horizontalVelocity);
	(_horizontalVelocity < 10) and ((_heli distance _landingPos) < 1950);
},
{
	params ["_heli"];
	_heliPos = getPos _heli;
	if ((alive _heli) and ((_heliPos select 2) > 5)) then
	{
		_heli flyInHeight [9.99, true];
		[{
			params ["_heli"];
			((getPos _heli) select 2) < 43;
		}, {
			params ["_heli"];
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
				params ["_heli"];
				_heliPos = getPos _heli;
				_heliHeight = _heliPos select 2;
				_heliHeight < 32;
			}, {
				params ["_heli", "_wiggleDownHandle"];
				[_wiggleDownHandle] call CBA_fnc_removePerFrameHandler;
				_heli setVelocity [0,0,0];

				[_heli, player, "ACE_rope36"] call ace_fastroping_fnc_deployRopes;

				[{
					params ["_heli"];
					[player, _heli] call ace_fastroping_fnc_fastRope;
					[{
						params ["_heli"];
						[_heli] call ace_fastroping_fnc_cutRopes;
						_heli flyInHeight [20, true];
						(driver _heli) enableAI "MOVE";
						(driver _heli) doMove [0,0,0];
					}, [_heli], 8] call CBA_fnc_waitAndExecute;
				}, [_heli], 5] call CBA_fnc_waitAndExecute;

			}, [_heli, _wiggleDownHandle]] call CBA_fnc_waitUntilAndExecute;
		}, [_heli]] call CBA_fnc_waitUntilAndExecute;
	};
}, [_heli, _landingPos]] call CBA_fnc_waitUntilAndExecute;
