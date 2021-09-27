private _weapons = _this;
private _out = [];
{
  private _weaponCfg = _x call CBA_fnc_getItemConfig;
  private _picture = getText(_weaponCfg >> "picture");
  private _displayName = getText(_weaponCfg >> "displayName");
  private _description = getText(_weaponCfg >> "descriptionShort");
  _out pushBack format[
    "<img width='100' image='%1'/><br/>%2<br/>%3<br/>",
    _picture,
    _displayName,
    _description
  ];
} forEach _weapons;
_out