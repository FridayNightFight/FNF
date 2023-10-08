/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players who have died

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

call BIS_fnc_showMissionStatus;

[{!isNil "fnf_objectives"}, {
  {
    //if OBJ is one without a physical object then move to next OBJ
    if (_x select 0 == "CAPTURESECTOR") then
    {
      continue;
    };

    [{
      params ["_objectiveEntry"];

      _obj = (_objectiveEntry select 2);

      if (isNull _obj) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
      };

      if (!alive _obj or !ace_spectator_isSet) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
      };

      drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _obj, 0.6, 0.6, 45];

    } , 0, _x] call CBA_fnc_addPerFrameHandler;

  } forEach fnf_objectives;

}, [], 60] call CBA_fnc_waitUntilAndExecute;
