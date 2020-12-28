/*
Check if player is idle for 10 mins, if so, display a message and allow them to press a key, otherwise kill the player after 30 seconds
Not active during safe start
*/

waitUntil {!phx_safetyEnabled};
waitUntil {!isNull (findDisplay 46)};

phx_allowedIdle = 600; //Time in seconds allowed for player idle

phx_idleTime = diag_tickTime + phx_allowedIdle;

phx_afkCheck_keypress = {
  phx_idleTime = diag_tickTime + phx_allowedIdle;
};

(findDisplay 46) displayAddEventHandler ["keyDown", "call phx_afkCheck_keypress"];

phx_afkCheck_idle = {
  //display warning message
  cutText ["<t color='#ff0000' size='3'>You have been idle for 10 minutes, press any key to continue playing</t>", "BLACK OUT", -1, true, true];
  phx_idleKeyEH = (findDisplay 46) displayAddEventHandler ["keyDown", "
    cutText ['', 'BLACK IN'];
    (findDisplay 46) displayRemoveEventHandler ['keyDown', phx_idleKeyEH];
  "];

  uisleep 30; //give player 30 seconds to press a key

  //Kill player if still idle
  if (phx_idleTime < diag_tickTime) then {
    player setDamage 1;
    cutText ["", "BLACK IN"];
    phx_idleTime = 99999;
  };
};

[{
  if (!(alive player) || missionNamespace getVariable ["ace_spectator_isset",false]) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
  if (phx_idleTime < diag_tickTime) then {
    if (scriptDone (missionNamespace getVariable ["phx_idleHandle",scriptNull])) then {
      phx_idleHandle = [] spawn phx_afkCheck_idle;
    };
  };
}, 5] call CBA_fnc_addPerFrameHandler;
