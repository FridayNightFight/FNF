//Init spectator
["Initialize", [ player ] ] call BIS_fnc_EGSpectator;
[player, true] call TFAR_fnc_forceSpectator;

//Stop typing in chat if player is not logged-in admin
if !(serverCommandAvailable "#kick") then {
  (findDisplay 60492) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
};

//Remove respawn button
phx_killedNoRespawnButton = [{
  _ctrl = (findDisplay 49) displayCtrl 1010;
  _ctrl ctrlEnable false;
} , 0.25, []] call CBA_fnc_addPerFrameHandler;
