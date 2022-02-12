if !(isClass (configFile >> "CfgPatches" >>  "CAU_DiscordEmbedBuilder")) exitWith {diag_log text "Failed to send RoundEnd webhook -- mod not loaded!"};
if !(isDedicated) exitWith {diag_log text "Not running on FNF Dedicated -- skipping RoundEnd Discord post"};
if (count allPlayers < 14) exitWith {diag_log text "Less than 14 players connected -- skipping RoundEnd Discord post"};

params ["_endMessage"];

private [
  "_gameMode",
  "_connectedPlayerCount",
  "_missionDuration",
  "_bluPlayers",
  "_opfPlayers",
  "_indPlayers"
];

if (isNil "fnf_gameMode") then {_gameMode = "unknown"} else {_gameMode = fnf_gameMode};

_connectedPlayerCount = str(count allPlayers);

// Calculate mission duration for display
_durationSeconds = ceil(cba_missionTime);
_durationHours = floor (_durationSeconds / 3600);
_durationHoursRem = floor(_durationSeconds % 3600);
_durationMins = floor(_durationHoursRem / 60);
_durationMinsRem = floor(_durationHoursRem % 60);
_durationSecs = _durationMinsRem;

if (count str (_durationHours) == 1) then {
_durationHours = "0" + str(_durationHours);
};
if (count str (_durationMins) == 1) then {
_durationMins = "0" + str(_durationMins);
};
if (count str (_durationSecs) == 1) then {
_durationSecs = "0" + str(_durationSecs);
};

_missionDuration = format["%1:%2:%3", _durationHours, _durationMins, _durationSecs];

_fnc_doCount = {
  params [
    ["_unit", objNull],
    ["_side", sideEmpty]
  ];
  if (isNull _unit || _side isEqualTo sideEmpty) exitWith {false};

  (
    side (group _unit) isEqualTo _side &&
    alive _unit &&
    !(isObjectHidden _unit) &&
    [_x] call ace_common_fnc_isAwake
  )
};


private ["_bluPlayers", "_opfPlayers", "_indPlayers"];
if (playableSlotsNumber west == 0) then {
  _bluPlayers = 0;
} else {
  _bluPlayers = str(count(allPlayers select {[_x, west] call _fnc_doCount}));
};
if (playableSlotsNumber east == 0) then {
  _opfPlayers = 0;
} else {
  _opfPlayers = str(count(allPlayers select {[_x, east] call _fnc_doCount}));
};
if (playableSlotsNumber independent == 0) then {
  _indPlayers = 0;
} else {
  _indPlayers = str(count(allPlayers select {[_x, independent] call _fnc_doCount}));
};


["RoundEnd", [
  _endMessage,
  missionName,
  _gameMode,
  _connectedPlayerCount,
  _missionDuration,
  _bluPlayers,
  _opfPlayers,
  _indPlayers
]] call DiscordEmbedBuilder_fnc_buildCfg;
