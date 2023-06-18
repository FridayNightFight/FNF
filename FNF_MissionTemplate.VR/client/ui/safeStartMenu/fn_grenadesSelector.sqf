params ["_grenades"];
_grenadesMenu = [
	[
		"grenadesSelector",
		"Grenades Selector",
		"popup",
		"",
		false
	],
	[]
];
diag_log text str(_grenades);
{
	diag_log text str(_x);
	_x params ["_dispName", "_classNameRaw"];
	private _className = (_classNameRaw splitString ':') # 0;
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

	(_grenadesMenu # 1) pushBack [
		_dispName,
		format["%1 call fnf_selector_fnc_grenades", _x],
		_pic,
		_typeOf
	];
} forEach _grenades;
_grenadesMenu
