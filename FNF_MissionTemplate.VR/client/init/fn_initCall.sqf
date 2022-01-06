/*
* Author: Martin, IndigoFox
*
* Description:
* Initializes client init scripts when the server has completed game setup and safety is defined. Called postInit.
*
* Arguments:
* <NONE>
*
* Return Value:
* <NIL>
*
* Example:
* call phx_client_fnc_initCall
*
* Public: No
*/

if (!isMultiplayer) exitWith {
  systemChat "This mission template is designed for multiplayer use, but is being run in a singleplayer environment. Clientside initialization has been halted -- please load in Multiplayer mode.";
  [{getClientStateNumber >= 10}, {
    ["<font align='center'>WARNING<br/>This mission template is designed for multiplayer use, but is being run in a singleplayer environment.<br/><br/>Clientside initialization has been halted -- please load in Multiplayer mode.</font>", "error", 30] call phx_ui_fnc_notify;
    diag_log text "This mission template is designed for multiplayer use, but is being run in a singleplayer environment. Clientside initialization has been halted -- please load in Multiplayer mode.";
  }] call CBA_fnc_waitUntilAndExecute;
};
if (hasInterface) then {
  [{!isNil "phx_serverGameSetup" && !isNil "phx_safetyEnabled"},{
    phx_client_fnc_init call CBA_fnc_directCall;
  }] call CBA_fnc_waitUntilAndExecute;
};
