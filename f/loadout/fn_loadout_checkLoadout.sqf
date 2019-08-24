if !(hasInterface) exitWith {};

[{
    params ["_args", "_handle"];
    _args params ["_addTime"];
    
    if !(missionNamespace getVariable ["phx_loadoutAssigned",false]) then {
        // After 30 seconds with no loadout being set, kick player back to the slotting screen
        if (diag_tickTime-30 > _addTime) then {
            diag_log format ["PHX [%1] checkLoadout - Waited 30 seconds and didn't get a loadout! Report this to the mission maker. - %2",diag_tickTime,_addTime];
            endMission "END1"; 
        };
    } else {
        // Loadout was set, stop PFH
        diag_log format ["PHX [%1] checkLoadout - Loadout set, took %2 seconds",diag_tickTime,(diag_tickTime - _addTime)];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [diag_tickTime]] call CBA_fnc_addPerFrameHandler;