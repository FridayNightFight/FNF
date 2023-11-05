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

//show Mission Details button
call FNF_ClientSide_fnc_missionDetailsButton;

call BIS_fnc_showMissionStatus;

[{!isNil "fnf_objectives"}, {
  {
    //if OBJ is one without a physical object then move to next OBJ
    if (_x select 0 == "CAPTURESECTOR") then
    {
      continue;
    };

    if (_x select 0 == "DESTROY") then
    {
      _desc = taskDescription (_x select 3);
      _splitString = (_desc select 1) splitString " ";
      _objNumWithColon = _splitString select 0;
      _objNum = (_objNumWithColon splitString "") select 0;

      _marker = createMarkerLocal ["destroy_obj_marker_" + str(_objNum), getPos (_x select 2)];
      _marker setMarkerTypeLocal "mil_objective";
      _marker setMarkerText "Destroy " + _objNum;

      [{
        params["_marker", "_object"];
        not alive _object;
      }, {
        params["_marker", "_object"];
        deleteMarkerLocal _marker;
      }, [_marker, (_x select 2)]] call CBA_fnc_waitUntilAndExecute;
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
