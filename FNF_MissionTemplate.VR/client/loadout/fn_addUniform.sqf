player forceAddUniform phx_loadout_uniform;
player addVest phx_loadout_vest;
player addBackpack phx_loadout_backpack;
player addHeadgear phx_loadout_headgear;

_giveNVG = {player linkItem phx_loadout_nvg};
switch (typeName phx_addNVG) do {
  case "BOOL": {if (phx_addNVG) then {call _giveNVG};};
  case "SIDE": {if (playerSide == phx_addNVG) then {call _giveNVG};};
  case "ARRAY": {if (playerSide in phx_addNVG) then {call _giveNVG};};
};
