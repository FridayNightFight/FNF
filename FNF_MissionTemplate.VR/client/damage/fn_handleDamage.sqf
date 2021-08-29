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
	_kill = selectRandom [1,100];

	if (_kill > 69) then {
		_bodyPart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		_damage = selectRandom [0.7,0.75,0.8,0.85,0.9,1,1,1,1]; //small chance to survive
		_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab", "unknown"];
		[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
	} else {
		_damage = selectRandom [0,0,0,0,0,0,0,0,0.1,0.2,0.3]; //small chance to be slightly injured in a limb
		if (_damage > 0) then {
			_bodyPart = selectRandom ["LeftArm", "RightArm", "LeftLeg", "RightLeg"];
			_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab", "unknown"];
			[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
			moveOut _x;
		} else { 
			moveOut _x;
		};
	};
} forEach crew _vehicle;

