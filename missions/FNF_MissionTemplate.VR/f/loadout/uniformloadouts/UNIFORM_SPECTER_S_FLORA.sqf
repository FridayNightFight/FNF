phx_loadout_uniform = "rhsgref_uniform_specter";
phx_loadout_vest = "rhs_6sh92_vog";
phx_loadout_backpack = "rhs_assault_umbts";
phx_loadout_headgear = "rhs_6b27m_green_ess";
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_gssh18";
  phx_loadout_backpack = "rhs_assault_umbts";
};
