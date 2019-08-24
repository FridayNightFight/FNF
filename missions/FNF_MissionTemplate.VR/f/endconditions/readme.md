# endconditions
This module checks to see if some common conditions for ending a mission are met and then provides feedback to players. The conditions are if all players from the various teams have been eliminated as well as a specified time limit being reached.

***

#####Configure
######Elimination
In `'f/endconditions/settings.sqf'` you can select which teams you would like the script to monitor. If all players on one of these teams die then a message will repeatedly pop up informing all players.
######Time
By default the `'/description/cfgParams.hpp'` file should have a parameter in `class Params` with a few preset timelimits marked. You can edit those values to include whatever time limit options you would like your mission to have.
#####Disable
To disable this module you will need to remove `class phx_missionTimelimit` from `class Params` in the `'/description/cfgParams.hpp'` file of your mission. You will also need to remove or comment out the following lines from `'/f/init/fn_init_server.sqf'`:

```
phx_end_checkTime = [phx_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
phx_end_checkAlive = [phx_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;
```

and this line from `'/f/init/fn_init_client.sqf'`

```
phx_end_clientWait = [phx_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
```
