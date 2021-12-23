phx_missionTimeLimit = 50; //Mission time limit in minutes - starts after safe start ends
phx_safeStartTime = 15; //Safestart time in minutes

phx_templateVersion = call compile preprocessFile "version.txt";

phx_ui_structTextRef = [];
phx_ui_structTextRef_AssetsBLU = [];
phx_ui_structTextRef_AssetsOPF = [];
phx_ui_structTextRef_AssetsIND = [];
phx_ui_structTextRef_AssetsOther = [];

_rules = call compile preprocessFile "description\RulesAndPolicies.txt";
[phx_ui_structTextRef, "Rules", _rules] call BIS_fnc_setToPairs;



phx_ui_changelogText = ([
  "- Briefing fixes",
  "- Restore UGL flares in specific loadouts",
  "- Invincibility at game end"
] joinString "<br/>");

#define COLOR2 "#FF8E38"
private _changelogStruct = format [
  "<t size='1.2' shadow='1' color='" + COLOR2 + "'>Changelog</t><br/>Template Version: %1<br/>%2",
  phx_templateVersion,
  phx_ui_changelogText
];
[phx_ui_structTextRef, "Changelog", _changelogStruct] call BIS_fnc_setToPairs;




private _credits = [
  // "<t size='1.2' shadow='1' color='" + COLOR2 + "'>Credits</t>",
  "STAFF",
  "  Missions Team",
  "    - Nemesis",
  "    - Arkor",
  "",
  "  Technical Team",
  "    - IndigoFox",
  "    - Mallen",
  "    - Martin",
  "",
  "  Community/Media Team",
  "    - Anderson",
  "    - Ceb.Cin",
  "    - Dusty",
  "    - Fred",
  "",
  "  Disciplinary Team",
  "    - Stracotenko",
  "    - Banks",
  "    - Layden",
  "    - Muniz",
  "    - Stark",
  "    - Wheaton",
  "",
  "Special thanks to our Community Volunteers:",
  "  - Bridges",
  "  - GregLegs",
  "  - Tanaka",
  "",
  "And a huge thank you to previous staff:",
  "  - Cullen",
  "  - Cyrus",
  "  - Dingo",
  "  - Drake",
  "  - Falenty",
  "  - Firefighter",
  "  - JibStyle",
  "  - Pickles (Pads33)",
  "  - SLDream"
] joinString "<br/>";

[phx_ui_structTextRef, "Credits", _credits] call BIS_fnc_setToPairs;
