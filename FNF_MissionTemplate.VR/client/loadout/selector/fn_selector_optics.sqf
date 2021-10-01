//Add magnified optics if enabled

player setVariable ["phx_ChosenOptic", (primaryWeaponItems player) select 2];

phx_selector_fnc_optics = {

  _fnc_hintDetails = {
    private _thisCfg = _this call CBA_fnc_getItemConfig;
    private _dispName = [_thisCfg] call BIS_fnc_displayName;
    private _desc = getText(_thisCfg >> "descriptionShort");
    private _pic = getText(_thisCfg >> "picture");

    _textArr = [
      format["<t align='center'><t size='1.5'>%1</t>", _dispName],
      _desc,
      format["<img size='3' image='%1'/>", _pic],
      "</t>"
    ];
    [_textArr joinString '<br/>', "success", 5] call phx_ui_fnc_notify;
  };

  private _optic = _this select 2;
  private _previousOptic = player getVariable ["phx_ChosenOptic", ""];
  // Every player should have 1 optic on the field. No sense to trade.
  _loadoutWeapons = (getUnitLoadout player) # 4;
  _loadoutWeapons append (primaryWeaponItems player);
  _loadoutWeapons append (backpackitems player);
  _oldOpticPresent = ((flatten _loadoutWeapons) findIf {(_x) isEqualTo _previousOptic}) > -1;
  if (_oldOpticPresent || _previousOptic isEqualTo "") then {
    // found previous optic in inventory, now remove > replace
    {
      if (_x isEqualTo _previousOptic) then {
          player removeItemFromUniform _x;
      };
      nil
    } count (uniformItems player);

    {
      if (_x isEqualTo _previousOptic) then {
          player removeItemFromVest _x;
      };
      nil
    } count (vestItems player);

    {
      if (_x isEqualTo _previousOptic) then {
          player removeItemFromBackpack _x;
      };
      nil
    } count (backpackItems player);

    player removePrimaryWeaponItem _previousOptic;
    player addPrimaryWeaponItem _optic;
    player setVariable ["phx_ChosenOptic", _optic];

    _optic call _fnc_hintDetails;
  } else {
    // restricted role & old optic not found to replace
    [
      [
        "<t align='center'>",
        "<t size='2' color='#FFFF00' >WARNING</t>",
        "Trading optics amongst players is not allowed. You must have your previously chosen one in your inventory to select a new one.",
        format[
          "<img size='4' image='%1'></t>",
          getText(configFile >> "CfgWeapons" >> _previousOptic >> "picture")
        ],
        getText(configFile >> "CfgWeapons" >> _previousOptic >> "displayName"),
        "</t>"
      ] joinString "<br/>",
      "warning",
      10
    ] call phx_ui_fnc_notify;
  };
};

//optics actions
{
  private _thisCfg = _x call CBA_fnc_getItemConfig;
	private _dispName = [_thisCfg] call BIS_fnc_displayName;
  // show magnification
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

  _action = [
    "Optic_Selector",
    _dispName,
    "",
    { // execution
      _this call phx_selector_fnc_optics;
    },
    { // condition
      (_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) &&
      fnf_pref_loadoutInterface == "ACE"
    },
    {},
    _x
  ] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_optics;

_action = [
  "Optic_Selector",
  "None",
  "",
  {
    player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
    player setVariable ["phx_ChosenOptic", ""];
  },
  {
    player getVariable "phx_ChosenOptic" != "" &&
    fnf_pref_loadoutInterface == "ACE"
  }
] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
