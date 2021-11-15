private _weapons = _this;
private _out = [];
{
  private _weaponCfg = _x call CBA_fnc_getItemConfig;
  private _picture = getText(_weaponCfg >> "picture");
  private _displayName = getText(_weaponCfg >> "displayName");
  private _description = getText(_weaponCfg >> "descriptionShort");
  _description = ([_description, "<br/>", true] call BIS_fnc_splitString) joinString '<br/>  ';
  _description = ([_description, "<br />", true] call BIS_fnc_splitString) joinString '<br/>  ';

  _out pushBack format[
    "<img width='170' image='%1'/><br/>               <font face='PuristaMedium' size='12'>%2</font>",
    _picture,
    _displayName
  ];
} forEach _weapons;
_out
