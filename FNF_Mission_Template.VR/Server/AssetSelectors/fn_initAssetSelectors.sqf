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
  _timeToDelete = _x getVariable ["fnf_timeVicsAreDeleted", "15"];
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
          [_x, true] remoteExec ["lockInventory", 0, true];
          [_x, false] remoteExec ["allowDamage", 0, true];
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

  [{
    params["_options", "_timeToDelete"];
    _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
    _result = objNull;
    if (isServer and hasInterface) then
    {
      _result = time > (_timeToDelete * 60);
    } else {
      _result = (serverTime - _timeServerStarted) > (_timeToDelete * 60);
    };
    if (time < 1) then
    {
      _result = false;
    };
    _result;
  },{
    params["_options", "_timeToDelete"];
    {
      if (not simulationEnabled (_x select 0 select 0)) then
      {
        {
          _attachedObjects = attachedObjects _x;
          {
            deleteVehicle _x;
          } forEach _attachedObjects;
          hideObjectGlobal _x;
        } forEach (_x select 0);
      } else {
        {
          [_x, false] remoteExec ["lockInventory", 0, true];
          [_x, true] remoteExec ["allowDamage", 0, true];
        } forEach (_x select 0);
      };
    } forEach _options;
  }, [_options, _timeToDelete]] call CBA_fnc_waitUntilAndExecute;
} forEach _modules;
