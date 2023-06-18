//Figure out which side the player is on.
_side = playerSide;

private ["_alliedWest","_alliedEast"];
_indFriendly = independent call BIS_fnc_friendlySides;
if (_indFriendly find west > -1) then {_alliedWest = true} else {_alliedWest = false};
if (_indFriendly find east > -1) then {_alliedEast = true} else {_alliedEast = false};

fnf_loadout_TFAREncryptionCode = "";

switch (_side) do {
    case east: {
      fnf_playerBaseChannel = fnf_opforBaseChannel;
      fnf_loadout_TFAREncryptionCode = "_opfor";
    };
    case west: {
      fnf_playerBaseChannel = fnf_bluforBaseChannel;
      fnf_loadout_TFAREncryptionCode = "_bluefor";
    };
    case independent: {

      if (_alliedWest) exitWith {
        fnf_playerBaseChannel = fnf_bluforBaseChannel;
        fnf_loadout_TFAREncryptionCode = "_bluefor";
      };
      if (_alliedEast) exitWith {
        fnf_playerBaseChannel = fnf_opforBaseChannel;
        fnf_loadout_TFAREncryptionCode = "_opfor";
      };

      fnf_playerBaseChannel = fnf_indforBaseChannel;
      fnf_loadout_TFAREncryptionCode = "_independent";
    };
    case civilian: {
      fnf_playerBaseChannel = fnf_civilianBaseChannel;
      fnf_loadout_TFAREncryptionCode = "_civilian";
    };
    default { titleText ["The game thinks you aren't one of the three teams!","PLAIN"]; };
};


//Error message
if (isNil "fnf_playerBaseChannel" || fnf_loadout_TFAREncryptionCode isEqualTo "") exitWith {titleText ["Error! Default radio channels will not be set!","PLAIN DOWN",0.5];};
/*
fnf_ch1 = fnf_playerBaseChannel; //All players will be able to switch to channel 1 to get on platoon net.
*/

// fnf_radioSettings: Tells radio script which channels to set for group. [altChannel,mainChannel,[channelArray]] (array)
//     mainChannel: Which channel the radio will start on. (1-8)
//     altChannel: Which channel the radio will have as an alternate by default (1-8)
//     [channelArray]: An array of channels to set on the radio. (float)
//        channelArray is expressed as numbers which are added to playerBaseChannel (ch1) to determine which channel the radio will be on.
//        Try to keep offsets single digit or the channel may not be set if playerBaseChannel is a high number.
//        Frequencies can only have one decimal place.
//     ex: [1,6,[1,2,3,4]] - mainChannel is ch1, altChannel is ch6, ch2 is 1 unit MHz higher than ch1, etc.
fnf_radioSettingsStart = (group player) getVariable ["fnf_radioSettings",[1,2,[0]]];

// this call is also in setRadios, to allow recalc if playerBaseChannel changes due to allegiance change
call fnf_radio_fnc_calcBaseFreqs;

//Generate Mission Notes
fnf_radioNoteString = "<font size='24'>Your Radio's Default Settings</font><br/><br/>Channel 1: " + str(fnf_ch1) + " MHz<br/>";
if (!isNil "fnf_ch2") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 2: " + str(fnf_ch2) + " MHz<br/>";};
if (!isNil "fnf_ch3") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 3: " + str(fnf_ch3) + " MHz<br/>";};
if (!isNil "fnf_ch4") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 4: " + str(fnf_ch4) + " MHz<br/>";};
if (!isNil "fnf_ch5") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 5: " + str(fnf_ch5) + " MHz<br/>";};
if (!isNil "fnf_ch6") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 6: " + str(fnf_ch6) + " MHz<br/>";};
if (!isNil "fnf_ch7") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 7: " + str(fnf_ch7) + " MHz<br/>";};
if (!isNil "fnf_ch8") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 8: " + str(fnf_ch8) + " MHz<br/>";};
if (!isNil "fnf_ch9") then {fnf_radioNoteString = fnf_radioNoteString + "Channel 9: " + str(fnf_ch9) + " MHz<br/>";};

_structStartingRadios = ["<t size='1.2'>Your Radio's Default Settings</t><br/><br/>Channel 1: " + str(fnf_ch1) + " MHz<br/>"];
if (!isNil "fnf_ch2") then {_structStartingRadios pushBack ("Channel 2: " + str(fnf_ch2) + " MHz<br/>")};
if (!isNil "fnf_ch3") then {_structStartingRadios pushBack ("Channel 3: " + str(fnf_ch3) + " MHz<br/>")};
if (!isNil "fnf_ch4") then {_structStartingRadios pushBack ("Channel 4: " + str(fnf_ch4) + " MHz<br/>")};
if (!isNil "fnf_ch5") then {_structStartingRadios pushBack ("Channel 5: " + str(fnf_ch5) + " MHz<br/>")};
if (!isNil "fnf_ch6") then {_structStartingRadios pushBack ("Channel 6: " + str(fnf_ch6) + " MHz<br/>")};
if (!isNil "fnf_ch7") then {_structStartingRadios pushBack ("Channel 7: " + str(fnf_ch7) + " MHz<br/>")};
if (!isNil "fnf_ch8") then {_structStartingRadios pushBack ("Channel 8: " + str(fnf_ch8) + " MHz<br/>")};
if (!isNil "fnf_ch9") then {_structStartingRadios pushBack ("Channel 9: " + str(fnf_ch9) + " MHz<br/>")};



//Let player know what channels he starts on.
// fnf_Diary_Radio = player createDiarySubject ["fnf_Diary_Radio", "Radio Preset", "\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa"];
fnf_radioNoteString = fnf_radioNoteString + "<br/>Main Channel (left ear): <font color='#90ee90'>CH " + str(fnf_curChan) + "</font><br/>Alt. Channel (right ear): <font color='#90ee90'>CH " + str(fnf_altChan) + "</font>";

fnf_briefing_startingRadios = {
  player createDiaryRecord ["Diary", ["My Radio Settings", fnf_radioNoteString]];
};

_structStartingRadios pushBack ("<br/>Main Channel (left ear): <t color='#90ee90'>CH " + str(fnf_curChan) + "</t><br/>Alt. Channel (right ear): <t color='#90ee90'>CH " + str(fnf_altChan) + "</t>");
[fnf_ui_structTextRef, "My Starting Radios", _structStartingRadios joinString ""] call BIS_fnc_setToPairs;


//Next step - wait for loadout
// [{
//   !isNil "fnf_hasSW" && !isNil "fnf_hasLR"
// }, {
//   call TFAR_fnc_requestRadios;
//   // call fnf_radio_fnc_setRadios;
//   [{

//   },[],5] call CBA_fnc_waitAndExecute;
// }, [], 60, {
//   // systemChat "Radio preset timeout";
//   ["<t color='#00CC44'>Radio preset timeout.</t>", "error", 10] call fnf_ui_fnc_notify;
// }] call CBA_fnc_waitUntilAndExecute;

// This will automatically set radios to FNF freqs when any new radio is instantiated from the server
["TFAR_event_OnRadiosReceived", {
  [{
    call fnf_radio_fnc_setRadios;
  },[],1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
