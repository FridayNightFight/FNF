call phx_fnc_addUniform;
call phx_fnc_addItems;
call phx_fnc_addMagazines;
call phx_fnc_addWeapons;

player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
//player linkItem "ItemWatch";
player linkItem "TFAR_microdagr";

player addItem "ACE_CableTie";
player addItem "ACE_CableTie";

if (phx_loadout_unitLevel > 0) then {
  player addItem "ACE_microDAGR";
};

missionNamespace setVariable ["phx_loadoutAssigned",true];
