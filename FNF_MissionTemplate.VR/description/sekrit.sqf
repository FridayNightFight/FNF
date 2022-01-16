if !(phx_gameMode == "sustainedAssault") then {
  phx_missionTimeLimit = 50; //Mission time limit in minutes - starts after safe start ends
} else {
  phx_missionTimeLimit = 60;
};
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

#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"

phx_ui_changelogText = ([
  "NEW:",
  "  - major code refactor for a number of functions including inline documentation",
  "  - additional notifications for vetters if mission has a bad configuration",
  "",
  "  Updated Mission SQM",
  "    - migrated everything into layers for organization and better in-game management",
  "    - more descriptive commenting for new MMs",
  "  Admin Panel",
  "    - shows notification to staff when a staff action is performed",
  "    - also sends a message to Discord documenting it",
  "    - full menu where everything except game clock works",
  "    - foundation is present to migrate playersList to config instead, and allow multiple selection and feed multiple IDs to button functions",
  "    - players acted on will receive notifications informing them that they were",
  "    - admins with panel open will see results of action by any admin in their result panel, to reduce duplicate actions",
  "    - radio system now allows dynamic base channel change, completing the indfor allegiance change control in admin panel (will enter the radio freq structure of the allied side, or their own if not allied)",
  "  Sustained Assault integration",
  "    - 1 framework that works with both standard and SA mission files",
  "    - mission templates for creating more content",
  "    - Vietnam template now available, Modern coming soon",
  "    Now with:",
  "      - mobile spawn points",
  "      - better respawn handling",
  "",
  "FIXED:",
  "  - when the initial primary weapon a player was assigned at mission start did not support any available optics, the selector failed to initialize",
  "  - now delays radio assignment until core loadout is done to avoid potential issues w/ server not instantiating, plus revamp of handling",
  "  - ammo choices for OPFOR loadouts updated",
  "<br/>",
  "///////////////////////",
  "",
  "v3.1.0",
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
  " - Ghoster - Previous Mission Vetter",
  "and all of our community mission makers for creating fresh content every week!"
  "",
  "Finally, a huge thank you to previous staff:",
  " - Dingo",
  " - Firefighter",
  " - Drake",
  " - SLDream",
  " - Cullen",
  " - Pickles (Pads33)",
  " - JibStyle",
  " - Falenty",
  " - Cyrus"
] joinString "<br/>";

[phx_ui_structTextRef, "Credits", _credits] call BIS_fnc_setToPairs;
