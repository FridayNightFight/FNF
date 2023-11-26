if (isDedicated) exitWith {};

_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _initModule isEqualTo 0) exitWith {systemChat "DANGER: No FNF Init found, exiting mission prep"};
if (count _initModule > 1) exitWith {systemChat "DANGER: Multiple FNF Init found, exiting mission prep"};
_initModule = _initModule select 0;
fnf_debug = _initModule getVariable ["fnf_debug", true];

//restrict players vanilla actions
[_initModule] call FNF_ClientSide_fnc_restrictPlayer;

//get player loadout and store for future use
fnf_playerLoadout = getUnitLoadout player;

//mark custom things
call FNF_ClientSide_fnc_markEditorPlacedObjects;

//if player is in a spectator slot get them out of here
if (typeOf player isEqualTo "ace_spectator_virtual") exitWith
{
  [_modules, _initModule] call FNF_ClientSide_fnc_initSpectatorSlot;
};

//setup player radio stereo settings
call FNF_ClientSide_fnc_initRadios;

//init zones
call FNF_ClientSide_fnc_initZones;

//init Overall Timer
[_initModule] call FNF_ClientSide_fnc_initOverallTimer;

//init ORBAT
call FNF_ClientSide_fnc_initOrbat;

//init breifing
_kitInfoModules = [_modules, "kitInformation"] call FNF_ClientSide_fnc_findSpecificModules;
_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules, _kitInfoModules, _initModule] call FNF_ClientSide_fnc_initBreifing;

//check how often player has played and do new player experience
call FNF_ClientSide_fnc_initNewPlayerExperience;

//setup fortify options
[_initModule] call FNF_ClientSide_fnc_initFortify;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules isEqualTo 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No objectives present"
  };
} else {
  call FNF_ClientSide_fnc_initTaskControl;
  [_objModules] call FNF_ClientSide_fnc_initObjs;
};

//check if there is a playzone
_playZoneModules = [_modules, "playZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _playZoneModules isEqualTo 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No playzone present"
  };
} else {
  [_playZoneModules] call FNF_ClientSide_fnc_initPlayZones;
};

//check there are safe zones
_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _safeZoneModules isEqualTo 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No safe zones present";
  };
  call FNF_ClientSide_fnc_disableFortify;
} else {
  [_safeZoneModules] call FNF_ClientSide_fnc_initSafeZones;
};

//check there are teleport poles
_teleportModules = [_modules, "teleportPoles"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _teleportModules != 0) then
{
  [_teleportModules] call FNF_ClientSide_fnc_initTeleportPoles;
};

//check there are selectors
_selectorModules = [_modules, "selectorHost"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _selectorModules != 0) then
{
  [_selectorModules] call FNF_ClientSide_fnc_initSelectors;
};

//check there are hiding zones and clean up spares
_hidingZoneModules = [_modules, "hidingZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _hidingZoneModules != 0) then
{
  [_hidingZoneModules] call FNF_ClientSide_fnc_cleanUpSpareHidingZones;
};

//check if player is on the early server, if they are give them a GPS
if (serverName isEqualTo "Friday Night Fight #Early | www.fridaynightfight.org") then
{
  player linkItem "itemGPS";
  [] call FNF_ClientSide_fnc_initGPSUnitMarkers;
};

//add zues ace options
[] call FNF_ClientSide_fnc_zuesAceOptions;

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
            _result = [_x] call FNF_ClientSide_fnc_watchDestroy;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "CAPTURESECTOR":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchCaptureSector;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "TERMINAL":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchTerminal;
            if (_result) then
            {
              _indexesToDeleteIfCompleted pushBack _forEachIndex;
            };
          };
          case "ASSASSIN":
          {
            _result = [_x] call FNF_ClientSide_fnc_watchAssassin;
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

//handle if a player dies, put them into spectator
player addEventHandler ["Killed", {
  [{call FNF_ClientSide_fnc_startSpectator;}, [], 3] call CBA_fnc_waitAndExecute;
}];

//handle if some one JIP and theres safezones whether they have expired
if (count _safeZoneModules != 0 and didJIP) then
{
  if (missionNamespace getVariable ["fnf_startTime", 0] != 0) then
  {
    _result = [_safeZoneModules] call FNF_ClientSide_fnc_anyNonExpiredSafeZones;
    if (not _result) then
    {
      player setDamage 1;
    };
  } else {
    [{
      _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
      _timeServerStarted != 0;
    },{
      params["_safeZoneModules"];
      _result = [_safeZoneModules] call FNF_ClientSide_fnc_anyNonExpiredSafeZones;
      if (not _result) then
      {
        player setDamage 1;
      };
    }, [_safeZoneModules]] call CBA_fnc_waitUntilAndExecute;
  };
};
