/*
	Author: Mallen

	Description:
		Returns an array of the module type requested

	Parameter(s):
		0: ARRAY -  Array of FNF modules
    1: STRING -  Name of the module type to find

	Returns:
		Module Array in format [module,module]
*/

params["_modules", "_searchTerm"];

_output = [];

{
  if ((typeOf _x) regexMatch (".+" + _searchTerm)) then
  {
    _output pushBack _x;
  };
} forEach _modules;

_output;
