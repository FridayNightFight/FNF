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

{
  _syncedObjects = synchronizedObjects _x;
  _selectorName = _x getVariable ["fnf_selectorName", "Default Name"];
  _module = _x;

  _forPlayer = false;
  _options = [];
  {
    //check if selector is for player
    if (_x isEqualTo player) then
    {
      _forPlayer = true;
      continue;
    };

    //check if object is a selector option
    if (typeOf _x isEqualTo "fnf_module_selectorOption") then
    {
      _optionName = _x getVariable ["fnf_optionName", "Default Name"];
      _options pushBack [_x, _optionName];
    };
  } forEach _syncedObjects;


  //if selector is not for player move on to next selector
  if (not _forPlayer) then
  {
    continue;
  };


  //if the host action has not been created yet for all selectors, create it
  if (isNil "fnf_showSelectors") then
  {
    fnf_showSelectors = true;
    _action = ["trueHost", "HK Selectors", "", {}, {fnf_showSelectors}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    //[items, ID, Type]
    fnf_selections = [];
  };

  //create the host for the current selector
  _objID = getObjectID _x;
  _action = ["host_" + str(_objID), _selectorName, "", {}, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions", "trueHost"], _action] call ace_interact_menu_fnc_addActionToObject;

  {
    //for each option add the ace action and add
    _statement = {
      params["_target", "_player", "_params"];
      [_params select 0, _params select 1, _params select 2] remoteExec ["FNF_ServerSide_fnc_switchAssetSelection", 2, false];
    };
    _action = ["option" + str(_forEachIndex),_x select 1,"",_statement,{true},{},[_module, _x select 0]] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "trueHost", "host_" + str(_objID)], _action] call ace_interact_menu_fnc_addActionToObject;
  } forEach _options;

} forEach _modules;
