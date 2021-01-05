/*
Creates a timer that controls when the player's loadout is equipped
Prevents the player from moving or seeing until the timer is finished
*/

//Don't stagger for local testing
if (isServer && hasInterface) exitWith {phx_staggeredLoaded = true};

phx_staggeredLoaded = false;
private _time = (random 15) + 5;
player enableSimulation false;

[{time > 0 && !isNull findDisplay 46}, {cutText ["Please Wait", "BLACK FADED", 99];}] call CBA_fnc_waitUntilAndExecute;
[{time > _this}, {
  cutText ["", "PLAIN"];
  player enableSimulation true;
  phx_staggeredLoaded = true;
}, _time] call CBA_fnc_waitUntilAndExecute;
