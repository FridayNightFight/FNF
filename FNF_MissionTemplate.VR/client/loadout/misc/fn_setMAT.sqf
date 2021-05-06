/*Sets the MAT weapon and ammo class*/

private "_at";

switch (playerSide) do {
  case east: {_at = phx_redAT};
  case west: {_at = phx_bluAT};
  case independent: {_at = phx_grnAT};
};

phx_loadout_mediumantitank_weapon = _at;
phx_loadout_mediumantitank_optic = "";
phx_loadout_mediumantitank_mag_1 = "";

switch (phx_loadout_mediumantitank_weapon) do {
  case "rhs_weap_maaws": {
    phx_loadout_mediumantitank_optic = "rhs_optic_maaws";
    phx_loadout_mediumantitank_mag = "rhs_mag_maaws_HEAT:2";
  };
  case "launch_RPG32_green_F": {
    phx_loadout_mediumantitank_mag = "RPG32_F:2";
  };
  case "rhs_weap_rpg7": {
    phx_loadout_mediumantitank_optic = "rhs_acc_pgo7v3";
    phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VL_mag:4";
    phx_loadout_mediumantitank_mag_1 = "rhs_rpg7_PG7VR_mag:2";
  };
  case "launch_I_Titan_short_F": {
    phx_loadout_mediumantitank_mag = "Titan_AT:2";
  };
  case "rhs_weap_fgm148": {
    phx_loadout_mediumantitank_mag = "rhs_fgm148_magazine_AT";
  };
  case "ACE_launch_NLAW_ready_F": {
    phx_loadout_mediumantitank_mag = "NLAW_F";
    if (pRole == ROLE_AAT) then {
      phx_loadout_mediumantitank_mag = "";
    };
  };
  case "launch_O_Vorona_green_F": {
    phx_loadout_mediumantitank_mag = "Vorona_HEAT:2";
  };
  case "rhs_weap_fim92": {
    phx_loadout_mediumantitank_mag = "rhs_fim92_mag";
  };
  case "rhs_weap_igla": {
    phx_loadout_mediumantitank_mag = "rhs_mag_9k38_rocket";
  };
};
