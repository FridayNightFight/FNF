/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players in spectator slots

	Parameter(s):
		0: ARRAY -  Array of FNF modules

	Returns:
		None
*/

params["_modules", "_initModule"];

//init zones
call FNF_ClientSide_fnc_initZones;

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

//init breifing
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules, _kitInfoModules, _initModule] call FNF_ClientSide_fnc_initBreifing;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules isEqualTo 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No objectives present"
  };
} else {
  [_objModules] call FNF_ClientSide_fnc_initSpectatorObjectives;
};

//show Mission Details button
call FNF_ClientSide_fnc_missionDetailsButton;

//check if there is a playzone
_playZoneModules = [_modules, "playZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _playZoneModules isEqualTo 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No playzone present"
  };
} else {
  [_playZoneModules] call FNF_ClientSide_fnc_initSpectatorPlayZones;
};

//check there are safe zones
_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _safeZoneModules isEqualTo 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No safe zones present";
  };
} else {
  [_safeZoneModules] call FNF_ClientSide_fnc_initSpectatorSafeZones;
};

_selectorModules = [_modules, "selectorHost"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _selectorModules isNotEqualTo 0) then
{
  [_selectorModules] call FNF_ClientSide_fnc_initSelectors;
};

//check there are hiding zones and clean up spares
_hidingZoneModules = [_modules, "hidingZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _hidingZoneModules isNotEqualTo 0) then
{
  [_hidingZoneModules] call FNF_ClientSide_fnc_cleanUpSpareHidingZones;
};

//if there are objectives start watching them
if (not isNil "fnf_objectives") then
{
  if (count fnf_objectives isNotEqualTo 0) then
  {
    [{
      _indexesToDeleteIfCompleted = [];
      {
        switch (_x select 0) do {
          case "DESTROY":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchSpectatorDestroy;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "CAPTURESECTOR":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchSpectatorCaptureSector;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "TERMINAL":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchSpectatorTerminal;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "ASSASSIN":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchSpectatorAssassin;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "DESTROYDUPE": {};
          case "CAPTURESECTORDUPE": {};
          case "TERMINALDUPE": {};
          case "ASSASSINDUPE": {};
          default
          {
            if (fnf_debug) then
            {
              systemChat "DANGER: Objective has no valid type code, contact FNF staff";
            };
          };
        };
      } forEach fnf_objectives;
      {
        fnf_objectives deleteAt (_x - _forEachIndex);
      } forEach _indexesToDeleteIfCompleted;
    },1] call CBA_fnc_addPerFrameHandler;

    {
      //if OBJ is one without a physical object then move to next OBJ
      if (_x select 0 isEqualTo "CAPTURESECTOR" or _x select 0 isEqualTo "CAPTURESECTORDUPE" or _x select 0 isEqualTo "DESTROYDUPE" or _x select 0 isEqualTo "TERMINALDUPE" or _x select 0 isEqualTo "ASSASSINDUPE") then
      {
        continue;
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

      drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL _obj, 0.6, 0.6, 45];

    } , 0, _x] call CBA_fnc_addPerFrameHandler;

    } forEach fnf_objectives;
  };
};
