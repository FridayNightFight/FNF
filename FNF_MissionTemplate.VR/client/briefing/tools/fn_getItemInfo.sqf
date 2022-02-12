/*
* Author: IndigoFox
* Helper function that creates a small array of pairs representing config, display name, description, and picture from config recallable using BIS_fnc_getFromPairs.
*
* Arguments:
* 0: The classname of the item to evaluate <STRING>
*
* Return Value:
* <ARRAY>
*
* Example:
* "ace_compat_rhs_usf3_m2_carry" call fnf_briefing_fnc_getItemInfo;
*
*
* Public: Yes
*/

private _thisCfg = _this call CBA_fnc_getItemConfig;
private _dispName = [_thisCfg] call BIS_fnc_displayName;
private _desc = getText(_thisCfg >> "descriptionShort");
private _pic = (_thisCfg >> "picture") call BIS_fnc_getCfgData;
[
  ["config",_thisCfg],
  ["displayName",_dispName],
  ["description",_desc],
  ["picture",_pic]
]
