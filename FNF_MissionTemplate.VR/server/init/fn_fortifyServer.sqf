private _fortifyColor = 0; //0 = green, 1 = tan

//Automatically choose fotyify color based on terrain name
private _desert = ["Desert_E","pja319","tem_kujari","porto","intro","Shapur_BAF","takistan","Mountains_ACR","zargabad","pja310","lythium"];
if (worldName in _desert) then {_fortifyColor = 1};

_planks = [
["Land_Plank_01_4m_F",5],
["Land_Plank_01_8m_F",5]
];

_ww2 = [
["fow_p_defenceposition_02",15],
["fow_p_logbunker02",22],
["Land_Fort_Bagfence_Bunker",30],
["Land_WW2_Bunker_Mg",50],
["fow_p_defenceposition_04",50]
];

_greenBags = [
["Land_BagFence_01_short_green_F",3],
["Land_BagFence_01_long_green_F",4],
["Land_BagFence_01_round_green_F",4]
];

_tanBags = [
["Land_BagFence_Short_F",3],
["Land_BagFence_Long_F",4],
["Land_BagFence_Round_F",4]
];

_tanBunkers = [
["Land_BagBunker_Small_F",22],
["Land_BagBunker_Large_F",50]
];
_greenBunkers = [
["Land_BagBunker_01_small_green_F",22],
["Land_BagBunker_01_large_green_F",50]
];

switch (_fortifyColor) do {
  case 0: {
    [phx_defendingSide, phx_fortifyPoints,
    _greenBags + _planks + _greenBunkers + _ww2
    ] call acex_fortify_fnc_registerObjects;
  };
  case 1: {
    [phx_defendingSide, phx_fortifyPoints, [
    _tanBags + _planks + _tanBunkers + _ww2
    ]] call acex_fortify_fnc_registerObjects;
  };
};
