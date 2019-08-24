#safestart
This module will make players invulnerable as well as delete their bullets and explosives when they fire weapons and put down/throw things. It has a set timer that it counts down from and once the timer expires it will stop deleting bullets and explosives and make players vulnerable again.

###Configure
The variable for length of safestart time is determined in the `/description/cfgParams.hpp` in `class f_param_mission_timer`.

###Disable
In `'/f/init/fn_init_shared.sqf'` remove the line:
```[] execVM "f\safeStart\f_safeStart.sqf";```
