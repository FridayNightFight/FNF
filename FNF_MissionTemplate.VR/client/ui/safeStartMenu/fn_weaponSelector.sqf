params ["_weapons"];
_wepMenu = [
	[
		"weaponSelector",
		"Weapon Selector",
		"popup",
		"",
		false
	],
	[]
];
{
	private _className = _x # 0;
	private _thisCfg = _className call CBA_fnc_getItemConfig;
	private _dispName = [_thisCfg] call BIS_fnc_displayName;
	private _desc = getText(_thisCfg >> "descriptionShort");
	private _typeOf = configName _thisCfg;
	private _pic = getText(_thisCfg >> "picture");

	_argArr = [
		_className,
		_dispName,
		_desc,
		_typeOf,
		_pic
	];
	(_wepMenu # 1) pushBack [
		_dispName,
		format["%1 call fnf_selector_fnc_weapons", _x],
		_pic,
		_typeOf
	];
} forEach _weapons;
_wepMenu
