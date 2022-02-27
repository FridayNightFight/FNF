if !(fnf_gameMode == "sustainedAssault") then {
  fnf_missionTimeLimit = 50; //Mission time limit in minutes - starts after safe start ends
} else {
  fnf_missionTimeLimit = 60;
};
fnf_safeStartTime = 15; //Safestart time in minutes

if (fileExists "version.txt") then {
  fnf_templateVersion = call compile preprocessFile "version.txt";
} else {
  fnf_templateVersion = "Unknown";
};

fnf_ui_structTextRef = [];
fnf_ui_structTextRef_staffReports = [];
fnf_ui_structTextRef_AssetsBLU = [];
fnf_ui_structTextRef_AssetsOPF = [];
fnf_ui_structTextRef_AssetsIND = [];
fnf_ui_structTextRef_AssetsOther = [];


_rules = "Framework changelog file could not be loaded.";
if (fileExists "description\RulesAndPolicies.txt") then {
  _rules = (loadFile "description\RulesAndPolicies.txt") regexReplace ["\n", "<br/>"];
};
[fnf_ui_structTextRef, "Rules", _rules] call BIS_fnc_setToPairs;

#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"


fnf_ui_frameworkCreditsText = "Credits file could not be loaded.";
if (fileExists "description\credits.txt") then {
  fnf_ui_frameworkCreditsText = (loadFile "description\credits.txt") regexReplace ["\n", "<br/>"];
};

fnf_ui_changelogText = "Framework changelog file could not be loaded.";
if (fileExists "description\changelog.txt") then {
  fnf_ui_changelogText = (loadFile "description\changelog.txt") regexReplace ["\n", "<br/>"];
};

private _changelogStruct = format [
  "<t size='1.2' shadow='1' color='" + COLOR2 + "'>Changelog</t><br/>Template Version: %1<br/><br/>%2<br/><br/><t size='1.2' shadow='1' color='" + COLOR2 + "'>Credits</t><br/>%3",
  fnf_templateVersion,
  fnf_ui_changelogText
];
[fnf_ui_structTextRef, "Framework Info", _changelogStruct] call BIS_fnc_setToPairs;



fnf_ui_gameMechanicsDiary = [
  ["Rearm/Repair", (
    "<font size='14' shadow='1' color='" + COLOR3 + "'>Rearm/Repair</font><br/>" +
    "
- Rearm is possible via rearm trucks<br/>
- ACE Interact with the truck and, provided your vehicle is close enough and is not already full on ammo, you will have the option to rearm it to full<br/>
- ACE Interact with a plane while a rearm truck is nearby, and you will be able to reconfigure its pylons<br/>
- You will only be able to select from the initial weapons it was given by the mission maker<br/>
<br/><br/>
- Only Engineers can repair all individual components of a vehicle, except for wheels which anyone can do<br/>
- They will not need a toolkit to do so<br/>
- Having an ACE Repair Facility placed will make anyone into an engineer, so they can park beside it and repair<br/>
- Full Repairs, which is a main interaction > Full Repair option, will heal the whole vehicle at once (30s) and can only be initiated near a Repair Facility (by anyone, since the repair facility boosts them to Engineer)<br/>
"
  )],
  ["Zone Protection/Restrictions", (
    "<font size='14' shadow='1' color='" + COLOR3 + "'>Zone Safety and Restrictions</font><br/>" +
    "
- hashed markers on the map indicate safe zones, colored to reflect their owner<br/>
- players are invincible and have access to the FNF Gear Selector while inside of their own safe zones<br/>
- players are restricted from entering enemy safe zones<br/><br/>

- during safe start, players may teleport to their forward zones, but must stay in main base or forward zone
"
  )],
  ["Teleport Flagpoles", (
    "<font size='14' shadow='1' color='" + COLOR3 + "'>Teleport Flagpoles</font><br/>" +
    "
- a teleportation flagpole is present within each main base zone<br/>
- this is the respawn point for each side -- you'll go here if you die<br/><br/>

- at mission start, players can use the basic rallypoint teleport at this flag via ACE-interact<br/>
- this rallypoint teleport can take someone to their forward zone as well as back to base<br/><br/>

- when safe start ends, additional teleport options may become available<br/>
  - Mobile Spawn Point (a movable, destructible vehicle that will respawn itself when destroyed)<br/>
  - in some cases, an airfield teleport where planes and helicopters may be kept<br/><br/>
"
  )],
  ["Respawn System", (
    "<font size='14' shadow='1' color='" + COLOR3 + "'>Respawn System</font><br/>" +
    "
- each side starts with a set number of tickets
- a side's tickets will decrease by 1 when a player on that side dies
- when one side reaches 0, the opposing side will win
"
  )]
];
reverse fnf_ui_gameMechanicsDiary;

fnf_ui_gameMechanicsText = (
  "<t size='1.4' shadow='1' color='" + COLOR2 + "'>Game Mechanics</t><br/>" +
  "<t size='1.2' shadow='1' color='" + COLOR3 + "'>Rearm/Repair</t><br/>" +
  "
- Rearm is possible via rearm trucks<br/>
- ACE Interact with the truck and, provided your vehicle is close enough and is not already full on ammo, you will have the option to rearm it to full<br/>
- ACE Interact with a plane while a rearm truck is nearby, and you will be able to reconfigure its pylons<br/>
- You will only be able to select from the initial weapons it was given by the mission maker<br/>
<br/><br/>
- Only Engineers can repair all individual components of a vehicle, except for wheels which anyone can do<br/>
- They will not need a toolkit to do so<br/>
- Having an ACE Repair Facility placed will make anyone into an engineer, so they can park beside it and repair<br/>
- Full Repairs, which is a main interaction > Full Repair option, will heal the whole vehicle at once (30s) and can only be initiated near a Repair Facility (by anyone, since the repair facility boosts them to Engineer)<br/>
<br/><br/>
" +
  "<t size='1.2' shadow='1' color='" + COLOR3 + "'>Zone Safety and Restrictions</t><br/>" +
  "
- hashed markers on the map indicate safe zones, colored to reflect their owner<br/>
- players are invincible and have access to the FNF Gear Selector while inside of their own safe zones<br/>
- players are restricted from entering enemy safe zones<br/><br/>

- during safe start, players may teleport to their forward zones, but must stay in main base or forward zone
<br/><br/>
" +
"<t size='1.2' shadow='1' color='" + COLOR3 + "'>Teleport Flagpoles</t><br/>" +
  "
- a teleportation flagpole is present within each main base zone<br/>
- this is the respawn point for each side -- you'll go here if you die<br/><br/>

- at mission start, players can use the basic rallypoint teleport at this flag via ACE-interact<br/>
- this rallypoint teleport can take someone to their forward zone as well as back to base<br/><br/>

- when safe start ends, additional teleport options may become available<br/>
  - Mobile Spawn Point (a movable, destructible vehicle that will respawn itself when destroyed)<br/>
  - in some cases, an airfield teleport where planes and helicopters may be kept<br/><br/>
" +
"<font size='14' shadow='1' color='" + COLOR3 + "'>Respawn System</font><br/>" +
  "
- each side starts with a set number of tickets
- a side's tickets will decrease by 1 when a player on that side dies
- when one side reaches 0, the opposing side will win
"
);

[fnf_ui_structTextRef, "Game Mechanics", fnf_ui_gameMechanicsText] call BIS_fnc_setToPairs;


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
  "and all of our community mission makers for creating fresh content every week!",
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

[fnf_ui_structTextRef, "Credits", _credits] call BIS_fnc_setToPairs;
