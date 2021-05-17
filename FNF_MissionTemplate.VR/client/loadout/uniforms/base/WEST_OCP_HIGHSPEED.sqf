phx_loadout_backpack = "rhsusf_assault_eagleaiii_ocp";
phx_loadout_facewear = "rhsusf_oakley_goggles_clr"; // added ballistic goggles because highspeed

if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsusf_spcs_ocp_medic"; //OCP medic vest added per req
};
if (pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_vest = "rhsusf_spcs_ocp_saw";
};
if (pRole == ROLE_AAR || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "rhsusf_hgu56p_visor_mask_skull";
  phx_loadout_vest = "rhsusf_spcs_ocp";
  phx_loadout_facewear = ""; //clean facewear because helmet
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhsusf_cvc_green_alt_helmet";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhsusf_spcs_ocp_squadleader";
};

/* Made some edits in the spirit of the requester's request, added role specific vests because muh milsim. If Team wants I can create desert/marpat equivalent base for "highShpeeeed" - cullen.