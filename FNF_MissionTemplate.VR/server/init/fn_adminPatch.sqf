/*
 * Author: tanaKa and Indigo
 * Adds patches on admins for FNF
 *
 * Params: 
 * N/A
 *
 * Return value:
 * N/A
 *
 * Usage: 
 * call PHX_fnc_adminPatch
 *
 * Public: no
 */

_ids = [
  "76561198011678508", // muniz
  "76561197961336958", // arkor
  "76561197991996737", // indigo
  "76561198142848471", // dingo
  "76561198046071194", // wheaton
  "76561198046962658", // mart
  "76561197989932191", // anderson
  "76561198058373929", // fire
  "76561198136175919", // strac
  "76561198068436818", // bridges
  "76561197960285643", // nemesis
  "76561197977759652", // drake
  "76561198097983515", // dream
  "76561198061743924", // mallen
  "76561197967346068", // cullen
  "76561198144278271", // pads/pickles
  "76561198060054975", // falenty
  "76561198118254864", // fred
  "76561198839019295", // dusty
  "76561198054866659", // rory
  "76561197986258732"  // tanaKa
];

if (isServer) then {
	{
		if ((getPlayerUID _x) in _ids) then {
			[_x, "FNFPatchAdmin"] call bis_fnc_setUnitInsignia;
			"[FNF Patches] Assigned admin patch" remoteExec ["systemChat", _x];
		};
	} forEach AllPlayers;
};
