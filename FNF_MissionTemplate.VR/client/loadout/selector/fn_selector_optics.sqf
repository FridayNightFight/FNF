//Add magnified optics if enabled
if (phx_magnifiedOptics || pRole == ROLE_MK) then {
  phx_selector_optics append phx_selector_magOptics;
};
if (pRole == ROLE_SNP) then {
  phx_selector_optics = phx_loadout_sniper_optics;
};

player setVariable ["phx_ChosenOptic", (primaryWeaponItems player) select 2];

//optics actions
{
  _action = ["Optic_Selector",
    getText (configFile >> "cfgWeapons" >> _x >> "displayName"),
    "",
    {
      private _previousOptic = player getVariable ["phx_ChosenOptic", ""];
      private _optic = _this select 2;
      if (
        (
          (pRole == ROLE_SNP) ||
          (pRole == ROLE_MK && !phx_magnifiedOptics)
        )
      ) then {
        _loadoutWeapons = (getUnitLoadout player) # 4;
        _loadoutWeapons append (primaryWeaponItems player);
        _loadoutWeapons append (backpackitems player);
        _oldOpticPresent = ((flatten _loadoutWeapons) findIf {(_x) isEqualTo _previousOptic}) > -1;
        if (_oldOpticPresent || _previousOptic isEqualTo "") then {
          // found previous optic in inventory, now remove > replace
          {
            if (_x isEqualTo _previousOptic) then {
                _player removeItemFromUniform _x;
            };
            nil
          } count (uniformItems player);

          {
            if (_x isEqualTo _previousOptic) then {
                _player removeItemFromVest _x;
            };
            nil
          } count (vestItems player);

          {
            if (_x isEqualTo _previousOptic) then {
                _player removeItemFromBackpack _x;
            };
            nil
          } count (backpackItems player);

          player removePrimaryWeaponItem _previousOptic;
          player addPrimaryWeaponItem _optic;
          player setVariable ["phx_ChosenOptic", _optic];
        } else {
          // restricted role & old optic not found to replace
          [
            [
              "WARNING",
              2,
              [1,1,0,1]
            ],
            ["Previous optic not found in inventory."],
            ["Cannot spawn a new optic for you."],
            [""],
            ["This is an anti-duplication measure."],
            ["You will need to return the below optic to your inventory"],
            ["to be removed and replaced with your selection."],
            [
              getText(configFile >> "CfgWeapons" >> _previousOptic >> "picture"),
              4 // increase size of image
            ],
            [getText(configFile >> "CfgWeapons" >> _previousOptic >> "displayName")],
            [_previousOptic],
            true
          ] call CBA_fnc_notify;
        };
      } else {
        player addPrimaryWeaponItem _optic;
        player setVariable ["phx_ChosenOptic", _optic];
      };
    },
    {
      (_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) ||
      (
        pRole == ROLE_SNP &&
        (
          ((primaryWeaponItems player) select 2) in phx_loadout_sniper_optics ||
          ((primaryWeaponItems player) select 2) == ""
        )
      )
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
    ((primaryWeaponItems player) select 2) != ""
  }
] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
