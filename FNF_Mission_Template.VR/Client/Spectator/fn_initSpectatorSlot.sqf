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

//init breifing
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules, _kitInfoModules, _initModule] call FNF_ClientSide_fnc_initBreifing;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules == 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No objectives present"
  };
} else {
  [_objModules] call FNF_ClientSide_fnc_initSpectatorObjectives;
};

//check if there is a playzone
_playZoneModules = [_modules, "playZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _playZoneModules == 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No playzone present"
  };
} else {
  [_playZoneModules] call FNF_ClientSide_fnc_initSpectatorPlayZones;
};

//check there are safe zones
_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _safeZoneModules == 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No safe zones present";
  };
} else {
  [_safeZoneModules] call FNF_ClientSide_fnc_initSpectatorSafeZones;
};

//check there are hiding zones and clean up spares
_hidingZoneModules = [_modules, "hidingZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _hidingZoneModules != 0) then
{
  [_hidingZoneModules] call FNF_ClientSide_fnc_cleanUpSpareHidingZones;
};

//if there are objectives start watching them
if (not isNil "fnf_objectives") then
{
  if (count fnf_objectives != 0) then
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
  };
};
