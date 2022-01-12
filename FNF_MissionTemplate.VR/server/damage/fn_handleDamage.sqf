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
 * [vehicle] spawn phx_server_fnc_handleDamage
 *
 * Public: no
 */
params ["_vehicle"];
if !(isServer) exitWith {};

{
	_kill = random 100;

	if (_kill > 69) then {
		_bodyPart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		_damage = 1; // full damage
		_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab"];
		diag_log format ["Vehicle DEBUG: %1 damage added to %2's %3 with a %4 value with _kill set to %5",_type,(name player),_bodypart,_damage,_kill];
		[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
		_x setDamage 1; // kill player
	} else {
		_damage = selectRandom [0,0,0,0,0,0.2,0.3,0.4]; //small chance to be slightly injured in a limb
		if (_damage > 0) then {
			_bodyPart = selectRandom ["LeftArm", "RightArm", "LeftLeg", "RightLeg"];
			_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab"];
			diag_log format ["Vehicle DEBUG: %1 damage added to %2's %3 with a %4 value with _kill set to %5",_type,(name player),_bodypart,_damage,_kill];
			[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
		};

		uiSleep 1;
		[{abs (speed _this) < 1}, {
		  {moveOut _x} forEach (crew _this);
		}, _vehicle, 20] call CBA_fnc_waitUntilAndExecute;
	};
} forEach crew _vehicle;

