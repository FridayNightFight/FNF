//Removals
removeAllItems player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
{
  player unassignItem _x;
  player removeItem _x;
} forEach ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP"];
