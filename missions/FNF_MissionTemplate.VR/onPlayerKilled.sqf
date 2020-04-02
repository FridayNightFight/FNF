["Initialize", [ player ] ] call BIS_fnc_EGSpectator;

sleep 1;

[player, true] call TFAR_fnc_forceSpectator;

if !(serverCommandAvailable "#kick") then {
  (findDisplay 60492) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
};
