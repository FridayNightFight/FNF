/*Sets the MAT weapon and ammo class*/

private ["_at", "_magCount"];

switch (playerSide) do {
  case east: {
    if (["Bravo", roleDescription player] call BIS_fnc_inString) then {
      _at = phx_redAT_Bravo;
      _magCount = phx_redAT_Bravo_count;
    };
    if (["Delta", roleDescription player] call BIS_fnc_inString) then {
      _at = phx_redAT_Delta;
      _magCount = phx_redAT_Bravo_count;
    };
  };
  case west: {
    if (["Bravo", roleDescription player] call BIS_fnc_inString) then {
      _at = phx_bluAT_Bravo;
      _magCount = phx_bluAT_Bravo_count;
    };
    if (["Delta", roleDescription player] call BIS_fnc_inString) then {
      _at = phx_bluAT_Delta;
      _magCount = phx_bluAT_Delta_count;
    };
  };
  case independent: {
    if (["Bravo", roleDescription player] call BIS_fnc_inString) then {
      _at = phx_grnAT_Bravo;
      _magCount = phx_grnAT_Bravo_count;
    };
    if (["Delta", roleDescription player] call BIS_fnc_inString) then {
      _at = phx_grnAT_Delta;
      _magCount = phx_grnAT_Delta_count;
    };
  };
};

phx_loadout_mediumantitank_weapon = _at;
phx_loadout_mediumantitank_optic = "";
phx_loadout_mediumantitank_mag_1 = "";

switch (phx_loadout_mediumantitank_weapon) do {
  case "rhs_weap_maaws": {
    phx_loadout_mediumantitank_optic = "rhs_optic_maaws";
    phx_loadout_mediumantitank_mag = format["rhs_mag_maaws_HEAT:%1", _magCount];
  };
  case "launch_RPG32_green_F": {
    phx_loadout_mediumantitank_mag = format["RPG32_F:%1", _magCount];
  };
  case "rhs_weap_rpg7": {
    phx_loadout_mediumantitank_optic = "rhs_acc_pgo7v3";
    phx_loadout_mediumantitank_mag = format["rhs_rpg7_PG7VL_mag:%1", _magCount];
    phx_loadout_mediumantitank_mag_1 = format["rhs_rpg7_PG7VR_mag:%1", ceil(_magCount / 2)];
  };
  case "launch_I_Titan_short_F": {
    phx_loadout_mediumantitank_mag = format["Titan_AT:%1", _magCount];
  };
  case "rhs_weap_fgm148": {
    phx_loadout_mediumantitank_mag = format["rhs_fgm148_magazine_AT:%1", _magCount];
  };
  case "ACE_launch_NLAW_ready_F": {
    phx_loadout_mediumantitank_mag = "NLAW_F";
    if (pRole == ROLE_AAT) then {
      phx_loadout_mediumantitank_mag = "";
    };
  };
  case "launch_O_Vorona_green_F": {
    phx_loadout_mediumantitank_mag = format["Vorona_HEAT:%1", _magCount];
  };
  case "rhs_weap_fim92": {
    phx_loadout_mediumantitank_mag = format["rhs_fim92_mag:%1", _magCount];
  };
  case "rhs_weap_igla": {
    phx_loadout_mediumantitank_mag = format["rhs_mag_9k38_rocket:%1", _magCount];
  };
};
