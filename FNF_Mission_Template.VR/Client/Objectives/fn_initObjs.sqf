/*
	Author: Mallen

	Description:
		Sets up the required objectives specified by modules

	Parameter(s):
		0: ARRAY -  An array of all obj modules

	Returns:
		None
*/

params ["_modules"];

fnf_objectives = [];

_missionStatusSet = false;

_sectorObjCleanup = [];

{
  _syncedObjects = synchronizedObjects _x;
  _visibleToAllies = _x getVariable "fnf_visibleToAllies";

  //check if objective module is for player or player's allys
  _showObj = false;
  _forPlayer = false;
  {
    _objectType = typeOf _x;
    _objSide = sideEmpty;
    switch (_objectType) do
    {
      case "SideBLUFOR_F":
      {
        _objSide = west;
      };
      case "SideOPFOR_F":
      {
        _objSide = east;
      };
      case "SideResistance_F":
      {
        _objSide = independent;
      };
      default
      {
        continue;
      };
    };

    if (_objSide == playerSide) then
    {
      _forPlayer = true;
      break;
    };

    if ([playerSide, _objSide] call BIS_fnc_sideIsFriendly) then
    {
      _showObj = true;
    };
  } forEach _syncedObjects;

  //if it is check what kind of objective it is and run corresponding init script
  _moduleType = typeOf _x;
  if (_forPlayer or _showObj) then
  {
    switch (_moduleType) do
    {
      case "fnf_module_destroyObj":
      {
        [_x, _forPlayer] call FNF_ClientSide_fnc_initDestroy;
      };

      case "fnf_module_sectorCaptureObj":
      {
        if (not _missionStatusSet) then
        {
          addMissionEventHandler ["Map", {call BIS_fnc_showMissionStatus}];
          call BIS_fnc_showMissionStatus;
        };
        [_x, _forPlayer] call FNF_ClientSide_fnc_initCaptureSector;
      };

      //if no type found then objective must be part of a new mod update that framework isnt equipped to handle
      default
      {
        if (fnf_debug) then
        {
          systemChat ("DANGER: FNF Obj module " + _moduleType + " is of unknown type, make sure template is up to date");
        };
      };
    };
  } else {
    //clean up objectives that need to be cleaned up
    switch (_moduleType) do
    {
      case "fnf_module_sectorCaptureObj":
      {
        _sectorObjCleanup pushBack _x;
      };

      case "fnf_module_destroyObj":
      {
      };

      //if no type found then objective must be part of a new mod update that framework isnt equipped to handle
      default
      {
        if (fnf_debug) then
        {
          systemChat ("DANGER: FNF Obj module " + _moduleType + " is of unknown type, make sure template is up to date");
        };
      };
    };
  };
} forEach _modules;

_prefixesToCleanUp = [];

//clean up sector objectives that aren't being used
{
  _zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];
  if (_zonePrefix == "FAILED") then
  {
    continue;
  };
  if ([_zonePrefix] call FNF_ClientSide_fnc_verifyZone) then
  {
    continue;
  };
  if (_prefixesToCleanUp find _zonePrefix != -1) then
  {
    continue;
  };
  _prefixesToCleanUp pushBack _zonePrefix;
} forEach _sectorObjCleanup;

{
  [_x, "", false, false] call FNF_ClientSide_fnc_addZone;
  [_x] call FNF_ClientSide_fnc_removeZone;
} forEach _prefixesToCleanUp;
