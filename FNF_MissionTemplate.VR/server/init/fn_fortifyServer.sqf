_fortifyColor = 0; //0 = green, 1 = tan
_world = worldName;
{
  if (_x == _world) then {_fortifyColor = 1};
} forEach ["Desert_E","pja319","tem_kujari","porto","intro","Shapur_BAF","takistan","Mountains_ACR","torabora","zargabad"];

switch (_fortifyColor) do {
  case 0: {
    [phx_defendingSide, phx_fortifyPoints, [
    ["Land_BagFence_01_short_green_F",1],
    ["Land_Plank_01_4m_F", 2],
    ["Land_Plank_01_8m_F", 2],
    ["Land_BagFence_01_long_green_F", 2],
    ["Land_BagFence_01_round_green_F", 2],
    ["Land_HBarrier_01_wall_4_green_F",4],
    ["Land_HBarrier_01_wall_corner_green_F",4],
    ["Land_HBarrier_01_wall_6_green_F",6],
    ["Land_BagBunker_01_small_green_F",9],
    ["Land_HBarrier_01_tower_green_F",25],
    ["Land_BagBunker_01_large_green_F",30],
    ["Land_Bunker_01_small_F",50],
    ["Land_Bunker_01_big_F",80],
    ["Land_Bunker_01_HQ_F",80],
    ["Land_Bunker_01_tall_F",130]
    ]] call acex_fortify_fnc_registerObjects;
  };
  case 1: {
    [phx_defendingSide, phx_fortifyPoints, [
    ["Land_BagFence_Short_F",1],
    ["Land_Plank_01_4m_F", 2],
    ["Land_Plank_01_8m_F", 2],
    ["Land_BagFence_Long_F", 2],
    ["Land_BagFence_Round_F", 2],
    ["Land_HBarrierWall4_F",4],
    ["Land_HBarrierWall_corner_F",4],
    ["Land_HBarrierWall6_F",6],
    ["Land_BagBunker_Small_F",9],
    ["Land_BagBunker_Tower_F",25],
    ["Land_BagBunker_Large_F",30],
    ["Land_Bunker_01_small_F",50],
    ["Land_Bunker_01_big_F",80],
    ["Land_Bunker_01_HQ_F",80],
    ["Land_Bunker_01_tall_F",130]
    ]] call acex_fortify_fnc_registerObjects;
  };
};
