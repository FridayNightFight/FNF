["ace_killed", {
    params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

    if (_unit != player) exitWith {};

    private _friendlyFire = false;

    if (!isNull _killer && isNull _instigator) then {
        _instigator = effectiveCommander _killer;
    };

    //check killer is player
    private _killerIsPlayer = (!isNull _instigator) && {_unit != _instigator} && {[_instigator] call ace_common_fnc_isPlayer};

    // Log frendly fire
    private _fnc_getSideFromConfig = {
        params ["_object"];
        switch (getNumber (configFile >> "CfgVehicles" >> (typeOf _object) >> "side")) do {
            case (0): {east};
            case (1): {west};
            case (2): {resistance};
            default {civilian};
        };
    };
    if ((!isNull _instigator) && {_unit != _instigator} && {_instigator isKindOf "CAManBase"}) then {
        // Because of unconscious group switching/captives it's probably best to just use unit's config side
        private _unitSide = [_unit] call _fnc_getSideFromConfig;
        private _killerSide = [_instigator] call _fnc_getSideFromConfig;
        if ([_unitSide, _killerSide] call BIS_fnc_areFriendly) then {
            _friendlyFire = true;
        };
    };
    
    // If killer was player then send event to killer
    if (_killerIsPlayer) then {
        _currentKills = _killer getVariable ["Killcount", 0];
        if (_friendlyFire) then {
            _currentKills = _currentKills - 1;
        } else {
            _currentKills = _currentKills + 1;
        };
        _killer setVariable ["Killcount", _currentKills, true];
    };

}] call CBA_fnc_addEventHandler;

[] spawn {
    waitUntil { phx_gameEnd };
    call PHX_fnc_killCountUpdate;
}