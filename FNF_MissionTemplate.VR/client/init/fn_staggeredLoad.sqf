/*
Creates a timer that controls when the player's loadout is equipped
Prevents the player from moving or seeing until the timer is finished
*/

//Don't stagger for small player count or after mission start
if (CBA_missionTime > 30 || count (call BIS_fnc_listPlayers) < 60) exitWith {phx_staggeredLoaded = true};

phx_staggeredLoaded = false;
phx_screenBlack = false;
private _time = 5 + (random 17); //keep this below 30 for phx_fnc_checkLoadout
player enableSimulation false;

[{time > 0}, {
  ["phx_blackScreenID",false] call BIS_fnc_blackOut;
  ["Please wait",-1,-1,_this-1.5] spawn BIS_fnc_dynamicText;
  phx_screenBlack = true;
}, _time] call CBA_fnc_waitUntilAndExecute;

[{(time > _this) && phx_screenBlack}, {
  ["phx_blackScreenID", true, 1] call BIS_fnc_blackIn;
  player enableSimulation true;
  phx_staggeredLoaded = true;
  phx_screenBlack = false;
}, _time] call CBA_fnc_waitUntilAndExecute;
