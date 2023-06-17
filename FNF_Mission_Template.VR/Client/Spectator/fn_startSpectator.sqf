/*
	Author: Mallen

	Description:
		Starts up spectator enviroment

	Parameter(s):
		None

	Returns:
		None
*/

[true, true, true] call ace_spectator_fnc_setSpectator;

_lastDamage = player getVariable ["ace_medical_lastDamageSource",objNull];

if (!isNull _lastDamage) then {
  [2, _lastDamage] call ace_spectator_fnc_setCameraAttributes;
} else {
  [2, player] call ace_spectator_fnc_setCameraAttributes;
};

("FNF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["spectatorSideNumbers", "PLAIN"];
