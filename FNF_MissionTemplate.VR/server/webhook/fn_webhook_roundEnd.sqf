if (isNil "DiscordEmbedBuilder_fnc_buildCfg") exitWith {diag_log text "Failed to send RoundEnd webhook -- mod not loaded!"};

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

_bluPlayers = if (playableSlotsNumber west == 0) then {""} else {str(count(allPlayers select {side _x == west && alive _x}))};
_opfPlayers = if (playableSlotsNumber east == 0) then {""} else {str(count(allPlayers select {side _x == east && alive _x}))};
_indPlayers = if (playableSlotsNumber independent == 0) then {""} else {str(count(allPlayers select {side _x == independent && alive _x}))};


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