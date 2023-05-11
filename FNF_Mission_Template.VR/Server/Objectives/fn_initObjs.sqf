/*
	Author: Mallen

	Description:
		Sets up the required objectives specified by modules server side

	Parameter(s):
		0: ARRAY -  An array of all obj modules

	Returns:
		None
*/
if (!isServer) exitWith {};

params ["_modules"];

fnf_objectives = [];

{
  _syncedObjects = synchronizedObjects _x;
  _objSide = sideEmpty;

  //check if objective module is for player or player's allys
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
  } forEach _syncedObjects;

  _moduleType = typeOf _x;
  switch (_moduleType) do
  {
    case "fnf_module_destroyObj":
    {
      [_x, _objSide] call FNF_ServerSide_fnc_initDestroy
    };
    default {};
  };
} forEach _modules;
