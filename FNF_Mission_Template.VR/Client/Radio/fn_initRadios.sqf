/*
	Author: Mallen

	Description:
		Sets up Radio stereo settings

	Parameter(s):
		None

	Returns:
		None
*/


//choose what Encryption Code is required
_encryptionCode = "fnf_default_code";

switch (playerSide) do {
	case west: {_encryptionCode = "fnf_blufor_code";};
	case east:
	{
		if ([east, west] call BIS_fnc_sideIsFriendly) then
		{
			_encryptionCode = "fnf_blufor_code";
		} else {
			_encryptionCode = "fnf_opfor_code";
		};
	};
	case independent:
	{
		_encryptionCode = "fnf_indfor_code";
		if ([independent, west] call BIS_fnc_sideIsFriendly) then
		{
			_encryptionCode = "fnf_blufor_code";
		};
		if ([independent, east] call BIS_fnc_sideIsFriendly) then
		{
			_encryptionCode = "fnf_opfor_code";
		};
		if ([east, west] call BIS_fnc_sideIsFriendly) then
		{
			_encryptionCode = "fnf_indfor_code";
		};
	};
	default { };
};

_isSrRadio = false;
{
	if ((_x call TFAR_fnc_isRadio) or (_x call TFAR_fnc_isPrototypeRadio)) then
	{
		_isSrRadio = true;
	};
} forEach (assignedItems player);

//if player has SR set up encryption codes and put it in left ear
if (_isSrRadio) then
{
	[{
		_test = call TFAR_fnc_activeSWRadio;
		not isNil "_test";
	},{
		[(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
		[(call TFAR_fnc_activeSWRadio), _this] call TFAR_fnc_setSwRadioCode;
	}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;
};

//if player has an LR set encryption codes and put it in right ear
if ((backpack player) call TFAR_fnc_isLrRadio) then
{
	[{
		_test = call TFAR_fnc_activeLrRadio;
		not isNil "_test";
	},{
		[call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
		[(call TFAR_fnc_activeLrRadio), _this] call TFAR_fnc_setLrRadioCode;
	}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;

	if (_isSrRadio) then
	{
		[{
			_test = call TFAR_fnc_activeSWRadio;
			not isNil "_test";
		},{
			[(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
			[(call TFAR_fnc_activeSWRadio), _this] call TFAR_fnc_setSwRadioCode;
		}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;
	};
} else {
	//if no LR check if player has SR, if they do have Alt net be setup in right ear
	if (_isSrRadio) then
	{
		[{
			_test = call TFAR_fnc_activeSWRadio;
			not isNil "_test";
		},{
			[(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
			[(call TFAR_fnc_activeSWRadio), _this] call TFAR_fnc_setSwRadioCode;
			_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
			_settings set [5, 1];
			_settings set [6, 2];
			[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		}, _encryptionCode] call CBA_fnc_waitUntilAndExecute;
	};
};

//used to setup ORBAT SR and LR values
[{
	if (call TFAR_fnc_haveSWRadio) then
	{
		_currentFreq = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwFrequency;
		_prevFreq = player getVariable ["fnf_freq_sr", "0"];
		if (_currentFreq isNotEqualTo _prevFreq) then
		{
			player setVariable ["fnf_freq_sr", _currentFreq, true];
		};
	};

	if (call TFAR_fnc_haveLRRadio) then
	{
		_currentFreq = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrFrequency;
		_prevFreq = player getVariable ["fnf_freq_lr", "0"];
		if (_currentFreq isNotEqualTo _prevFreq) then
		{
			player setVariable ["fnf_freq_lr", _currentFreq, true];
		};
	};
}, 1] call CBA_fnc_addPerFrameHandler;
