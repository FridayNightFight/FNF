//Change channel numbers from user readable to script readable
phx_curChan = phx_curChan - 1;
phx_altChan = phx_altChan - 1;


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
if (phx_hasLR) then {
    phx_curSettings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
    //Set default channel
    phx_curSettings set [0,phx_curChan];
    //Set default volume
    phx_curSettings set [1,6];
    //Setup frequencies for channels 1-9
    phx_chanSettings = phx_curSettings select 2;
    if (!isNil "phx_ch1") then {phx_chanSettings set [0,str(phx_ch1)];};
    if (!isNil "phx_ch2") then {phx_chanSettings set [1,str(phx_ch2)];};
    if (!isNil "phx_ch3") then {phx_chanSettings set [2,str(phx_ch3)];};
    if (!isNil "phx_ch4") then {phx_chanSettings set [3,str(phx_ch4)];};
    if (!isNil "phx_ch5") then {phx_chanSettings set [4,str(phx_ch5)];};
    if (!isNil "phx_ch6") then {phx_chanSettings set [5,str(phx_ch6)];};
    if (!isNil "phx_ch7") then {phx_chanSettings set [6,str(phx_ch7)];};
    if (!isNil "phx_ch8") then {phx_chanSettings set [7,str(phx_ch8)];};
    if (!isNil "phx_ch9") then {phx_chanSettings set [8,str(phx_ch9)];};
    phx_curSettings set [2,phx_chanSettings];
    //Set stero mode for default channel
    phx_curSettings set [3,1];
    //Set alternate channel
    phx_curSettings set [5,phx_altChan];
    //Set stero mode for alternate channel
    phx_curSettings set [6,2];
    [(call TFAR_fnc_activeLrRadio), phx_curSettings] call TFAR_fnc_setLrSettings;
};

//Only setup short wave channels if player has one
if (phx_hasSW) then {
    phx_curSettings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
    //Set default channel
    phx_curSettings set [0,phx_curChan];
    //Set default volume
    phx_curSettings set [1,6];
    //Setup frequencies for channels 1-9
    phx_chanSettings = phx_curSettings select 2;
    if (!isNil "phx_ch1") then {phx_chanSettings set [0,str(phx_ch1)];};
    if (!isNil "phx_ch2") then {phx_chanSettings set [1,str(phx_ch2)];};
    if (!isNil "phx_ch3") then {phx_chanSettings set [2,str(phx_ch3)];};
    if (!isNil "phx_ch4") then {phx_chanSettings set [3,str(phx_ch4)];};
    if (!isNil "phx_ch5") then {phx_chanSettings set [4,str(phx_ch5)];};
    if (!isNil "phx_ch6") then {phx_chanSettings set [5,str(phx_ch6)];};
    if (!isNil "phx_ch7") then {phx_chanSettings set [6,str(phx_ch7)];};
    if (!isNil "phx_ch8") then {phx_chanSettings set [7,str(phx_ch8)];};
    phx_curSettings set [2,phx_chanSettings];
    //Set stero mode for default channel
    phx_curSettings set [3,1];
    //Set alternate channel
    phx_curSettings set [5,phx_altChan];
    //Set stero mode for alternate channel
    phx_curSettings set [6,2];

    [(call TFAR_fnc_activeSwRadio), phx_curSettings] call TFAR_fnc_setSwSettings;
};


//Everything should be setup. Let the player know.
systemChat "Radios preset.";
[] spawn {
  ["<t align='center'>Radios initialized.</t>", "success", 5] call phx_ui_fnc_notify;
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
call phx_fnc_radio_cleanup;
