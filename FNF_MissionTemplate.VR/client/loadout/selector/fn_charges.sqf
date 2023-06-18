//set current charges to default from laodout init
_fnc_hintDetails = {
  params ["_dispName", "_className"];
  private _thisCfg = _className call CBA_fnc_getItemConfig;
  private _dispName = _dispName;
  private _desc = getText(_thisCfg >> "descriptionShort");
  private _pic = getText(_thisCfg >> "picture");

  _textArr = [
    format["<t align='center'><t size='1.5'>%1</t>", _dispName],
    _desc,
    format["<img size='3' image='%1'/>", _pic],
    "</t>"
  ];
  [_textArr joinString '<br/>', "success", 5] call fnf_ui_fnc_notify;
};

private _expArr = _this;

if (_expArr isEqualTo fnf_selector_currentExplosives) exitWith {};

private _missing = false;

{
  private ["_expClass","_expCount"];

  //make sure player has all old charges to be able to add new ones
  if (_forEachIndex != 0) then {
    if (_x find ":" != -1) then {
      _expClass = _x splitString ":" select 0;
      _expCount = parseNumber (_x splitString ":" select 1);
    } else {
      _expClass = _x;
      _expCount = 1;
    };

    if ({_x == _expClass} count magazines player < _expCount) then {
      _missing = true;
    };
  };
} forEach fnf_selector_currentExplosives;

//removes old charges and adds new ones if player still has old ones
if (!_missing) then {
  {
    player removeMagazines (_x splitString ":" select 0);
  } forEach fnf_selector_currentExplosives;

  {
    if (_forEachIndex != 0) then {
      _x call fnf_loadout_fnc_addGear;
    };
  } forEach _expArr;

  // Show the player what they chose
  _granted = [];
  {
    _class = (_x splitString ":" select 0);
    _granted pushBack _class;
  } forEach (_expArr select [1, 3]);

  {
    [_expArr # 0, _x] call _fnc_hintDetails;
  } forEach _granted;

  fnf_selector_currentExplosives = _expArr;
} else {

  // warn player they are missing charges
  _mustReturn = [];
  {
    _class = (_x splitString ":" select 0);
    _mustReturn pushBack ([
      getText(configFile >> "CfgMagazines" >> _class >> "displayName"),
      format[
        "<img size='4' image='%1'></t>",
        getText(configFile >> "CfgMagazines" >> _class >> "picture")
      ]
    ] joinString "<br/>");
  } forEach (fnf_selector_currentExplosives select [1, 3]);
  _mustReturn = _mustReturn joinString "<br/>";

  [
    [
      "<t align='center'>",
      "<t size='2' color='#FFFF00' >WARNING</t>",
      "To avoid duplication, you must have your previously chosen explosives in your inventory to select a new one.",
      _mustReturn,
      "</t>"
    ] joinString "<br/>",
    "warning",
    10
  ] call fnf_ui_fnc_notify;
};