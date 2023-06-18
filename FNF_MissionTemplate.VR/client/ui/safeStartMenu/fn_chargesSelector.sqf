params ["_charges"];
_chargesMenu = [
	[
		"chargesSelector",
		"Explosives Selector",
		"popup",
		"",
		false
	],
	[]
];
{
	_x params ["_dispName", "_classNameRaw"];
	private _className = (_classNameRaw splitString ':') # 0;

	private _thisCfg = _className call CBA_fnc_getItemConfig;
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

	(_chargesMenu # 1) pushBack [
		_dispName,
		format["%1 call fnf_selector_fnc_explosives", _x],
		_pic,
		_typeOf
	];
} forEach _charges;
_chargesMenu
