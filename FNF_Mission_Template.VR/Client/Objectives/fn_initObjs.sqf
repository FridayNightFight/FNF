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
  if (_forPlayer or _showObj) then
  {
    _moduleType = typeOf _x;
    switch (_moduleType) do
    {
      case "fnf_module_destroyObj":
      {
        [_x, _forPlayer] call FNF_ClientSide_fnc_initDestroy;
      };

      case "fnf_module_sectorCaptureObj":
      {
        [_x, _forPlayer] call FNF_ClientSide_fnc_initCaptureSector;
      };

      //if no type found then objective must be part of a new mod update that framework isnt equipped to handle
      default
      {
        if (fnf_debug) then
        {
          systemChat "DANGER: FNF Obj module " + _moduleType + " is of unknown type, make sure template is up to date";
        };
      };
    };
  };
} forEach _modules;
