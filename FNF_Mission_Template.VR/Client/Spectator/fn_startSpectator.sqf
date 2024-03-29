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

true call FNF_ClientSide_fnc_showTimerInHUD;

//setup map shading
[{!isNull findDisplay 60000},{
findDisplay 60000 displayCtrl 60014 ctrlAddEventHandler ["Draw",
{
  _map = _this select 0;
  {
    _rgbaValues = _x select 2;
    {
      _pos1 = _x select 0;
      _pos2 = _x select 1;
      _pos3 = _x select 2;
	    _map drawTriangle [[_pos1, _pos2, _pos3], _rgbaValues, "#(rgb,1,1,1)color(1,1,1,1)"];
    } forEach (_x select 1);
  } forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

//show Mission Details button
call FNF_ClientSide_fnc_missionDetailsButton;

call BIS_fnc_showMissionStatus;

[{!isNil "fnf_objectives"}, {
  {
    //if OBJ is one without a physical object then move to next OBJ
    if (_x select 0 isEqualTo "CAPTURESECTOR") then
    {
      continue;
    };

    if (_x select 0 isEqualTo "DESTROY") then
    {
      _desc = taskDescription (_x select 3);
      _splitString = (_desc select 1) splitString " ";
      _objNumWithColon = _splitString select 0;
      _objNum = _objNumWithColon trim [":", 2];

      _marker = createMarkerLocal ["destroy_obj_marker_" + str(_objNum), (_x select 2)];
      _marker setMarkerTypeLocal "mil_objective";
      _marker setMarkerTextLocal "Destroy " + _objNum;

      [{
        params["_marker", "_object"];
        _marker setMarkerPosLocal _object;
        not alive _object or not ace_spectator_isset;
      }, {
        params["_marker", "_object"];
        deleteMarkerLocal _marker;
      }, [_marker, (_x select 2)]] call CBA_fnc_waitUntilAndExecute;
    };

    if (_x select 0 isEqualTo "ASSASSIN") then
    {
      _desc = taskDescription (_x select 3);
      _splitString = (_desc select 1) splitString " ";
      _objNumWithColon = _splitString select 0;
      _objNum = _objNumWithColon trim [":", 2];

      _marker = createMarkerLocal ["assassin_obj_marker_" + str(_objNum), (_x select 1)];
      _marker setMarkerTypeLocal "mil_objective";
      _marker setMarkerTextLocal "Assassin " + _objNum;

      [{
        params["_marker", "_object"];
        _objComplete = _object getVariable ["fnf_objComplete", false];

        _syncedObjects = synchronizedObjects _object;

        {
          if (isPlayer _x) then
          {
            _object = _x;
          };
        } forEach _syncedObjects;

        _marker setMarkerPosLocal _object;

        _objComplete or not ace_spectator_isset;
      }, {
        params["_marker", "_object"];
        deleteMarkerLocal _marker;
      }, [_marker, (_x select 1)]] call CBA_fnc_waitUntilAndExecute;
    };

    [{
      params ["_objectiveEntry"];

      _obj = (_objectiveEntry select 2);

      if (_objectiveEntry select 0 isEqualTo "ASSASSIN") then
      {
        _syncedObjects = synchronizedObjects (_objectiveEntry select 1);
        _obj = objNull;
        {
          if (isPlayer _x) then
          {
            _obj = _x;
          };
        } forEach _syncedObjects;

        _objComplete = (_objectiveEntry select 1) getVariable ["fnf_objComplete", false];
        if (_objComplete) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;
        };
      } else {
        if (isNull _obj) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;
        };

        if (!alive _obj) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;
        };
      };

      if (!ace_spectator_isSet) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
      };

      drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _obj, 0.6, 0.6, 45];

    } , 0, _x] call CBA_fnc_addPerFrameHandler;

  } forEach fnf_objectives;

}, [], 60] call CBA_fnc_waitUntilAndExecute;
