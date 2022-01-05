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

if (isNil "phx_gameMode") then {_gameMode = "unknown"} else {_gameMode = phx_gameMode};

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

_bluPlayers = if (playableSlotsNumber west == 0) then {0} else {
  playersNumber west;
};
_opfPlayers = if (playableSlotsNumber east == 0) then {0} else {
  playersNumber east;
};
_indPlayers = if (playableSlotsNumber independent == 0) then {0} else {
  playersNumber independent;
};


["RoundEnd", [
	_endMessage,
	missionName,
	_gameMode,
	_connectedPlayerCount,
	_missionDuration,
	str(_bluPlayers),
	str(_opfPlayers),
	str(_indPlayers)
]] call DiscordEmbedBuilder_fnc_buildCfg;
