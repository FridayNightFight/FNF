fnf_curChan = fnf_radioSettingsStart select 0;
fnf_altChan = fnf_radioSettingsStart select 1;
_channelArray = fnf_radioSettingsStart select 2;
if (count _channelArray > 0) then {fnf_ch1 = fnf_playerBaseChannel + (_channelArray select 0)};
if (count _channelArray > 1) then {fnf_ch2 = fnf_playerBaseChannel + (_channelArray select 1)};
if (count _channelArray > 2) then {fnf_ch3 = fnf_playerBaseChannel + (_channelArray select 2)};
if (count _channelArray > 3) then {fnf_ch4 = fnf_playerBaseChannel + (_channelArray select 3)};
if (count _channelArray > 4) then {fnf_ch5 = fnf_playerBaseChannel + (_channelArray select 4)};
if (count _channelArray > 5) then {fnf_ch6 = fnf_playerBaseChannel + (_channelArray select 5)};
if (count _channelArray > 6) then {fnf_ch7 = fnf_playerBaseChannel + (_channelArray select 6)};
if (count _channelArray > 7) then {fnf_ch8 = fnf_playerBaseChannel + (_channelArray select 7)};

//player isn't part of any template group
if (isNil "fnf_curChan") then {
    fnf_curChan = 1;
    fnf_altChan = 8;
};

//Change channel numbers from user readable to script readable
fnf_curChan = fnf_curChan - 1;
fnf_altChan = fnf_altChan - 1;
