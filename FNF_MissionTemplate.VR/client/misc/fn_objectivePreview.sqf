params ["_objectiveNumber", "_objectiveLabel"];

if (getClientStateNumber < 10) exitWith {systemChat "Objective previews only work once loaded into the mission"};

_prepEffects = {
	showCinemaBorder false;
	fnf_fnc_objectivePreview_ppGrain = ppEffectCreate ["FilmGrain", 2000];
	fnf_fnc_objectivePreview_ppColor = ppEffectCreate ["ColorCorrections", 1500];
	fnf_fnc_objectivePreview_ppGrain ppEffectEnable true;
	fnf_fnc_objectivePreview_ppColor ppEffectEnable true;
	fnf_fnc_objectivePreview_ppGrain ppEffectAdjust [0.6, 1, 2, 0, 1];
	fnf_fnc_objectivePreview_ppColor ppEffectAdjust [
		0.75,
		1.3,
		0,
		[1, 1, 1, 0],
		[1, 1, 1, 0],
		[0.75, 0.25, 0, 1.0]];
	fnf_fnc_objectivePreview_ppGrain ppEffectCommit 0;
	fnf_fnc_objectivePreview_ppColor ppEffectCommit 0;
	"HBAOPlus" ppEffectAdjust [1.0, 0.3, 0.1, 0.50, 3.0, 1.0, 4.0, 5.0, 2.0, 0.0];


	// Compile Date text
	private ["_month", "_day", "_hour", "_minute"];
	_month = str (date select 1);
	_day = str (date select 2);
	_hour = str (date select 3);
	_minute = str (date select 4);

	if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
	if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
	if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
	if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

	private ["_time", "_date"];
	_time = format ["%1:%2", _hour, _minute];
	_date = format ["%1-%2-%3", str (date select 0), _month, _day];
};

