/*
	Author: Mallen

	Description:
		Sets up the required selectors specified by modules

	Parameter(s):
		0: ARRAY -	An array of all selector modules

	Returns:
		None
*/

params ["_modules"];

_objectsToDelete = [];
_globalCounter = 0;

{
	_hostModule = _x;
	_syncedObjects = synchronizedObjects _hostModule;
	_selectorName = _hostModule getVariable ["fnf_selectorName", "Default Name"];

	_forPlayer = false;
	_selectorOptions = [];
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
			_selectorOptions pushBack _x;
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
		_action = ["trueHost", "FNF Selectors", "", {}, {fnf_showSelectors}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	};

	//create the host for the current selector
	_action = ["host_" + str(_globalCounter), _selectorName, "", {}, {true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "trueHost"], _action] call ace_interact_menu_fnc_addActionToObject;

	{
		_optionModule = _x;
		_optionName = _x getVariable ["fnf_optionName", "Default Name"];
		_default = _x getVariable ["fnf_defaultSelection", false];

		//for each option add the ace action and add
		_statement = {
			params["_target", "_player", "_params"];
			[_params select 0, _params select 1] call FNF_ClientSide_fnc_switchSelection;
		};
		_action = ["option" + str(_forEachIndex),_optionName,"",_statement,{true},{},[_hostModule, _optionModule]] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "trueHost", "host_" + str(_globalCounter)], _action] call ace_interact_menu_fnc_addActionToObject;

		//if this selection is the default (like default demo charges etc) then add it to the selections made array
		if (_default) then
		{
			_hostModule setVariable ["fnf_selection_" + (getPlayerUID player), _optionModule, true];
		};
	} forEach _selectorOptions;

	_globalCounter = _globalCounter + 1;

} forEach _modules;

//hide each object that should be hidden
{
	hideObject _x;
} forEach _objectsToDelete;
