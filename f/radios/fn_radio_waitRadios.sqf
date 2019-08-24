//Get initial values from TFAR and see if they match with what the player had on him.
phx_hasLR = call TFAR_fnc_haveLRRadio;
phx_hasSW = call TFAR_fnc_haveSWRadio;

if (phx_hasLRitem) then {
    if (phx_hasLR) then {
        phx_LRsetup = true;
    } else {
        phx_LRsetup = false;
    };
} else {
    phx_LRsetup = true;
};

if (phx_hasSWitem) then {
    if (phx_hasSW) then {
        phx_SWsetup = true;
    } else {
        phx_SWsetup = false;
    };
} else {
    phx_SWsetup = true;
};

if (phx_SWsetup && {phx_LRsetup} && {(CBA_missionTime > 0)}) then {
    [phx_radHandle2] call CBA_fnc_removePerFrameHandler;
    call phx_fnc_radio_setRadios;
};
