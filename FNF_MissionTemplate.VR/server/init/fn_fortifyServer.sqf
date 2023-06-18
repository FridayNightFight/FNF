private _fortifyColor = 0; //0 = green, 1 = tan

//Automatically choose fotyify color based on terrain name
private _desert = ["Desert_E","pja319","tem_kujari","porto","intro","Shapur_BAF","takistan","Mountains_ACR","zargabad","pja310","lythium","tem_anizay","dingor"];
if (worldName in _desert) then {_fortifyColor = 1};


fnf_fortify_ModernGreen = [
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
];
fnf_fortify_ModernTan = [
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
];
fnf_fortify_NVA = [
  ["Land_Plank_01_4m_F",5],
  ["Land_Plank_01_8m_F",5],
  // ["vn_o_NVA_spiderhole_01",12], // straight cover
  // ["vn_o_NVA_spiderhole_02",12], // sloped cover
  // ["vn_o_NVA_spiderhole_03",15], // two-man
  ["Land_vn_o_bunker_01",12], // low crawl
  ["Land_vn_o_bunker_02",12], // crouch
  ["Land_vn_o_bunker_03",20], // covered
  ["Land_vn_o_shelter_05",22], // checkpoint-like
  ["Land_vn_o_platform_06",50], // raised platform
  ["Land_vn_o_tower_02",50],
  ["Land_vn_o_snipertree_02",100]
];
fnf_fortify_MACV = [
  ["Land_vn_BagFence_01_short_green_F",3],
  ["Land_vn_BagFence_01_long_green_F",4],
  ["Land_vn_BagFence_01_round_green_F",4],
  ["Land_Plank_01_4m_F",5],
  ["Land_Plank_01_8m_F",5],
  ["Land_vn_b_foxhole_01",10],
  ["Land_vn_b_mortarpit_01",15],
  ["Land_vn_BagBunker_01_small_green_F",22],
  ["Land_vn_b_trench_firing_04",22],
  ["Land_vn_b_trench_firing_01",75],
  ["Land_vn_BagBunker_01_large_green_F",50],
  ["Land_vn_pillboxbunker_01_hex_f",65],
  ["Land_vn_pillboxbunker_02_hex_f",85],
  ["Land_vn_pillboxbunker_01_big_f",100]
];



switch (fnf_fortifyStyle) do {
  case "Modern": {
    switch (_fortifyColor) do {
      case 1: {
        [fnf_defendingSide, fnf_fortifyPoints, fnf_fortify_ModernTan] call ace_fortify_fnc_registerObjects;
      };
      default {
        [fnf_defendingSide, fnf_fortifyPoints, fnf_fortify_ModernGreen] call ace_fortify_fnc_registerObjects;
      };
    };
  };
  default {
    private _set = missionNamespace getVariable format["fnf_fortify_%1", fnf_fortifyStyle];
    [fnf_defendingSide, fnf_fortifyPoints, _set] call ace_fortify_fnc_registerObjects;
  };
};
