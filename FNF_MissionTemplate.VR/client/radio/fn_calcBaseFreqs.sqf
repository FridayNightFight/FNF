phx_curChan = phx_radioSettingsStart select 0;
phx_altChan = phx_radioSettingsStart select 1;
_channelArray = phx_radioSettingsStart select 2;
if (count _channelArray > 0) then {phx_ch1 = phx_playerBaseChannel + (_channelArray select 0)};
if (count _channelArray > 1) then {phx_ch2 = phx_playerBaseChannel + (_channelArray select 1)};
if (count _channelArray > 2) then {phx_ch3 = phx_playerBaseChannel + (_channelArray select 2)};
if (count _channelArray > 3) then {phx_ch4 = phx_playerBaseChannel + (_channelArray select 3)};
if (count _channelArray > 4) then {phx_ch5 = phx_playerBaseChannel + (_channelArray select 4)};
if (count _channelArray > 5) then {phx_ch6 = phx_playerBaseChannel + (_channelArray select 5)};
if (count _channelArray > 6) then {phx_ch7 = phx_playerBaseChannel + (_channelArray select 6)};
if (count _channelArray > 7) then {phx_ch8 = phx_playerBaseChannel + (_channelArray select 7)};

//player isn't part of any template group
if (isNil "phx_curChan") then {
    phx_curChan = 1;
    phx_altChan = 8;
};

//Change channel numbers from user readable to script readable
phx_curChan = phx_curChan - 1;
phx_altChan = phx_altChan - 1;
