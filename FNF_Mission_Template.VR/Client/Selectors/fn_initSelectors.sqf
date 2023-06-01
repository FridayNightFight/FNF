/*
	Author: Mallen

	Description:
		Sets up the required selectors specified by modules

	Parameter(s):
		0: ARRAY -  An array of all selector modules

	Returns:
		None
*/

params ["_modules"];

_objectsToDelete = [];
_trueHostSelectorSet = false;

{
  _syncedObjects = synchronizedObjects _x;
  _selectorName = _x getVariable "fnf_selectorName";
  _selectorType = _x getVariable "fnf_selectorType";

  _forPlayer = false;
  _options = [];
  {
    //check if selector is for player
    if (_x == player) then
    {
      _forPlayer = true;
      continue;
    };
    //check if player should see safezone for other reasons
    if (not isPlayer _x) then
    {
      _optionSyncedObjects = synchronizedObjects _x;

      _optionName = _x getVariable "fnf_optionName";
      _default = _x getVariable "fnf_defaultSelection";

      {
        if (typeOf _x != "fnf_module_selectorHost") then
        {
          _items = itemCargo _x;
          _magazines = magazineCargo _x;
          _weapons = weaponCargo _x;
          _toAdd = _items;
          _toAdd append _magazines;
          _toAdd append _weapons;

          _options pushBack [_toAdd, _optionName, _default];

          if (_objectsToDelete find _x == -1) then
          {
            _objectsToDelete pushBack _x;
          };
        };
      } forEach _optionSyncedObjects;
    };
  } forEach _syncedObjects;

  if (not _forPlayer) then
  {
    continue;
  };

  if (not _trueHostSelectorSet) then
  {
    _action = ["trueHost", "FNF Selectors", "", {}, {true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    //[items, ID]
    fnf_selections = [];

    _trueHostSelectorSet = true;
  };

  _objID = getObjectID _x;
  _action = ["host_" + str(_objID), _selectorName, "", {}, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions", "trueHost"], _action] call ace_interact_menu_fnc_addActionToObject;

  {
    _statement = {
      params["_target", "_player", "_params"];
      [_params select 0, _params select 1, _params select 2, _params select 3] call FNF_ClientSide_fnc_switchSelection;
    };
    _action = ["option" + str(_forEachIndex),_x select 1,"",_statement,{true},{},[_x select 0, _objID, _selectorType, _x select 1]] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "trueHost", "host_" + str(_objID)], _action] call ace_interact_menu_fnc_addActionToObject;
    if (_x select 2) then
    {
      fnf_selections pushBack [_x select 0, _objID, _selectorType];
    };
  } forEach _options;

} forEach _modules;

{
  hideObject _x;
} forEach _objectsToDelete;
