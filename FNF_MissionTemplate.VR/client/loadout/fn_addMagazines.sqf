
// for silenced rifleman, assign subsonic ammo if avail
if (pRole == ROLE_RS) then {
  _origMag = phx_loadout_rifle_mag;
  _mags = [phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines;
  {
    _isSubsonic = getNumber(configfile >> "CfgMagazines" >> _x >> "initSpeed") < 335;
    if (_isSubsonic) exitWith {
      // phx_loadout_rifle_mag = format["%1:%2", _x, (phx_loadout_rifle_mag splitString ':') # 1];
      phx_loadout_rifle_mag = format["%1:%2", _x, 11];
    };
  } forEach _mags;
  if (_origMag isEqualTo phx_loadout_rifle_mag) then {
    phx_loadout_rifle_mag = format[
      "%1:%2",
      (phx_loadout_rifle_mag splitString ':') # 0,
      11
    ];
  };
};



phx_loadout_rifle_mag call phx_fnc_addGear;
phx_loadout_sidearm_mag call phx_fnc_addGear;

if (!phx_loadout_hasSpecial) then {
  //Use of CBA_fnc_waitAndExecute here is just to make sure that non-tracer mags get loaded into the player's weapon intstead of tracer mags
  [{phx_loadout_rifle_mag_tracer call phx_fnc_addGear}, 1] call CBA_fnc_waitAndExecute;
};

switch (pRole) do {
  case ROLE_AAR: {phx_loadout_aar_mag call phx_fnc_addGear};
  case ROLE_AM: {phx_loadout_am_mag call phx_fnc_addGear};
  case ROLE_AT: {
    phx_loadout_mediumantitank_mag call phx_fnc_addGear;
    if (!isNil "phx_loadout_mediumantitank_mag_1") then {
      phx_loadout_mediumantitank_mag_1 call phx_fnc_addGear;
    };
  };
  case ROLE_AAT: {phx_loadout_mediumantitank_mag call phx_fnc_addGear};
  case ROLE_RAT: {if (!isNil "phx_loadout_antitank_mag") then {phx_loadout_antitank_mag call phx_fnc_addGear}};
};

if (phx_loadout_hasUGL) then {{_x call phx_fnc_addGear} forEach phx_loadout_uglAmmo};
