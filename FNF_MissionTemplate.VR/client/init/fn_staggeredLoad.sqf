/*
Creates a timer that controls when the player's loadout is equipped
Prevents the player from moving or seeing until the timer is finished
*/

//Don't stagger for small player count or after mission start
if (CBA_missionTime > 30 || count (call BIS_fnc_listPlayers) < 60) exitWith {fnf_staggeredLoaded = true};

fnf_staggeredLoaded = false;
fnf_screenBlack = false;
private _time = 10 + (random 15); //keep this below 30 for fnf_loadout_fnc_checkLoadout
player enableSimulation false;

[{time > 0}, {
  ["fnf_blackScreenID",false] call BIS_fnc_blackOut;
  ["Please wait",-1,-1,_this-1.5] spawn BIS_fnc_dynamicText;
  fnf_screenBlack = true;
}, _time] call CBA_fnc_waitUntilAndExecute;

[{(time > _this) && fnf_screenBlack}, {
  ["fnf_blackScreenID", true, 1] call BIS_fnc_blackIn;
  player enableSimulation true;
  fnf_staggeredLoaded = true;
  fnf_screenBlack = false;
}, _time] call CBA_fnc_waitUntilAndExecute;
