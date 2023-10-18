/*
	Author: Mallen

	Description:
		Sets up the Fortify system and ensures players with no fortify tool at start do not have the ability to fortify

	Parameter(s):
		0: MODULE -  The FNF init module

	Returns:
		None
*/

params["_module"];

if (!isServer) exitWith {};

_fortifyColour = _module getVariable ["fnf_fortifyColour", "Green"];
_fortifyPoints = _module getVariable ["fnf_fortifyPoints", 100];

//all categories are defined in description
_ModernGreen = [
  ["Land_BagFence_01_short_green_F",3,"fnf_fortify_sandbags"],
  ["Land_BagFence_01_long_green_F",4,"fnf_fortify_sandbags"],
  ["Land_BagFence_01_round_green_F",4,"fnf_fortify_sandbags"],
  ["Land_Plank_01_4m_F",5,"fnf_fortify_pOW"],
  ["Land_Plank_01_8m_F",5,"fnf_fortify_pOW"],
  ["Land_HBarrier_01_wall_4_green_F",12,"fnf_fortify_hBarriers"],
  ["Land_HBarrier_01_wall_corner_green_F",12,"fnf_fortify_hBarriers"],
  ["Land_HBarrier_01_wall_6_green_F",18,"fnf_fortify_hBarriers"],
  ["Land_BagBunker_01_small_green_F",22,"fnf_fortify_bunkersHM"],
  ["Land_HBarrier_01_tower_green_F",35,"fnf_fortify_bunkersHM"],
  ["Land_BagBunker_01_large_green_F",50,"fnf_fortify_bunkersHM"],
  ["Land_Bunker_01_small_F",75,"fnf_fortify_bunkersCNSRT"],
  ["Land_Bunker_01_big_F",100,"fnf_fortify_bunkersCNSRT"],
  ["Land_Bunker_01_HQ_F",100,"fnf_fortify_bunkersCNSRT"],
  ["Land_Bunker_01_tall_F",130,"fnf_fortify_bunkersCNSRT"]
];

_ModernTan = [
  ["Land_BagFence_Short_F",3,"fnf_fortify_sandbags"],
  ["Land_BagFence_Long_F",4,"fnf_fortify_sandbags"],
  ["Land_BagFence_Round_F",4,"fnf_fortify_sandbags"],
  ["Land_Plank_01_4m_F",5,"fnf_fortify_pOW"],
  ["Land_Plank_01_8m_F",5,"fnf_fortify_pOW"],
  ["Land_HBarrierWall4_F",12,"fnf_fortify_hBarriers"],
  ["Land_HBarrierWall_corner_F",12,"fnf_fortify_hBarriers"],
  ["Land_HBarrierWall6_F",18,"fnf_fortify_hBarriers"],
  ["Land_BagBunker_Small_F",22,"fnf_fortify_bunkersHM"],
  ["Land_BagBunker_Tower_F",35,"fnf_fortify_bunkersHM"],
  ["Land_BagBunker_Large_F",50,"fnf_fortify_bunkersHM"],
  ["Land_Bunker_01_small_F",75,"fnf_fortify_bunkersCNSRT"],
  ["Land_Bunker_01_big_F",100,"fnf_fortify_bunkersCNSRT"],
  ["Land_Bunker_01_HQ_F",100,"fnf_fortify_bunkersCNSRT"],
  ["Land_Bunker_01_tall_F",130,"fnf_fortify_bunkersCNSRT"]
];

if (_fortifyColour == "Green") then
{
  [west, _fortifyPoints, _ModernGreen] call ace_fortify_fnc_registerObjects;
  [east, _fortifyPoints, _ModernGreen] call ace_fortify_fnc_registerObjects;
  [independent, _fortifyPoints, _ModernGreen] call ace_fortify_fnc_registerObjects;
} else {
  [west, _fortifyPoints, _ModernTan] call ace_fortify_fnc_registerObjects;
  [east, _fortifyPoints, _ModernTan] call ace_fortify_fnc_registerObjects;
  [independent, _fortifyPoints, _ModernTan] call ace_fortify_fnc_registerObjects;
};
