//Backpack
if (!phx_loadout_backpack_lock) then {
  phx_loadout_backpack = "rhs_assault_umbts";

  if (pRole == ROLE_CLS) then {
    phx_loadout_backpack = "rhs_medic_bag";
  };
  if (pRole == ROLE_AAR || pRole == ROLE_AM || pRole == ROLE_AAT) then {
    phx_loadout_backpack = "B_Carryall_oli";
  };
  if (pRole == ROLE_CE) then {
    phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
  };
};

//Headgear
if (!phx_loadout_headgear_lock) then {
  if (pRole == ROLE_P) then {
    phx_loadout_headgear = "H_PilotHelmetHeli_O";
  };
  if (pRole == ROLE_CR) then {
    phx_loadout_headgear = "rhs_tsh4";
  };
};

//Vest
if (!phx_loadout_vest_lock) then {
  if (pRole == ROLE_P) then {
    phx_loadout_vest = "V_TacVest_oli";
  };
};
