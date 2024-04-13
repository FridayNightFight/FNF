/*
	Author: Mallen

	Description:
		Sets up the required asset selectors specified by modules

	Parameter(s):
		0: ARRAY -  An array of all asset selector modules

	Returns:
		None
*/

params ["_modules"];

fnf_assetSelectorSelections = [];

{
  _syncedObjects = synchronizedObjects _x;
  _selectorName = _x getVariable ["fnf_selectorName", "Default Name"];
  _module = _x;

  _forPlayer = false;
  _options = [];
  {
    //check if object is a selector option
    if (typeOf _x isEqualTo "fnf_module_selectorOption") then
    {
      _optionSyncedObjects = synchronizedObjects _x;
      _default = _x getVariable ["fnf_defaultSelection", false];
      _toAdd = [];

      {
        //check if object is not the host it should be attached to
        if (typeOf _x isNotEqualTo "fnf_module_selectorAssetHost") then
        {
          _toAdd pushBack _x;
        };
      } forEach _optionSyncedObjects;
      _options pushBack [_toAdd, _x, _default];

      if (not _default) then
      {
        {
          _x lock 2;
          _boundingBox = boundingBoxReal [_x, "Geometry"];
          _height = (_boundingBox select 1 select 2) + 1;
          _marker = createVehicle ["Sign_Arrow_Large_F", [0,0,0], [], 0, "CAN_COLLIDE"];
          _marker attachTo [_x, [0,0,_height]];
          _x enableSimulationGlobal false;
        } forEach _toAdd;
      };
    };
  } forEach _syncedObjects;

  fnf_assetSelectorSelections pushBack [_module, _options];
} forEach _modules;
