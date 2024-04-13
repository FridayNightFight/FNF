/*
	Author: Mallen

	Description:
		Switches a selection from one option to another

	Parameter(s):
		0: OBJECT -  The Selector Host
    1: OBJECT -  The Selector Option

	Returns:
		None
*/

params["_selectorHost", "_selectorOption"];

_selectorIndex = -1;
_optionIndex = -1;

{
  _checkingHost = _x select 0;
  if (_selectorHost isEqualTo _checkingHost) then
  {
    _selectorIndex = _forEachIndex;
    {
      if ((_x select 1) isEqualTo _selectorOption) then
      {
        _optionIndex = _forEachIndex;
      };
    } forEach (_x select 1);
  };
} forEach fnf_assetSelectorSelections;

if (_selectorIndex isEqualTo -1 or _optionIndex isEqualTo -1) exitWith
{
  ["<t size='1.5' align='center'>Failed to switch selection, server could not find specified selection</t>", "error"] remoteExec ["FNF_ClientSide_fnc_notificationSystem", remoteExecutedOwner, false];
};

_options = fnf_assetSelectorSelections select _selectorIndex select 1;

{
  if (_x select 2) then
  {
    _currentOptions = _x select 0;
    {
      _crew = crew _x;
      {
        moveOut _x;
      } forEach _crew;
      _x setVelocity [0, 0, 0];
      _x lock 2;
      _boundingBox = boundingBoxReal [_x, "Geometry"];
      _height = (_boundingBox select 1 select 2) + 1;
      _marker = createVehicle ["Sign_Arrow_Large_F", [0,0,0], [], 0, "CAN_COLLIDE"];
      _marker attachTo [_x, [0,0,_height]];
      _x enableSimulationGlobal false;
    } forEach _currentOptions;
  };
} forEach _options;

_options select _optionIndex set [2, true];
{
  _x lock 0;
  _x enableSimulationGlobal true;
  _x setVelocity [0, 0, 0];
  _attachedObjects = attachedObjects _x;
  {
    deleteVehicle _x;
  } forEach _attachedObjects;
} forEach (_options select _optionIndex select 0);
