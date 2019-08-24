// Adds a CBA PFH that listens for a server variable that lets the client know if the mission has started or not.

if (!hasInterface) exitWith {};

[{
    params ["_args","_handle"];
    _args params ["_var"];

    // Variable not set yet, exit
    if (isNil "phx_hasGameStarted") exitWith {};
    private _typeOf = typeOf player;

    // Virtual Specator - Shouldn't get killed and placed into F3
    if (_typeOf isEqualTo "VirtualMan_F") then {
        diag_log format["PHX JIP Check: Player is spectator."];
        [_handle] call CBA_fnc_removePerFrameHandler;
    } else {
        // Player's in singleplayer, there is no JIP
        if (!isMultiplayer) then {
            diag_log format["PHX JIP Check: Game is singleplayer, removing PFH."];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _safeTimer = ["f_param_mission_timer",10] call BIS_fnc_getParamValue;

        // Variable set, game hasn't started yet. Player must not be a JIP. Remove PFH
        if (!phx_hasGameStarted && {isMultiplayer}) then {
            diag_log format["PHX JIP Check: Game didn't start yet, removing PFH."];
            [_handle] call CBA_fnc_removePerFrameHandler;
            phx_didJipCheck = true;

            // Player could still have JIPed, check and add to server's JIP list
            if (didJIP) then {
                [{!isNil "phx_loadoutAssigned"}, {
                    phx_JIP_playerConnected = player;
                    publicVariableServer "phx_JIP_playerConnected";
                }] call CBA_fnc_waitUntilAndExecute;
            };
        };

        // Game started, player is JIP, put him in spectate
        if (((phx_hasGameStarted) && {(isNil "phx_didJipCheck")}) && {isMultiplayer}) then {
            phx_didJipCheck = true;
            [_handle] call CBA_fnc_removePerFrameHandler;
            diag_log format["PHX JIP Check: Game started, removing PFH, adding waitUntilAndExec."];
            [{(!isNull player) && (player isEqualTo player)}, {
                // Execution
                [player] remoteExec ["hideObject",0,true];
                removeAllWeapons player;
                player setPos [-1000,-1000,0];
                player setVariable ["phx_loadoutAssigned",false];
                player setDamage 1;
                [player, true] call TFAR_fnc_forceSpectator;
                phx_show_timeUI = true;
            }, []] call CBA_fnc_waitUntilAndExecute;
        };
    };
}, 0, [_this]] call CBA_fnc_addPerFrameHandler;
