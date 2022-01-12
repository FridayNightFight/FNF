// enable ACE selection of SHQ Aux Role CSW setting
private _toLoad = _this;

phx_cswItems params ["_weapon", "_tripod"];
private _mags = +phx_cswMags;


private _totalMags = [];
{
  (_x splitString ':') params ["_class","_count"];
  for "_i" from 1 to (parseNumber _count) do {
    _totalMags pushBack _class;
  };
} forEach _mags;
// [_totalMags, true] call CBA_fnc_shuffle;
private _halfMags = floor((count _totalMags) / 2) + ((count _totalMags) % 2);

private _curMags = (player getVariable ["phx_cswMagsCurrent", []]);

private _equipped = magazines player select {_x in _curMags};
if (
  (
    count _curMags > 0 &&
    count _equipped < count _curMags
  ) ||
  (
    count _curMags > 0 &&
    !((secondaryWeapon player) in phx_cswItems)
  )
) exitWith {
  ["<t align='center'>Error:<br/>Missing ammo, tripod, or weapon -- cannot re-equip.</t>", "error", 7] call phx_ui_fnc_notify;
};


player removeWeapon (secondaryWeapon player);
[player, _toLoad] call CBA_fnc_addWeapon;

private _magsToRemove = _totalMags call BIS_fnc_consolidateArray;
{
  _x params ["_class","_count"];
  for "_i" from 0 to _count do {
    player removeMagazine _class;
  };
} forEach _magsToRemove;


private _addedMags = [];
switch (_toLoad) do {
  case _weapon: {
    {
      [_x, "backpack", player] call phx_loadout_fnc_addGear;
      _addedMags pushBack _x;
    } forEach (_totalMags select [_halfMags, count _totalMags - 1]);
  };
  case _tripod: {
    {
      [_x, "backpack", player] call phx_loadout_fnc_addGear;
      _addedMags pushBack _x;
    } forEach (_totalMags select [0, _halfMags]);
  };
};

{
  private _item = _x;
  if (count (items player select {_x == _item}) == 0) then {
    [_x, "uniform", player] call phx_loadout_fnc_addGear;
  };
} forEach ((missionConfigFile >> "CfgLoadouts" >> "common" >> "mortarGear") call BIS_fnc_getCfgDataArray);

player setVariable ["phx_cswMagsCurrent", _addedMags];
