if (isNil "DiscordEmbedBuilder_fnc_buildCfg") exitWith {diag_log text "Failed to send RoundPrep webhook -- mod not loaded!"};

if (isNil "cba_missionTime") then {
	waitUntil {uiSleep 5; time > 300};
} else {
	waitUntil {uiSleep 5; cba_missionTime > 300};
};

private ["_gameMode", "_connectedPlayerCount"];
if (isNil "phx_gameMode") then {_gameMode = "unknown"} else {_gameMode = phx_gameMode};

_connectedPlayerCount = str(count allPlayers);

["RoundPrep", [
	missionName,
	_gameMode,
	_connectedPlayerCount
]] call DiscordEmbedBuilder_fnc_buildCfg;
