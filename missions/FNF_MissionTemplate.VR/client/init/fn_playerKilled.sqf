//Init spectator
//["Initialize", [ player ] ] call BIS_fnc_EGSpectator;
//[player, true] call TFAR_fnc_forceSpectator;

//Stop typing in chat if player is not logged-in admin
[] spawn {
  waitUntil {!isNull findDisplay 60000};
  if !(serverCommandAvailable "#kick") then {
    (findDisplay 60000) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
  };
};
