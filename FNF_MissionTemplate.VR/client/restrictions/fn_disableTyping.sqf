/*
Disables typing in chat if player is not staff
*/

_display = _this;

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
  "76561198066744977", //layden
  "76561198043851617" // schmidt
];

if !((getPlayerUID player) in _ids) then {
  (findDisplay _display) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
};

if ((getPlayerUID player) in _ids) then {
  0 enableChannel true;
} else {
  0 enableChannel false;
};
