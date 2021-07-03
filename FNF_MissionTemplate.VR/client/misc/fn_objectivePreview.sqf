params ["_objectiveNumber", "_objectiveLabel"];

if (getClientStateNumber < 10) exitWith {systemChat "Objective previews only work once loaded into the mission"};

_prepEffects = {
	showCinemaBorder false;
	phx_fnc_objectivePreview_ppGrain = ppEffectCreate ["FilmGrain", 2000];
	phx_fnc_objectivePreview_ppColor = ppEffectCreate ["ColorCorrections", 1500];
	phx_fnc_objectivePreview_ppGrain ppEffectEnable true;
	phx_fnc_objectivePreview_ppColor ppEffectEnable true;
	phx_fnc_objectivePreview_ppGrain ppEffectAdjust [0.6, 1, 2, 0, 1];
	phx_fnc_objectivePreview_ppColor ppEffectAdjust [
		0.75,
		1.3,
		0,
		[1, 1, 1, 0],
		[1, 1, 1, 0],
		[0.75, 0.25, 0, 1.0]];
	phx_fnc_objectivePreview_ppGrain ppEffectCommit 0;
	phx_fnc_objectivePreview_ppColor ppEffectCommit 0;
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
	phx_fnc_objectivePreview_Cam = "camera" camCreate _targetPos;
	_camFocusPos = _targetPos;
	phx_fnc_objectivePreview_Cam camPreparePos [round(random 150) - 75 + _targetPos # 0, (_targetPos # 1) - 200 + round (random 100), 250 + round (random 200)];
	phx_fnc_objectivePreview_Cam camPrepareTarget _camFocusPos;
	phx_fnc_objectivePreview_Cam camSetFov 0.3;
	phx_fnc_objectivePreview_Cam camSetFocus [-1, -1];
	phx_fnc_objectivePreview_Cam camCommitPrepared 0;
	true;
};


_handleCam = {
	params ["_key"];

	if (isNil "phx_fnc_objectivePreview_skip") then {
		2 fadeSound 1;

		// Static fade-in
		("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
		waitUntil {!isNull (uiNamespace getVariable ["RscStatic_display", displayNull]) || !isNil "phx_fnc_objectivePreview_skip"};
		waitUntil {isNull (uiNamespace getVariable ["RscStatic_display", displayNull])  || !isNil "phx_fnc_objectivePreview_skip"};
	};

	if (isNil "phx_fnc_objectivePreview_skip") then {
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
		phx_fnc_objectivePreview_instructionsText = _key spawn {
			scriptName "phx_fnc_objectivePreview: instructions control";

			disableSerialization;

			private ["_key"];
			_key = _this;
			"debug_console" callExtension ("instructionsText initiated" + "#1111");

			if (isNil "phx_fnc_objectivePreview_skip") then {
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
				"debug_console" callExtension ("instructions text vars initialized" + "#1111");

				_ctrlText ctrlSetStructuredText parseText _skipText;
				_ctrlText ctrlSetFade 1;
				_ctrlText ctrlCommit 0;

				_ctrlText ctrlSetFade 0;
				_ctrlText ctrlCommit 1;

				"debug_console" callExtension ("instructions text set, waiting for skip" + "#1111");

				// Wait for video to finish
				waitUntil {{!(isNil _x)} count ["phx_fnc_objectivePreview_skip"] > 0};

				"debug_console" callExtension ("instructions text - skip detected" + "#1111");
				// Remove instructions
				_ctrlText ctrlSetFade 1;
				_ctrlText ctrlCommit 0;
			};
		};

		// Display SITREP
		phx_fnc_objectivePreview_SITREP = [
			phx_fnc_objectivePreview_SITREPText,
			0.015 * safeZoneW + safeZoneX,
			0.015 * safeZoneH + safeZoneY,
			false,
			"<t align = 'left' size = '1.0' font = 'PuristaLight'>%1</t>"
		] spawn BIS_fnc_typeText2;

		waitUntil {scriptDone phx_fnc_objectivePreview_SITREP || !(isNil "phx_fnc_objectivePreview_skip")};

		if (isNil "phx_fnc_objectivePreview_skip") then {
			// Register the UAV finished
			phx_fnc_objectivePreview_Done = true;
		};
	};

	waitUntil {{!(isNil _x)} count ["phx_fnc_objectivePreview_skip"] > 0};

	// Remove skipping eventhandler if it wasn't removed already
	if (!(isNil {uiNamespace getVariable "phx_fnc_objectivePreview_skipEH"})) then {
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "phx_fnc_objectivePreview_skipEH"];
		uiNamespace setVariable ["phx_fnc_objectivePreview_skipEH", nil];
	};

	// Static fade-out
	("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
	waitUntil {!isNull (uiNamespace getVariable ["RscStatic_display", displayNull])};
	waitUntil {isNull (uiNamespace getVariable ["RscStatic_display", displayNull])};
};

_useNvg = {if (sunOrMoon < 0.50) then {camUseNVG true};};

_cleanup = {

	waitUntil {{!(isNil _x)} count ["phx_fnc_objectivePreview_skip"] > 0};

	// Remove SITREP
	if (!(isNil "phx_fnc_objectivePreview_SITREP")) then {
		terminate phx_fnc_objectivePreview_SITREP;
		["", 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
	};

	// Remove HUD
	optionsMenuOpened = nil;
	optionsMenuClosed = nil;

	phx_fnc_objectivePreview_Cam cameraEffect ["TERMINATE", "BACK"];
	{
		private ["_layer"];
		_layer = _x call BIS_fnc_rscLayer;
		_layer cutText ["", "PLAIN"];
	} forEach ["BIS_layerEstShot", "BIS_layerStatic", "BIS_layerInterlacing"];
	ppEffectDestroy phx_fnc_objectivePreview_ppColor;
	ppEffectDestroy phx_fnc_objectivePreview_ppGrain;
	camDestroy phx_fnc_objectivePreview_Cam;
	[false] call phx_fnc_hideVehiclesExceptObjectives;

	sleep 2;
	// Clear existing global variables
	phx_fnc_objectivePreview_skip = nil;
	phx_fnc_objectivePreview_Done = nil;
	phx_fnc_objectivePreview_SITREPText = nil;
	phx_fnc_objectivePreview_Text = nil;
	phx_fnc_objectivePreview_ppGrain = nil;
	phx_fnc_objectivePreview_ppColor = nil;
	phx_fnc_hideVehiclesExceptObjectives = nil;
	phx_fnc_objectivePreview_Cam = nil;

	true;
};


phx_fnc_hideVehiclesExceptObjectives = {
	params ["_hidden"];
	_toProcess = vehicles select {
		!(
			["obj", vehicleVarName _x] call BIS_fnc_inString ||
			["term", vehicleVarName _x] call BIS_fnc_inString
		)
	};
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
	phx_fnc_objectivePreview_Text = format["Objective %1", _objectiveNumber];
} else {
	phx_fnc_objectivePreview_Text = format["Objective %1 - %2", _objectiveNumber, _objectiveLabel];
};


private ["_SITREP", "_key"];
phx_fnc_objectivePreview_SITREPText = [
	[_date + " ", ""],
	[_time, "font = 'PuristaMedium'"],
	["", "<br/>"],
	[toUpper phx_fnc_objectivePreview_Text, ""]
];
// "debug_console" callExtension ("SITREP data prepared" + "#1111");

setViewDistance 6000;

disableSerialization;

waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
// "debug_console" callExtension ("missionDisplay is loaded" + "#1111");

// Compile key
_key = format ["BIS_%1.%2_establishingShot", missionName, worldName];

// Remove eventhandler if it exists (only happens when restarting)
if (!(isNil {uiNamespace getVariable "phx_fnc_objectivePreview_skipEH"})) then {
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "phx_fnc_objectivePreview_skipEH"];
	uiNamespace setVariable ["phx_fnc_objectivePreview_skipEH", nil];
};

// Add skipping eventhandler
private ["_skipEH"];
_skipEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
	"KeyDown",
	format [
		"
			if (_this select 1 == 57) then {
				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'phx_fnc_objectivePreview_skipEH'];
				uiNamespace setVariable ['phx_fnc_objectivePreview_skipEH', nil];

				playSound ['click', true];

				phx_fnc_objectivePreview_skip = true;
			};

			if (_this select 1 != 1) then {true};
		",
		_key
	]
];

