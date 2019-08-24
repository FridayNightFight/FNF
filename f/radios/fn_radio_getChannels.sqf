//Figure out which side the player is on.
_side = side player;
switch (_side) do {
    case east: { phx_playerBaseChannel = phx_opforBaseChannel; };
    case west: { phx_playerBaseChannel = phx_bluforBaseChannel; };
    case independent: { phx_playerBaseChannel = phx_indforBaseChannel; };
    default { titleText ["The game thinks you aren't one of the three teams!","PLAIN"]; };
};
//Error message
if (isNil "phx_playerBaseChannel") exitWith {titleText ["Error! Default radio channels will not be set!","PLAIN DOWN",0.5];};

phx_ch1 = phx_playerBaseChannel; //All players will be able to switch to channel 1 to get on platoon net.

// phx_radioSettings: Tells radio script which channels to set for group. [altChannel,mainChannel,[channelArray]] (array)
//     mainChannel: Which channel the radio will start on. (1-8)
//     altChannel: Which channel the radio will have as an alternate by default (1-8)
//     [channelArray]: An array of channels to set on the radio. (float)
//        channelArray is expressed as numbers which are added to playerBaseChannel (ch1) to determine which channel the radio will be on. 
//        Try to keep offsets single digit or the channel may not be set if playerBaseChannel is a high number.
//        Frequencies can only have one decimal place.
//     ex: [1,6,[1,2,3,4]] - mainChannel is ch1, altChannel is ch6, ch2 is 1 unit MHz higher than ch1, etc.
_radioSettings = (group player) getVariable ["phx_radioSettings",[1,2,[0]]];
phx_curChan = _radioSettings select 0;
phx_altChan = _radioSettings select 1;
_channelArray = _radioSettings select 2;
if (count _channelArray >= 0) then {phx_ch2 = phx_playerBaseChannel + (_channelArray select 0)};
if (count _channelArray >= 1) then {phx_ch3 = phx_playerBaseChannel + (_channelArray select 1)};
if (count _channelArray >= 2) then {phx_ch4 = phx_playerBaseChannel + (_channelArray select 2)};
if (count _channelArray >= 3) then {phx_ch5 = phx_playerBaseChannel + (_channelArray select 3)};
if (count _channelArray >= 4) then {phx_ch6 = phx_playerBaseChannel + (_channelArray select 4)};
if (count _channelArray >= 5) then {phx_ch7 = phx_playerBaseChannel + (_channelArray select 5)};
if (count _channelArray >= 6) then {phx_ch8 = phx_playerBaseChannel + (_channelArray select 6)};
if (count _channelArray >= 7) then {phx_ch9 = phx_playerBaseChannel + (_channelArray select 7)};

//player isn't part of any template group
if (isNil "phx_curChan") then {
    phx_curChan = 1;
    phx_altChan = 8;
};

//Generate Mission Notes
phx_radioNoteString = "<font size='24'>Your Radio's Default Settings</font><br/><br/>Channel 1: " + str(phx_ch1) + " MHz<br/>";
if (!isNil "phx_ch2") then {phx_radioNoteString = phx_radioNoteString + "Channel 2: " + str(phx_ch2) + " MHz<br/>";};
if (!isNil "phx_ch3") then {phx_radioNoteString = phx_radioNoteString + "Channel 3: " + str(phx_ch3) + " MHz<br/>";};
if (!isNil "phx_ch4") then {phx_radioNoteString = phx_radioNoteString + "Channel 4: " + str(phx_ch4) + " MHz<br/>";};
if (!isNil "phx_ch5") then {phx_radioNoteString = phx_radioNoteString + "Channel 5: " + str(phx_ch5) + " MHz<br/>";};
if (!isNil "phx_ch6") then {phx_radioNoteString = phx_radioNoteString + "Channel 6: " + str(phx_ch6) + " MHz<br/>";};
if (!isNil "phx_ch7") then {phx_radioNoteString = phx_radioNoteString + "Channel 7: " + str(phx_ch7) + " MHz<br/>";};
if (!isNil "phx_ch8") then {phx_radioNoteString = phx_radioNoteString + "Channel 8: " + str(phx_ch8) + " MHz<br/>";};
if (!isNil "phx_ch9") then {phx_radioNoteString = phx_radioNoteString + "Channel 9: " + str(phx_ch9) + " MHz<br/>";};

//Let player know what channels he starts on.
phx_radioNoteString = phx_radioNoteString + "<br/>Main Channel (left ear): <font color='#90ee90'>CH " + str(phx_curChan) + "</font><br/>Alt. Channel (right ear): <font color='#90ee90'>CH " + str(phx_altChan) + "</font>";
player createDiaryRecord ["PHX_Diary", ["Radio Settings", phx_radioNoteString]];

//Next step
phx_radHandle2 = [phx_fnc_radio_waitRadios, 0, []] call CBA_fnc_addPerFrameHandler;