_makeCam = {
	params ["_targetPos"];
	fnf_fnc_objectivePreview_Cam = "camera" camCreate _targetPos;
	_camFocusPos = _targetPos;
	fnf_fnc_objectivePreview_Cam camPreparePos [round(random 150) - 75 + _targetPos # 0, (_targetPos # 1) - 200 + round (random 100), 250 + round (random 200)];
	fnf_fnc_objectivePreview_Cam camPrepareTarget _camFocusPos;
	fnf_fnc_objectivePreview_Cam camSetFov 0.3;
	fnf_fnc_objectivePreview_Cam camSetFocus [-1, -1];
	fnf_fnc_objectivePreview_Cam camCommitPrepared 0;
	true;
};


_handleCam = {
	params ["_key"];

	if (isNil "fnf_fnc_objectivePreview_skip") then {
		2 fadeSound 1;

		// Static fade-in
		("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
		waitUntil {!isNull (uiNamespace getVariable ["RscStatic_display", displayNull]) || !isNil "fnf_fnc_objectivePreview_skip"};
		waitUntil {isNull (uiNamespace getVariable ["RscStatic_display", displayNull])  || !isNil "fnf_fnc_objectivePreview_skip"};
	};

	if (isNil "fnf_fnc_objectivePreview_skip") then {
		// Show interlacing
		("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];

		// Show screen
		// ("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];

		optionsMenuOpened = {
			disableSerialization;
			{(_x call BIS_fnc_rscLayer) cutText ["", "PLAIN"]} forEach ["BIS_layerEstShot", "BIS_layerStatic", "BIS_layerInterlacing"];
		};

		// Add interlacing to optionsMenuClosed
		optionsMenuClosed = {
			("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];
			("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];
		};


		// Spawn instructions separately to allow for no delay in skipping
		fnf_fnc_objectivePreview_instructionsText = _key spawn {
			scriptName "fnf_fnc_objectivePreview: instructions control";

			disableSerialization;

			private ["_key"];
			_key = _this;

			if (isNil "fnf_fnc_objectivePreview_skip") then {
				// Display instructions
				private ["_layerTitlecard"];
				_layerTitlecard = "BIS_layerTitlecard" call BIS_fnc_rscLayer;
				_layerTitlecard cutRsc ["RscDynamicText", "PLAIN"];

				private ["_dispText", "_ctrlText"];
				_dispText = uiNamespace getVariable "BIS_dynamicText";
				_ctrlText = _dispText displayCtrl 9999;

				_ctrlText ctrlSetPosition [
					0 * safeZoneW + safeZoneX,
					0.8 * safeZoneH + safeZoneY,
					safeZoneW,
					safeZoneH
				];

				// Determine appropriate key highlight
				private ["_keyColor"];
				_keyColor = format [
					"<t color = '%1'>",
					(["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML
				];

				private ["_skipText"];
				_skipText = format [
					"%1Press %2[Space]%3 to close%4",
					"<t size = '0.75'>",
					_keyColor,
					"</t>",
					"</t>"
				];

				_ctrlText ctrlSetStructuredText parseText _skipText;
				_ctrlText ctrlSetFade 1;
				_ctrlText ctrlCommit 0;

				_ctrlText ctrlSetFade 0;
				_ctrlText ctrlCommit 1;


				// Wait for video to finish
				waitUntil {{!(isNil _x)} count ["fnf_fnc_objectivePreview_skip"] > 0};

				// Remove instructions
				_ctrlText ctrlSetFade 1;
				_ctrlText ctrlCommit 0;
			};
		};

		// Display SITREP
		fnf_fnc_objectivePreview_SITREP = [
			fnf_fnc_objectivePreview_SITREPText,
			0.015 * safeZoneW + safeZoneX,
			0.015 * safeZoneH + safeZoneY,
			false,
			"<t align = 'left' size = '1.0' font = 'PuristaLight'>%1</t>"
		] spawn BIS_fnc_typeText2;

		waitUntil {scriptDone fnf_fnc_objectivePreview_SITREP || !(isNil "fnf_fnc_objectivePreview_skip")};

		if (isNil "fnf_fnc_objectivePreview_skip") then {
			// Register the UAV finished
			fnf_fnc_objectivePreview_Done = true;
		};
	};

	waitUntil {{!(isNil _x)} count ["fnf_fnc_objectivePreview_skip"] > 0};

	// Remove skipping eventhandler if it wasn't removed already
	if (!(isNil {uiNamespace getVariable "fnf_fnc_objectivePreview_skipEH"})) then {
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "fnf_fnc_objectivePreview_skipEH"];
		uiNamespace setVariable ["fnf_fnc_objectivePreview_skipEH", nil];
	};

	// Static fade-out
	("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
	waitUntil {!isNull (uiNamespace getVariable ["RscStatic_display", displayNull])};
	waitUntil {isNull (uiNamespace getVariable ["RscStatic_display", displayNull])};
};

_useNvg = {if (sunOrMoon < 0.50) then {camUseNVG true};};

_cleanup = {

	waitUntil {{!(isNil _x)} count ["fnf_fnc_objectivePreview_skip"] > 0};

	// Remove SITREP
	if (!(isNil "fnf_fnc_objectivePreview_SITREP")) then {
		terminate fnf_fnc_objectivePreview_SITREP;
		["", 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
	};

	// Remove HUD
	optionsMenuOpened = nil;
	optionsMenuClosed = nil;

	fnf_fnc_objectivePreview_Cam cameraEffect ["TERMINATE", "BACK"];
	{
		private ["_layer"];
		_layer = _x call BIS_fnc_rscLayer;
		_layer cutText ["", "PLAIN"];
	} forEach ["BIS_layerEstShot", "BIS_layerStatic", "BIS_layerInterlacing"];
	ppEffectDestroy fnf_fnc_objectivePreview_ppColor;
	ppEffectDestroy fnf_fnc_objectivePreview_ppGrain;
	camDestroy fnf_fnc_objectivePreview_Cam;
	[false] call fnf_fnc_hideVehiclesExceptObjectives;

	sleep 2;
	// Clear existing global variables
	fnf_fnc_objectivePreview_skip = nil;
	fnf_fnc_objectivePreview_Done = nil;
	fnf_fnc_objectivePreview_SITREPText = nil;
	fnf_fnc_objectivePreview_Text = nil;
	fnf_fnc_objectivePreview_ppGrain = nil;
	fnf_fnc_objectivePreview_ppColor = nil;
	fnf_fnc_hideVehiclesExceptObjectives = nil;
	fnf_fnc_objectivePreview_Cam = nil;

	true;
};


fnf_fnc_hideVehiclesExceptObjectives = {
	params ["_hidden"];
	_toProcess = vehicles select {
		!(
			["obj", vehicleVarName _x] call BIS_fnc_inString ||
			["term", vehicleVarName _x] call BIS_fnc_inString
		)
	};
	_fortifyObjs = [ // from fn_fortifyServer
		"Land_BagFence_01_short_green_F",
		"Land_BagFence_01_long_green_F",
		"Land_BagFence_01_round_green_F",
		"Land_Plank_01_4m_F",
		"Land_Plank_01_8m_F",
		"Land_HBarrier_01_wall_4_green_F",
		"Land_HBarrier_01_wall_corner_green_F",
		"Land_HBarrier_01_wall_6_green_F",
		"Land_BagBunker_01_small_green_F",
		"Land_HBarrier_01_tower_green_F",
		"Land_BagBunker_01_large_green_F",
		"Land_Bunker_01_small_F",
		"Land_Bunker_01_big_F",
		"Land_Bunker_01_HQ_F",
		"Land_Bunker_01_tall_F",
		"Land_BagFence_Short_F",
		"Land_BagFence_Long_F",
		"Land_BagFence_Round_F",
		"Land_Plank_01_4m_F",
		"Land_Plank_01_8m_F",
		"Land_HBarrierWall4_F",
		"Land_HBarrierWall_corner_F",
		"Land_HBarrierWall6_F",
		"Land_BagBunker_Small_F",
		"Land_BagBunker_Tower_F",
		"Land_BagBunker_Large_F",
		"Land_Bunker_01_small_F",
		"Land_Bunker_01_big_F",
		"Land_Bunker_01_HQ_F",
		"Land_Bunker_01_tall_F"
	];
	{
		_toProcess append (entities _x);
	} forEach _fortifyObjs;

	{
		_x hideObject _hidden;
	} forEach _toProcess;
};




// Compile SITREP text
private ["_month", "_day", "_hour", "_minute"];
_month = str (date select 1);
_day = str (date select 2);
_hour = str (date select 3);
_minute = str (date select 4);

if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

private ["_time", "_date"];
_time = format ["%1:%2", _hour, _minute];
_date = format ["%1-%2-%3", str (date select 0), _month, _day];

if (isNil "_objectiveLabel") then {
	fnf_fnc_objectivePreview_Text = format["Objective %1", _objectiveNumber];
} else {
	fnf_fnc_objectivePreview_Text = format["Objective %1 - %2", _objectiveNumber, _objectiveLabel];
};


private ["_SITREP", "_key"];
fnf_fnc_objectivePreview_SITREPText = [
	[_date + " ", ""],
	[_time, "font = 'PuristaMedium'"],
	["", "<br/>"],
	[toUpper fnf_fnc_objectivePreview_Text, ""]
];

setViewDistance 6000;

disableSerialization;

waitUntil {!(isNull ([] call BIS_fnc_displayMission))};

// Compile key
_key = format ["BIS_%1.%2_establishingShot", missionName, worldName];

// Remove eventhandler if it exists (only happens when restarting)
if (!(isNil {uiNamespace getVariable "fnf_fnc_objectivePreview_skipEH"})) then {
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "fnf_fnc_objectivePreview_skipEH"];
	uiNamespace setVariable ["fnf_fnc_objectivePreview_skipEH", nil];
};

// Add skipping eventhandler
private ["_skipEH"];
_skipEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
	"KeyDown",
	format [
		"
			if (_this select 1 == 57) then {
				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'fnf_fnc_objectivePreview_skipEH'];
				uiNamespace setVariable ['fnf_fnc_objectivePreview_skipEH', nil];

				playSound ['click', true];

				fnf_fnc_objectivePreview_skip = true;
			};

			if (_this select 1 != 1) then {true};
		",
		_key
	]
];

uiNamespace setVariable ["fnf_fnc_objectivePreview_skipEH", _skipEH];
// "debug_console" callExtension ("_skipEH defined" + "#1111");




switch true do {
	case (fnf_gameMode == "neutralSector"): {// NEUTRAL SECTOR

		_loc = (getMarkerPos [format["BIS_fnc_moduleSector_iconfnf_sector%1", _objectiveNumber], nil]);
		if (isNil "_loc" || (_loc # 0 == 0)) exitWith {systemChat "Objective not found"};

		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [_loc] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call fnf_fnc_hideVehiclesExceptObjectives;
		fnf_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};
	case (fnf_gameMode == "adSector"):{// AD SECTOR
		_obj = (missionNamespace getVariable [format["fnf_sec%1", _objectiveNumber], nil]);
		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [getPos _obj] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call fnf_fnc_hideVehiclesExceptObjectives;
		fnf_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};
	case (fnf_gameMode in ["uplink","connection","rush"]): {// TERMINALS
		_obj = (missionNamespace getVariable [format["term%1", _objectiveNumber], nil]);
		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [getPos _obj] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call fnf_fnc_hideVehiclesExceptObjectives;
		fnf_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};


	case (fnf_gameMode == "destroy"):{// DESTROY (CACHES)

		_obj = missionNamespace getVariable [format["destroy_obj_%1", _objectiveNumber], nil];
		_objMark = format["destroy_obj_%1_mark", _objectiveNumber];
		if (isNil "_obj") exitWith {systemChat "Objective not found"};
		if (isNull _obj) exitWith {systemChat "Objective not found"};
		_targetPos = [[_objMark]] call BIS_fnc_randomPos;
		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [_targetPos] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call fnf_fnc_hideVehiclesExceptObjectives;
		fnf_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};
};
