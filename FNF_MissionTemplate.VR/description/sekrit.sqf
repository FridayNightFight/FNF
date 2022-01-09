phx_missionTimeLimit = 50; //Mission time limit in minutes - starts after safe start ends
phx_safeStartTime = 15; //Safestart time in minutes

phx_templateVersion = call compile preprocessFile "version.txt";

phx_ui_structTextRef = [];
phx_ui_structTextRef_staffReports = [];
phx_ui_structTextRef_AssetsBLU = [];
phx_ui_structTextRef_AssetsOPF = [];
phx_ui_structTextRef_AssetsIND = [];
phx_ui_structTextRef_AssetsOther = [];

_rules = call compile preprocessFile "description\RulesAndPolicies.txt";
[phx_ui_structTextRef, "Rules", _rules] call BIS_fnc_setToPairs;



phx_ui_changelogText = ([
  "- adds CSW configuration to diary",
  "- adds custom UI mission info panel for alive/dead player and spectators (Ctrl-J or click button while spectating)",
  "- reworks spectator init to support missionInfoPanel data",
  "- adds safe start timer (only visible while map is open during safestart)",
  "- adds Assassination game mode",
  "- CTF",
  "  - players are no longer able to pick up the flag while in a vehicle",
  "  - players may no longer get into armed vehicles while carrying the flag",
  "- Rush/Uplink",
  "  - 'side eliminated' notifications will not appear while a terminal is being hacked",
  "  - if a side was eliminated while a terminal was active, the notification will be delayed until it's paused or its time runs out",
  "- fix for safeStart leadership teleport - SLs will now be properly detected and teleported",
  "- minor loadout updates",
  "- adds debriefing text",
  "- disable ambient life for players (rabbits, snakes, etc)",
  "- set unit ranks for players based on their role (for nametag's sake and future squad (loadout ref)",
  "- adds small mission intro using textTiles",
  "- auto-selects Briefing tab of missionInfoPanel",
  "- auto turn on collision lights of aircraft and helos if the ambient light level at their position is below a certain threshold, to make them easier to find",
  "- auto disable vehicle sensors (Jets DLC, radar, etc)",
  "- blufor tracker icon configuration updated so that all sides will see Civilian unit markers",
  "- adds some cool media to the diary"
] joinString "<br/>");

phx_ui_frameworkCreditsText = ([
  "UI Notification System: Aquaman, TanKode, Lucian",
  "Map Unit Icons/Blufor Tracker: QS Icons by Quiksilver"
] joinString "<br/>");

#define COLOR2 "#FF8E38"
private _changelogStruct = format [
  "<t size='1.2' shadow='1' color='" + COLOR2 + "'>Changelog</t><br/>Template Version: %1<br/><br/>%2<br/><br/><t size='1.2' shadow='1' color='" + COLOR2 + "'>Credits</t><br/>%3",
  phx_templateVersion,
  phx_ui_changelogText,
  phx_ui_frameworkCreditsText
];
[phx_ui_structTextRef, "Framework Info", _changelogStruct] call BIS_fnc_setToPairs;




private _credits = [
  // "<t size='1.2' shadow='1' color='" + COLOR2 + "'>Credits</t>",
  "STAFF",
  "",
  "Staff Board:",
  " - Anderson",
  " - Arkor",
  " - Martin",
  "",
  "Staff Team Leads:",
  " - Indigo - Technical",
  " - Nemesis - Missions",
  " - Stracotenko - Disciplinary ",
  "",
  "Staff Team:",
  " - Mallen - Technical",
  " - Banks - Missions",
  " - Wheaton - Disciplinary",
  " - Stark - Disciplinary",
  " - Layden - Disciplinary",
  " - Muniz - Community",
  " - Dusty - Community",
  " - Fred - Community",
  " - Ceb - Community",
  "",
  "Special thanks to our Community Volunteers:",
  " - Bridges - Admin Assistance",
  " - GregLegs - Media Assistance",
  " - Tanaka - Technical Assistance",
  " - Mazz38 - Mission Vetter",
  " - Bae - Mission Vetter",
  "",
  "And a huge thank you to previous staff:",
  " - Dingo",
  " - Firefighter",
  " - Drake",
  " - SLDream",
  " - Cullen",
  " - Pickles (Pads33)",
  " - JibStyle",
  " - Falenty",
  " - Cyrus",
  " - Ghoster"
] joinString "<br/>";

[phx_ui_structTextRef, "Credits", _credits] call BIS_fnc_setToPairs;
