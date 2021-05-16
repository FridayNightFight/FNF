player forceAddUniform phx_loadout_uniform;
player addVest phx_loadout_vest;
player addBackpack phx_loadout_backpack;
player addHeadgear phx_loadout_headgear;
removeGoggles player;

//Remove the radio that is created in some backpacks
[{"ItemRadio" in items player},{player removeItem "ItemRadio"}, [], 5] call CBA_fnc_waitUntilAndExecute;
