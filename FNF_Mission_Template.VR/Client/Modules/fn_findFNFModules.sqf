/*
	Author: Mallen

	Description:
		Finds and returns all FNF modules

	Parameter(s):
		None

	Returns:
		Module Array in format [module,module]
*/

_allLogic = entities [["Logic"], []];

_fnfModules = [];

{
	_logicName = typeOf _x;
	if (_logicName find "fnf_module_" isNotEqualTo -1) then
	{
		_fnfModules pushBack _x;
	};
} forEach _allLogic;

_fnfModules;
