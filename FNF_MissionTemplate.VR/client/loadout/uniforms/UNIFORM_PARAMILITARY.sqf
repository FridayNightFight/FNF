/* Paramilitary Loadout. Initial Pull Cullen 5/27/21. Submitted by Mission Team. */
phx_loadout_uniform  = SelectRandom ["rhs_uniform_TLA_1, rhs_uniform_TLA_2"]; //per req
phx_loadout_vest     = "rhsgref_chestrig"; //per req
phx_loadout_headgear = SelectRandom["H_ShemagOpen_khk", "rhsgref_M56"]; // per req

  if (phx_loudout_unitLevel > 0) then {phx_loadout_vest = "rhs_vest_commander";}; //Leadership

  if (pRole == ROLE_MK) then  {phx_loadout_unform = "rhs_uniform_TLA_2";}; //Marksman

  if (pRole == ROLE_CR) then {phx_loadout_headgear = "H_Bandanna_khk";}; // crewman

  if (pRole == ROLE_P) then {phx_loudout_headgear = "rhs_gssh18";}; // pilot

#include "base\IND_WD.sqf"