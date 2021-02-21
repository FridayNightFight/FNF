/*
Creates a timer that controls when the player's loadout is equipped
Prevents the player from moving or seeing until the timer is finished
*/

//Don't stagger for local testing
if ((isServer && hasInterface) || CBA_missionTime > 30 || count (call BIS_fnc_listPlayers) < 50) exitWith {phx_staggeredLoaded = true};

phx_staggeredLoaded = false;
phx_screenBlack = false;
private _time = 8 + (random 20);
player enableSimulation false;

[{time > 0 && !isNull findDisplay 46}, {cutText ["Please Wait", "BLACK FADED", 99]; phx_screenBlack = true}] call CBA_fnc_waitUntilAndExecute;
[{(time > _this) && phx_screenBlack}, {
  cutText ["", "PLAIN"];
  player enableSimulation true;
  phx_staggeredLoaded = true;
  phx_screenBlack = false;
}, _time] call CBA_fnc_waitUntilAndExecute;
