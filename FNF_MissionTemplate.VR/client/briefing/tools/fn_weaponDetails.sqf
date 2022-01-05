/*
* Author: IndigoFox
* Used to generate diary string or structured text for UI applications containing a weapon's details (picture + display name).
* Used in tandem with phx_briefing_fnc_parseLoadout.
*
* Arguments:
* 0: 1 or more weapon classnames <ARRAY> of <STRING>
* 1. (optional) default false: return diary string, true: return Structured Text
*
* Return Value:
* <STRING> or <Structured Text>
*
* Example:
* [["rhs_weap_mk18_KAC","rhs_weap_mk18_m320","rhs_weap_m4a1_m320"]] call phx_briefing_fnc_weaponDetails
*
* Public: No
*/

params [["_data", []], ["_structTxt", false]];
private _weapons = +_data;
private _out = [];
{
  private _weaponCfg = _x call CBA_fnc_getItemConfig;
  private _picture = getText(_weaponCfg >> "picture");
  private _displayName = getText(_weaponCfg >> "displayName");
  private _description = getText(_weaponCfg >> "descriptionShort");
  _description = ([_description, "<br/>", true] call BIS_fnc_splitString) joinString '<br/>  ';
  _description = ([_description, "<br />", true] call BIS_fnc_splitString) joinString '<br/>  ';

  switch (_structTxt) do {
    case false: {
      _out pushBack format[
        "<img width='170' image='%1'/><br/>               <font face='PuristaMedium' size='12'>%2</font>",
        _picture,
        _displayName
      ];
    };
    case true: {
      _out pushBack format[
        "<img size='2' image='%1'/>  -  <t face='PuristaMedium' size='1'>%2</t>",
        _picture,
        _displayName
      ];
    };
  };
} forEach _weapons;
_out
