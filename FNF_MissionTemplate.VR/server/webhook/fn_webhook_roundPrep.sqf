if (isNil "DiscordEmbedBuilder_fnc_buildCfg") exitWith {diag_log text "Failed to send RoundPrep webhook -- mod not loaded!"};
if (count allPlayers < 14) exitWith {diag_log text "Less than 14 players connected -- skipping RoundPrep Discord post"};

[{cba_missionTime > 300}, {
	if (!(missionNamespace getVariable ["phx_safetyEnabled", false])) exitWith {diag_log text "Safe Start already ended -- skipping RoundPrep Discord post"};

	private ["_gameMode", "_connectedPlayerCount"];
	if (isNil "phx_gameMode") then {_gameMode = "unknown"} else {_gameMode = phx_gameMode};

	_connectedPlayerCount = str(count allPlayers);

	["RoundPrep", [
		missionName,
		_gameMode,
		_connectedPlayerCount
	]] call DiscordEmbedBuilder_fnc_buildCfg;
}] call CBA_fnc_waitUntilAndExecute;

