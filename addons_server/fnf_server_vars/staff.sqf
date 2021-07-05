_staffArr = [
	["76561197960285643",["Nemesis","Missions Team Lead"]],
	["76561197961336958",["Arkor","Missions Team"]],
	["76561197967346068",["Cullen","Technical Team"]],
	["76561197969316760",["Ceb","Media Team"]],
	["76561197977759652",["Drake","Moderation Team"]],
	["76561197989932191",["Anderson","Community Team/Host"]],
	["76561197991996737",["IndigoFox","Technical Team Lead"]],
	["76561198011678508",["Muniz","Treasurer"]],
	["76561198043851617",["Schmidt","Moderation Team"]],
	["76561198046071194",["Wheaton","Disciplinary Team"]],
	["76561198046962658",["Martin","Technical Team"]],
	["76561198058373929",["Firefighter","Moderation Team Lead"]],
	["76561198060054975",["Falenty","Moderation Team"]],
	["76561198061743924",["Mallen","Technical Team"]],
	["76561198066744977",["Layden","Moderation Team"]],
	["76561198068436818",["Bridges","Technical Team"]],
	["76561198097983515",["SLDream","Disciplinary Team"]],
	["76561198118254864",["Fred","Moderation Team"]],
	["76561198136175919",["Stracotenko","Disciplinary Team Lead"]],
	["76561198142848471",["Dingo","Community Team/Host"]],
	["76561198144278271",["Pickles","Community Team"]],
	["76561198839019295",["Dusty","Community Team"]]
];

_staffHash = createHashMapFromArray _staffArr;
missionNamespace setVariable ["fnf_staffInfo", _staffHash, true];
