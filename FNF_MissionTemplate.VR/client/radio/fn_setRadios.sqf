
// recalc base freq in case fnf_playerBaseChannel has changed
call fnf_radio_fnc_calcBaseFreqs;

// [ // stereo settings example
// 	1, // active channel (value - 1, as it uses a 0-based index)
// 	6, // volume (value - 1, as it uses a 0-based index)
// 	["47","47.2","48","49","50","51","52","53","117.8"], // channel frequencies
// 	1, // stereo setting [center, left, right]
// 	"indfor", // encryption code
// 	0, // additional channel (value - 1, as it uses a 0-based index)
// 	2, // additional channel stereo setting [center, left, right]
// 	"76561197991996737", // owner's playerUID
// 	false, // is on speakers
// 	true // is powered on
// ]

//Only setup long range channels if player has one
if (call TFAR_fnc_haveLRRadio) then {
    fnf_curSettings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
    //Set default channel
    fnf_curSettings set [0,fnf_curChan];
    //Set default volume
    fnf_curSettings set [1,6];
    //Setup frequencies for channels 1-9
    fnf_chanSettings = fnf_curSettings select 2;
    if (!isNil "fnf_ch1") then {fnf_chanSettings set [0,str(fnf_ch1)];};
    if (!isNil "fnf_ch2") then {fnf_chanSettings set [1,str(fnf_ch2)];};
    if (!isNil "fnf_ch3") then {fnf_chanSettings set [2,str(fnf_ch3)];};
    if (!isNil "fnf_ch4") then {fnf_chanSettings set [3,str(fnf_ch4)];};
    if (!isNil "fnf_ch5") then {fnf_chanSettings set [4,str(fnf_ch5)];};
    if (!isNil "fnf_ch6") then {fnf_chanSettings set [5,str(fnf_ch6)];};
    if (!isNil "fnf_ch7") then {fnf_chanSettings set [6,str(fnf_ch7)];};
    if (!isNil "fnf_ch8") then {fnf_chanSettings set [7,str(fnf_ch8)];};
    if (!isNil "fnf_ch9") then {fnf_chanSettings set [8,str(fnf_ch9)];};
    fnf_curSettings set [2,fnf_chanSettings];
    //Set stero mode for default channel
    fnf_curSettings set [3,1];
    //Set alternate channel
    fnf_curSettings set [5,fnf_altChan];
    //Set stero mode for alternate channel
    fnf_curSettings set [6,2];
    [(call TFAR_fnc_activeLrRadio), fnf_curSettings] call TFAR_fnc_setLrSettings;
    [(call TFAR_fnc_activeLrRadio), fnf_loadout_TFAREncryptionCode] call TFAR_fnc_setLrRadioCode;
};

//Only setup short wave channels if player has one
if (call TFAR_fnc_haveSwRadio) then {
    fnf_curSettings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
    //Set default channel
    fnf_curSettings set [0,fnf_curChan];
    //Set default volume
    fnf_curSettings set [1,6];
    //Setup frequencies for channels 1-9
    fnf_chanSettings = fnf_curSettings select 2;
    if (!isNil "fnf_ch1") then {fnf_chanSettings set [0,str(fnf_ch1)];};
    if (!isNil "fnf_ch2") then {fnf_chanSettings set [1,str(fnf_ch2)];};
    if (!isNil "fnf_ch3") then {fnf_chanSettings set [2,str(fnf_ch3)];};
    if (!isNil "fnf_ch4") then {fnf_chanSettings set [3,str(fnf_ch4)];};
    if (!isNil "fnf_ch5") then {fnf_chanSettings set [4,str(fnf_ch5)];};
    if (!isNil "fnf_ch6") then {fnf_chanSettings set [5,str(fnf_ch6)];};
    if (!isNil "fnf_ch7") then {fnf_chanSettings set [6,str(fnf_ch7)];};
    if (!isNil "fnf_ch8") then {fnf_chanSettings set [7,str(fnf_ch8)];};
    fnf_curSettings set [2,fnf_chanSettings];
    //Set stero mode for default channel
    fnf_curSettings set [3,1];
    //Set alternate channel
    fnf_curSettings set [5,fnf_altChan];
    //Set stero mode for alternate channel
    fnf_curSettings set [6,2];

    [(call TFAR_fnc_activeSwRadio), fnf_curSettings] call TFAR_fnc_setSwSettings;
    [(call TFAR_fnc_activeSwRadio), fnf_loadout_TFAREncryptionCode] call TFAR_fnc_setSwRadioCode;
};

//Everything should be setup. Let the player know.
// systemChat "Radios preset.";
[] spawn {
  ["<t align='center'>Radios initialized.</t>", "success", 5] call fnf_ui_fnc_notify;
  // SW radio
  if (call TFAR_fnc_haveSWRadio) then {
    [(call TFAR_fnc_activeSwRadio), false] call TFAR_fnc_showRadioInfo;
  };
  sleep 5;
  // LR radio
  if (call TFAR_fnc_haveLRRadio) then {
    [(call TFAR_fnc_activeLrRadio), true] call TFAR_fnc_showRadioInfo;
  };
};
// call fnf_radio_fnc_cleanup;
