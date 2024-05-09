if (isDedicated) exitWith {};

if (not isNil "fnf_playerLoadout") exitWith {};

//get player loadout and store for future use
fnf_playerLoadout = getUnitLoadout player;

_lives = profileNamespace getVariable ["fnf_missionToTrack", "NONAME"];
if (_lives isNotEqualTo missionName) then
{
  profileNamespace setVariable ["fnf_livesLeft", 2, false];
};

_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _initModule isEqualTo 0) exitWith {systemChat "DANGER: No FNF Init found, exiting mission prep"};
if (count _initModule > 1) exitWith {systemChat "DANGER: Multiple FNF Init found, exiting mission prep"};
_initModule = _initModule select 0;
fnf_debug = _initModule getVariable ["fnf_debug", true];

//restrict players vanilla actions
[_initModule] call FNF_ClientSide_fnc_restrictPlayer;

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
if (count _teleportModules isNotEqualTo 0) then
{
  [_teleportModules] call FNF_ClientSide_fnc_initTeleportPoles;
};

//check there are selectors
_selectorModules = [_modules, "selectorHost"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _selectorModules isNotEqualTo 0) then
{
  [_selectorModules] call FNF_ClientSide_fnc_initSelectors;
};

//start gps icons
call FNF_ClientSide_fnc_initGPSUnitMarkers;

//add zues ace options
[] call FNF_ClientSide_fnc_zuesAceOptions;

//if there are objectives start watching them
if (not isNil "fnf_objectives") then
{
  [{
    _indexesToDeleteIfCompleted = [];
    {
      switch (_x select 0) do {
        case "COMPLETED": {};
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
      fnf_objectives select _x set [0, "COMPLETED"];
    } forEach _indexesToDeleteIfCompleted;
  },1] call CBA_fnc_addPerFrameHandler;
};

//handle if a player dies, put them into spectator
player addEventHandler ["Killed", {
  _playerLives = profileNamespace getVariable ["fnf_livesLeft", 0];
  if (_playerLives isEqualTo 0) then
  {
    setPlayerRespawnTime 0;
    [{call FNF_ClientSide_fnc_startSpectator;}, [], 0.1] call CBA_fnc_waitAndExecute;
  } else {
    profileNamespace setVariable ["fnf_livesLeft", (_playerLives - 1)];
  };
}];

//handle if some one JIP and theres safezones whether they have expired
if (count _safeZoneModules isNotEqualTo 0 and didJIP) then
{
  if (missionNamespace getVariable ["fnf_startTime", 0] isNotEqualTo 0) then
  {
    _result = [_safeZoneModules] call FNF_ClientSide_fnc_anyNonExpiredSafeZones;
    if (not _result) then
    {
      [true, true, true] call ace_spectator_fnc_setSpectator;
      player setDamage 1;
    };
  } else {
    [{
      _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
      _timeServerStarted isNotEqualTo 0;
    },{
      params["_safeZoneModules"];
      _result = [_safeZoneModules] call FNF_ClientSide_fnc_anyNonExpiredSafeZones;
      if (not _result) then
      {
        [true, true, true] call ace_spectator_fnc_setSpectator;
        player setDamage 1;
      };
    }, [_safeZoneModules]] call CBA_fnc_waitUntilAndExecute;
  };
};
