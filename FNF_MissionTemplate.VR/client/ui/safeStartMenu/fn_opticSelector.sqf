params ["_optics"];
_opticsMenu = [
	[
		"opticSelector",
		"Optic Selector",
		"popup",
		"",
		false
	],
	[]
];
{
	private _className = _x;
	private _thisCfg = _x call CBA_fnc_getItemConfig;
	private _dispName = [_thisCfg] call BIS_fnc_displayName;
	private _desc = getText(_thisCfg >> "descriptionShort");
	private _typeOf = configName _thisCfg;
	private _pic = getText(_thisCfg >> "picture");

	// get magnification
	if (isClass (_thisCfg >> "ItemInfo" >> "OpticsModes")) then {
		private _opticsModes = "true" configClasses (_thisCfg >> "ItemInfo" >> "OpticsModes");
		_dispName = _dispName + " (";
		private _zoomsArr = [];
		{
			// _fovAt1xZoom = ([] call CBA_fnc_getFov) select 0;
			_fovAt1xZoom = 0.75;
			private _zoomMax = _fovAt1xZoom / getNumber(_x >> "opticsZoomMax");
			if (_zoomMax > 1) then {
				_zoomMax = ceil(_zoomMax / 2) - 1 max 1;
			} else {
				_zoomMax = ceil(_zoomMax);
			};
			_zoomsArr pushBack _zoomMax;
		} forEach _opticsModes;
		_zoomsArr sort false;
		_zoomsArr = _zoomsArr apply {str(_x) + "x"};
		_dispName = _dispName + (_zoomsArr joinString "/") + ")";
	};

	_argArr = [
		_className,
		_dispName,
		_desc,
		_typeOf,
		_pic
	];

	if (
		_className in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) ||
		(
			pRole == ROLE_SNP &&
			(
				((primaryWeaponItems player) select 2) in phx_loadout_sniper_optics ||
				((primaryWeaponItems player) select 2) == ""
			)
		)
	) then {
		(_opticsMenu # 1) pushBack [
			_dispName,
			format["['','', '%1'] call phx_selector_fnc_optics", _className],
			_pic,
			_typeOf
		];
	};
} forEach _optics;
_opticsMenu