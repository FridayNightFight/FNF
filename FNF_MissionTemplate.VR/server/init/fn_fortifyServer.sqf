private _fortifyColor = 0; //0 = green, 1 = tan

//Automatically choose fotyify color based on terrain name
private _desert = ["Desert_E","pja319","tem_kujari","porto","intro","Shapur_BAF","takistan","Mountains_ACR","zargabad","pja310","lythium","tem_anizay","dingor"];
if (worldName in _desert) then {_fortifyColor = 1};

switch (_fortifyColor) do {
  case 0: {
    [phx_defendingSide, phx_fortifyPoints, [
    ["Land_BagFence_01_short_green_F",3],
    ["Land_BagFence_01_long_green_F",4],
    ["Land_BagFence_01_round_green_F",4],
    ["Land_Plank_01_4m_F",5],
    ["Land_Plank_01_8m_F",5],
    ["Land_HBarrier_01_wall_4_green_F",12],
    ["Land_HBarrier_01_wall_corner_green_F",12],
    ["Land_HBarrier_01_wall_6_green_F",18],
    ["Land_BagBunker_01_small_green_F",22],
    ["Land_HBarrier_01_tower_green_F",35],
    ["Land_BagBunker_01_large_green_F",50],
    ["Land_Bunker_01_small_F",75],
    ["Land_Bunker_01_big_F",100],
    ["Land_Bunker_01_HQ_F",100],
    ["Land_Bunker_01_tall_F",130]
    ]] call acex_fortify_fnc_registerObjects;
  };
  case 1: {
    [phx_defendingSide, phx_fortifyPoints, [
    ["Land_BagFence_Short_F",3],
    ["Land_BagFence_Long_F",4],
    ["Land_BagFence_Round_F",4],
    ["Land_Plank_01_4m_F",5],
    ["Land_Plank_01_8m_F",5],
    ["Land_HBarrierWall4_F",12],
    ["Land_HBarrierWall_corner_F",12],
    ["Land_HBarrierWall6_F",18],
    ["Land_BagBunker_Small_F",22],
    ["Land_BagBunker_Tower_F",35],
    ["Land_BagBunker_Large_F",50],
    ["Land_Bunker_01_small_F",75],
    ["Land_Bunker_01_big_F",100],
    ["Land_Bunker_01_HQ_F",100],
    ["Land_Bunker_01_tall_F",130]
    ]] call acex_fortify_fnc_registerObjects;
  };
};
