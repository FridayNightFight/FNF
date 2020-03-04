// Make sure the player initializes properly
if (hasInterface && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player};
};

ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];
PHX_Diary = player createDiarySubject ["PHX_Diary", "Misc Info"];
Assets_Diary = player createDiarySubject ["PHX_Assets", "Assets"];

waitUntil {!isNil "opforPointPool"};
waitUntil {!isNil "bluforPointPool"};
waitUntil {!isNil "indforPointPool"};
_opforAssetsString = "<font size='18'>OPFOR Assets:</font><br/>";
_bluforAssetsString = "<font size='18'>BLUFOR Assets:</font><br/>";
_indforAssetsString = "<font size='18'>INDFOR Assets:</font><br/>";
{
  _opforAssetsString = _opforAssetsString + getText (configFile >> "cfgVehicles" >> (_x select 0) >> "displayName") + " - " + str (_x select 1) + "<br/>";
} forEach opforAssetList;
{
  _bluforAssetsString = _bluforAssetsString + getText (configFile >> "cfgVehicles" >> (_x select 0) >> "displayName") + " - " + str (_x select 1) + "<br/>";
} forEach bluforAssetList;
{
  _indforAssetsString = _indforAssetsString + getText (configFile >> "cfgVehicles" >> (_x select 0) >> "displayName") + " - " + str (_x select 1) + "<br/>";
} forEach indforAssetList;

player createDiaryRecord ["PHX_Assets", ["Assets", "NOTE: These are the assets available to spawn.<br/>ASSET_NAME - POINTS_TO_SPAWN<br/><br/>" +
format ["OPFOR Points: %1", opforPointPool] + "<br/>" + format ["BLUFOR Points: %1", bluforPointPool] + "<br/>" + format ["INDFOR Points: %1", indforPointPool] + "<br/><br/>" +
_opforAssetsString + "<br/><br/>" +
_bluforAssetsString + "<br/><br/>" +
_indforAssetsString
]];


// The following block of code executes only if the player is the current host
if (isMultiplayer) then {
    if (serverCommandAvailable "#kick") then {
        #include "f\briefing\f_briefing_admin.sqf"
    };
} else {
    #include "f\briefing\f_briefing_admin.sqf"
};
