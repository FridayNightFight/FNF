/*
* Author: IndigoFox
* Used to prepare a string (diary) or structured text (ui) object that displays a small icon representing each unique item
* with a count of how many are provided (optional). In the diary, the number is clickable and
* will locally systemChat the display name of the item.
*
* Arguments:
* 0: The items to represent in the format "itemClassname:count" <ARRAY> of <STRING>
* 1: (optional) Whether to display the count of each unique item <BOOLEAN> (default: true)
* 2: (optional) Whether to return diary-compatible STRING or UI-compatible Structured Text <BOOLEAN> (default: false, returns diary string)
*
* Return Value:
* <STRING> or <Structured Text>
*
* Example:
* [["FirstAidKit:5","ACE_MapTools","ACE_CableTie:2"]] call fnf_briefing_fnc_notesItems;
* "<img height='30' image='\A3\Weapons_F\Items\data\UI\gear_FirstAidKit_CA.paa'/><execute expression='systemChat ""First Aid Kit"";'>x5</execute><img height='30' image='\z\ace\addons\captives\UI\ace_cabletie_ca.paa'/><execute expression='systemChat ""Cable Tie"";'>x2</execute>"
*
*
* Public: No
*/

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
  } else {
    _parseArr pushBack _item;
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
