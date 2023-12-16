/*
	Author: Mallen

	Description:
		Sets up the required objectives specified by modules for spectators

	Parameter(s):
		0: ARRAY -  An array of all obj modules

	Returns:
		None
*/

params ["_modules"];

_modules = [_modules] call FNF_ClientSide_fnc_sortByLocation;

fnf_objectives = [];

_missionStatusSet = false;

_sectorObjCleanup = [];

{
  _syncedObjects = synchronizedObjects _x;
  _visibleToAllies = _x getVariable ["fnf_visibleToAllies", true];

  //check if objective module is for player or player's allys
  _showObj = true;
  _forPlayer = false;

  _objSide = sideEmpty;

  _sideCounter = 0;
  {
    _objectType = typeOf _x;

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

    _sideCounter = _sideCounter + 1;
  } forEach _syncedObjects;

  if (_sideCounter isEqualTo 0) then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Objective has no valid side synced to it, objective will NOT function";
    };
    continue;
  };
  if (_sideCounter > 1) then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Objective has more than one side synced to it, objective will NOT function";
    };
    continue;
  };

  //if it is check what kind of objective it is and run corresponding init script
  _moduleType = typeOf _x;
  if (_forPlayer or _showObj) then
  {
    switch (_moduleType) do
    {
      case "fnf_module_destroyObj":
      {
        [_x,_objSide] call FNF_ClientSide_fnc_initSpectatorDestroy;
      };

      case "fnf_module_sectorCaptureObj":
      {
        if (not _missionStatusSet) then
        {
          addMissionEventHandler ["Map", {call BIS_fnc_showMissionStatus}];
          call BIS_fnc_showMissionStatus;
        };
        [_x,_objSide] call FNF_ClientSide_fnc_initSpectatorCaptureSector;
      };

      case "fnf_module_terminalObj":
      {
        [_x,_objSide] call FNF_ClientSide_fnc_initSpectatorTerminal;
      };

      case "fnf_module_assassinObj":
      {
        [_x,_objSide] call FNF_ClientSide_fnc_initSpectatorAssassin;
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
