/*
 * Author: tanaKa
 * Function used to handle random damage on vehicle destruction
 * for FNF
 *
 * Params: 
 * 0: vehicle <OBJECT>
 *
 * Return value:
 * N/A
 *
 * Usage: 
 * [vehicle] call PHX_fnc_handleDamage
 *
 * Public: no
 */
params ["_vehicle"];

{
	_kill = random [1,50,100];

	if (_kill > 69) then {
		_bodyPart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		_damage = 1; // full damage
		_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab", "unknown"];
		[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
		_x setDamage 1; // kill player
		systemChat format ["DEBUG: %1 damage added to %2 with a %3 value with _kill set to %4",_type,_bodypart,_damage,_kill];
	} else {
		_damage = selectRandom [0,0,0,0,0,0.2,0.3,0.4]; //small chance to be slightly injured in a limb
		if (_damage > 0) then {
			_bodyPart = selectRandom ["LeftArm", "RightArm", "LeftLeg", "RightLeg"];
			_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab", "unknown"];
			[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
			systemChat format ["DEBUG: %1 damage added to %2 with a %3 value with _kill set to %4",_type,_bodypart,_damage,_kill];
			uiSleep 2;
			waitUntil {(getPos _vehicle) select 2 isEqualTo 0 && speed _vehicle isEqualTo 0};
			moveOut _x;
		} else { 
			uiSleep 2;
			waitUntil {(getPos _vehicle) select 2 isEqualTo 0 && speed _vehicle isEqualTo 0};
			moveOut _x;
		};
	};
} forEach crew _vehicle;

