_enablePreset = ["phx_param_enableRadioPreset",1] call BIS_fnc_getParamValue;
if (_enablePreset isEqualTo 0) exitWith {[phx_radHandle1] call CBA_fnc_removePerFrameHandler;};

_loadout = missionNamespace getVariable ["phx_loadoutAssigned",nil];
if (!isNil "phx_isSpectator" || !isNil {player getVariable ["phx_isUnitSpectator",nil]}) then {
    params ["_args", "_handle"];
    [_handle] call CBA_fnc_removePerFrameHandler;
};
if (!isNil "_loadout" && {!isNil "phx_bluforBaseChannel"} && {!isNil "phx_opforBaseChannel"} && {!isNil "phx_indforBaseChannel"} && {isNil "phx_hasSWitem"} && {!isNil "phx_groupIDset"} && {isNil "phx_isSpectator"} && {isNil {player getVariable ["phx_isUnitSpectator",nil]}}) then {
    phx_hasSWitem = false;
    phx_hasLRitem = false;
    _LRlist = ["tf_rt1523g","tf_rt1523g_big","tf_rt1523g_black","tf_rt1523g_fabric","tf_rt1523g_green","tf_rt1523g_rhs","tf_rt1523g_sage","tf_anarc210","tf_rt1523g_big_bwmod","tf_rt1523g_big_bwmod_tropen","tf_rt1523g_bwmod","tf_rt1523g_big_rhs","tf_mr3000","tf_mr3000_multicam","tf_mr3000_rhs","tf_mr6000l","tf_mr3000_bwmod","tf_mr3000_bwmod_tropen","tf_anprc155","tf_anprc155_coyote","tf_anarc164"];
    _SWlist = ["ItemRadio","tf_anprc152","tf_anprc148jem","tf_fadak","tf_pnr100a","tf_anprc154","tf_rf7800str"];

    //Check to see if player has any items matching the lists above.
    if ((backpack player) in _LRlist) then {
        phx_hasLRitem = true;
    };

    {
        if (_x in _SWlist) then {
            phx_hasSWitem = true;
        };
    } forEach (assignedItems player);
    [phx_radHandle1] call CBA_fnc_removePerFrameHandler;
    call phx_fnc_radio_getChannels;
};
