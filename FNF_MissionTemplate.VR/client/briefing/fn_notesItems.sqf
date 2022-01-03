params [
  "_items",
  ["_showCount", true],
  ["_structText", false]
];

private _parseArr = [];
{
  if (_x find ":" != -1) then {
    _item = (_x select [0, _x find ":"]);
    _numToAdd = parseNumber (_x select [(_x find ":") + 1]);
    for "_i" from 1 to _numToAdd do {
      _parseArr pushBack _item;
    };
  };
} forEach _items;

private _outArr = [];
private _procItems = _parseArr call BIS_fnc_consolidateArray;

if (!_structText) then {
  {
    private _thisCfg = (_x # 0) call CBA_fnc_getItemConfig;
    private _dispName = [_thisCfg] call BIS_fnc_displayName;
    private _desc = getText(_thisCfg >> "descriptionShort");
    private _pic = (_thisCfg >> "picture") call BIS_fnc_getCfgData;
    private _count = _x # 1;
    if (_showCount) then {
      _outArr pushBack format["<img height='30' image='%1'/><execute expression='systemChat ""%2"";'>x%3</execute>", _pic, _dispName, _count];
    } else {
      _outArr pushBack format["<img height='30' image='%1'/><execute expression='systemChat ""%2"";'>o</execute>", _pic, _dispName];
    };
  } forEach _procItems;
} else {
  {
    private _thisCfg = (_x # 0) call CBA_fnc_getItemConfig;
    private _dispName = [_thisCfg] call BIS_fnc_displayName;
    private _desc = getText(_thisCfg >> "descriptionShort");
    private _pic = (_thisCfg >> "picture") call BIS_fnc_getCfgData;
    private _count = _x # 1;
    if (_showCount) then {
      _outArr pushBack format["<img size='1.2' image='%1'/>x%3  ", _pic, _dispName, _count];
    } else {
      _outArr pushBack format["<img size='1.2' image='%1'/>  ", _pic, _dispName];
    };
  } forEach _procItems;
};
(_outArr joinString "")
