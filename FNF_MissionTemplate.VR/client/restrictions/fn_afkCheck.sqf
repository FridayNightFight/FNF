/*
Check if player is idle for 10 mins, if so, display a message and allow them to press a key, otherwise kill the player after 30 seconds
Not active during safe start
*/

fnf_allowedIdle = 600; //Time in seconds allowed for player idle

fnf_idleTime = diag_tickTime + fnf_allowedIdle;

(findDisplay 46) displayAddEventHandler ["keyDown", "fnf_idleTime = diag_tickTime + fnf_allowedIdle;"];

fnf_afkCheck_idle = {
  //display warning message
  cutText ["<t color='#ff0000' size='3'>You have been idle for 10 minutes, press any key to continue playing</t>", "BLACK OUT", -1, true, true];
  fnf_idleKeyEH = (findDisplay 46) displayAddEventHandler ["keyDown", "
    cutText ['', 'BLACK IN'];
    (findDisplay 46) displayRemoveEventHandler ['keyDown', fnf_idleKeyEH];
  "];

  uisleep 30; //give player 30 seconds to press a key

  //Kill player if still idle
  if (fnf_idleTime < diag_tickTime) then {
    player setDamage 1;
    cutText ["", "BLACK IN"];
    fnf_idleTime = 99999;
  };
};

if (!isNil "fnf_restrictions_handle_afkCheck") then {
    [fnf_restrictions_handle_afkCheck] call CBA_fnc_removePerFrameHandler;
    fnf_restrictions_handle_afkCheck = nil;
};
fnf_restrictions_handle_afkCheck = [{
  if (!(alive player) || missionNamespace getVariable ["ace_spectator_isset",false]) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
  if (fnf_idleTime < diag_tickTime) then {
    if (scriptDone (missionNamespace getVariable ["fnf_idleHandle",scriptNull])) then {
      fnf_idleHandle = [] spawn fnf_afkCheck_idle;
    };
  };
}, 5] call CBA_fnc_addPerFrameHandler;
