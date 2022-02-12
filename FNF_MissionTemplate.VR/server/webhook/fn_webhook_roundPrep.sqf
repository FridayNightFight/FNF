if !(isClass (configFile >> "CfgPatches" >>  "CAU_DiscordEmbedBuilder")) exitWith {diag_log text "Failed to send RoundPrep webhook -- mod not loaded!"};
if !(isDedicated) exitWith {diag_log text "Not running on FNF Dedicated -- skipping RoundPrep Discord post"};
if (count allPlayers < 14) exitWith {diag_log text "Less than 14 players connected -- skipping RoundPrep Discord post"};

[{time > 300}, {
  if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {diag_log text "Safe Start already ended -- skipping RoundPrep Discord post"};

  private ["_gameMode", "_connectedPlayerCount"];
  if (isNil "fnf_gameMode") then {_gameMode = "unknown"} else {_gameMode = fnf_gameMode};

  _connectedPlayerCount = str(count allPlayers);

  ["RoundPrep", [
    missionName,
    _gameMode,
    _connectedPlayerCount
  ]] call DiscordEmbedBuilder_fnc_buildCfg;
}] call CBA_fnc_waitUntilAndExecute;