uiNamespace setVariable ["phx_fnc_objectivePreview_skipEH", _skipEH];
// "debug_console" callExtension ("_skipEH defined" + "#1111");




switch true do {
	case (phx_gameMode == "neutralSector"): {// NEUTRAL SECTOR

		_loc = (getMarkerPos [format["BIS_fnc_moduleSector_iconphx_sector%1", _objectiveNumber], nil]);
		if (isNil "_loc" || (_loc # 0 == 0)) exitWith {systemChat "Objective not found"};

		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [_loc] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call phx_fnc_hideVehiclesExceptObjectives;
		phx_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};
	case (phx_gameMode == "adSector"):{// AD SECTOR
		_obj = (missionNamespace getVariable [format["phx_sec%1", _objectiveNumber], nil]);
		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [getPos _obj] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call phx_fnc_hideVehiclesExceptObjectives;
		phx_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};
	case (phx_gameMode in ["uplink","connection","rush"]): {// TERMINALS
		_obj = (missionNamespace getVariable [format["term%1", _objectiveNumber], nil]);
		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [getPos _obj] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call phx_fnc_hideVehiclesExceptObjectives;
		phx_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};


	case (phx_gameMode == "destroy"):{// DESTROY (CACHES)

		_obj = missionNamespace getVariable [format["destroy_obj%1", _objectiveNumber], nil];
		_objMark = format["destroy_obj%1Mark", _objectiveNumber];
		if (isNil "_obj") exitWith {systemChat "Objective not found"};
		if (isNull _obj) exitWith {systemChat "Objective not found"};
		_targetPos = [[_objMark]] call BIS_fnc_randomPos;
		_prep = [] spawn _prepEffects;
		waitUntil {scriptDone _prep};
		_cam = [_targetPos] spawn _makeCam;
		waitUntil {scriptDone _cam};

		[true] call phx_fnc_hideVehiclesExceptObjectives;
		phx_fnc_objectivePreview_Cam cameraEffect ["internal", "back"];
		cameraEffectEnableHUD true;
		// waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};

		call _useNVG;
		[_key] spawn _handleCam;
		[] spawn _cleanup;
	};
};
