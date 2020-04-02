switch (fortifyColor) do {
  case 0: {
    [defendingSide, fortifyPoints, [
    ["Land_BagFence_01_short_green_F",2],
    ["Land_BagFence_01_long_green_F", 2],
    ["Land_BagFence_01_round_green_F", 2],
    ["Land_Plank_01_4m_F", 3],
    ["Land_Plank_01_8m_F", 5],
    ["Land_HBarrier_01_line_3_green_F",5],
    ["Land_HBarrier_01_wall_4_green_F",5],
    ["Land_HBarrier_01_wall_corner_green_F",5],
    ["Land_HBarrier_01_wall_corridor_green_F",5],
    ["Land_BagBunker_01_small_green_F",10],
    ["Land_HBarrier_01_tower_green_F",25],
    ["Land_BagBunker_01_large_green_F",25],
    ["Land_HBarrier_01_big_tower_green_F",25],
    ["Land_Cargo_Patrol_V1_F",30],
    ["Land_Bunker_01_HQ_F",55],
    ["Land_Bunker_01_big_F",55],
    ["Land_Bunker_01_tall_F",75]
    ]] call acex_fortify_fnc_registerObjects;
  };
  case 1: {
    [defendingSide, fortifyPoints, [
    ["Land_BagFence_Short_F",2],
    ["Land_BagFence_Long_F", 2],
    ["Land_BagFence_Round_F", 2],
    ["Land_Plank_01_4m_F", 3],
    ["Land_Plank_01_8m_F", 5],
    ["Land_HBarrier_3_F",5],
    ["Land_HBarrierWall4_F",5],
    ["Land_HBarrierWall_corner_F",5],
    ["Land_HBarrierWall_corridor_F",5],
    ["Land_BagBunker_Small_F",10],
    ["Land_BagBunker_Tower_F",25],
    ["Land_BagBunker_Large_F",25],
    ["Land_HBarrierTower_F",25],
    ["Land_Cargo_Patrol_V3_F",30],
    ["Land_Bunker_01_HQ_F",55],
    ["Land_Bunker_01_big_F",55],
    ["Land_Bunker_01_tall_F",75]
    ]] call acex_fortify_fnc_registerObjects;
  };
};

[{
    params ["_unit", "_object", "_cost"];
    private _return = ((typeOf _unit == "O_soldier_exp_F") || (typeOf _unit == "B_soldier_exp_F") || (typeOf _unit == "I_Soldier_exp_F"));
    _return
}] call acex_fortify_fnc_addDeployHandler;
