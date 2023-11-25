/*
	Author: Mallen

	Description:
    Sort an array by location so it is consistant

	Parameter(s):
		0: ARRAY - Array of Objects to be sorted

	Returns:
		Sorted Array
*/

params["_input"];

[_input, [], {
  _loc = getPos _x;
  _locX = str(_loc select 0);
  _locXSplit = _locX splitString ".";
  for "_i" from (count (_locXSplit select 0)) to 6 do {
    _locXSplit set [0, ("0" + (_locXSplit select 0))];
  };
  _locX = (_locXSplit select 0);
  if ((count _locXSplit) == 2) then
  {
    _locX = (_locXSplit select 0) + (_locXSplit select 1);
  };

  _locY = str(_loc select 1);
  _locYSplit = _locY splitString ".";
  for "_i" from (count (_locYSplit select 0)) to 6 do {
    _locYSplit set [0, ("0" + (_locYSplit select 0))];
  };
  _locY = (_locYSplit select 0);
  if ((count _locYSplit) == 2) then
  {
    _locY = (_locYSplit select 0) + (_locYSplit select 1);
  };

  _locZ = str(_loc select 2);
  _locZSplit = _locZ splitString ".";
  for "_i" from (count (_locZSplit select 0)) to 6 do {
    _locZSplit set [0, ("0" + (_locZSplit select 0))];
  };
  _locZ = (_locZSplit select 0);
  if ((count _locZSplit) == 2) then
  {
    _locZ = (_locZSplit select 0) + (_locZSplit select 1);
  };

  _locString = str(_locX) + str(_locY) + str(_locZ);
  _locString;
}] call BIS_fnc_sortBy;
