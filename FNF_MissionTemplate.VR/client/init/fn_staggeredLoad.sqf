/*
Creates a timer that controls when the player's loadout is equipped
Prevents the player from moving or seeing until the timer is finished
*/

//Don't stagger for local testing
if ((isServer && hasInterface) || CBA_missionTime > 30 || count (call BIS_fnc_listPlayers) < 60) exitWith {phx_staggeredLoaded = true};

phx_staggeredLoaded = false;
phx_screenBlack = false;
private _time = 10 + (random (count (call BIS_fnc_listPlayers) * 0.2));
player enableSimulation false;

[{time > 0}, {
  ["phx_blackScreenID",false] call BIS_fnc_blackOut;
  ["Please wait",-1,-1,_this] spawn BIS_fnc_dynamicText;
  phx_screenBlack = true;
}, _time] call CBA_fnc_waitUntilAndExecute;

[{(time > _this) && phx_screenBlack}, {
  ["phx_blackScreenID", true, 1] call BIS_fnc_blackIn;
  player enableSimulation true;
  phx_staggeredLoaded = true;
  phx_screenBlack = false;
}, _time] call CBA_fnc_waitUntilAndExecute;
