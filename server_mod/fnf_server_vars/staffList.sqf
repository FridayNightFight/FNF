_staffArr = [
	["76561198061743924",["Mallen","<@262568622126399488>"]],
	["76561198066159247",["Kerey","<@175305296628023296>"]],
	["76561198015130214",["Lurch","<@190285186641035267>"]],
	["76561197960285643",["Nemesis","<@203887048841625601>"]],
	["76561198026514413",["Oliver","<@168788134786629632>"]]
];

_staffHash = createHashMapFromArray _staffArr;
missionNamespace setVariable ["fnf_staffInfo", _staffHash, true];
