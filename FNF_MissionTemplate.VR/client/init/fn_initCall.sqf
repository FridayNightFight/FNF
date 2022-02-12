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
* call fnf_client_fnc_initCall
*
* Public: No
*/

if (!hasInterface) exitWith {};

if (!isMultiplayer) exitWith {
  systemChat "This mission template is designed for multiplayer use, but is being run in a singleplayer environment. Clientside initialization has been halted -- please load in Multiplayer mode.";
  diag_log text "This mission template is designed for multiplayer use, but is being run in a singleplayer environment. Clientside initialization has been halted -- please load in Multiplayer mode.";
  [{getClientStateNumber >= 10}, {
    ["<t align='center'>WARNING<br/>This mission template is designed for multiplayer use, but is being run in a singleplayer environment.<br/><br/>Clientside initialization has been halted -- please load in Multiplayer mode.</t>", "error", 30] call fnf_ui_fnc_notify;
  }] call CBA_fnc_waitUntilAndExecute;
};

if ((fnf_attackingSide != fnf_defendingSide) && [fnf_attackingSide, fnf_defendingSide] call BIS_fnc_sideIsFriendly) exitWith {
  systemChat format["Attacking side (%1) and Defending side (%2) are configured but are allied. This will cause opposing sides to see each other on map.", fnf_attackingSide call BIS_fnc_sideName, fnf_defendingSide call BIS_fnc_sideName];
  diag_log text format["Attacking side (%1) and Defending side (%2) are configured but are allied. This will cause opposing sides to see each other on map.", fnf_attackingSide call BIS_fnc_sideName, fnf_defendingSide call BIS_fnc_sideName];
  [{getClientStateNumber >= 10}, {
    [
      format["<t align='center'>WARNING<br/>Attacking side (%1) and Defending side (%2) are configured but are allied. This will cause opposing sides to see each other on map.<br/><br/>Please fix this.</t>", fnf_attackingSide call BIS_fnc_sideName, fnf_defendingSide call BIS_fnc_sideName],
      "error", 30] call fnf_ui_fnc_notify;
  }] call CBA_fnc_waitUntilAndExecute;
};

if ([west, independent] call BIS_fnc_sideIsFriendly && [east, independent] call BIS_fnc_sideIsFriendly) then {
  systemChat "The Independent faction is allied to both BLUFOR and OPFOR. This should probably be changed.";
  diag_log text "The Independent faction is allied to both BLUFOR and OPFOR. This should probably be changed.";
  [{getClientStateNumber >= 10}, {
    ["<t align='center'>WARNING<br/>The Independent faction is allied to both BLUFOR and OPFOR. This should probably be changed.</t>", "error", 30] call fnf_ui_fnc_notify;
  }] call CBA_fnc_waitUntilAndExecute;
};

[{!isNil "fnf_serverGameSetup" && !isNil "fnf_safetyEnabled" && !isNil "fnf_safeZones"},{
  fnf_client_fnc_init call CBA_fnc_directCall;
}] call CBA_fnc_waitUntilAndExecute;
