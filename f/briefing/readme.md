# briefing

This module adds entries to the players briefing page. 

***

###f_briefing_admin
For the admin at mission start, adds a briefing entry that allows them to control safestart parameters.
#####Configure
No configuration required.
#####Disable
In `'briefing.sqf'` remove the line `#include "f\briefing\f_briefing_admin.sqf"`.


***

###f_orbatNotes
Creates a briefing entry that shows information about all groups on the player's side. Includes group leader, group size, group name and the group's radio frequency as determined by the radio module.
#####Configure
If you wish to use this without the radio module you will need to remove the line ```waitUntil { !isNil "phx_playerBaseChannel"; };```.
#####Disable
In `'/f/init/fn_init_client.sqf'` remove or comment out the line that reads:
```
[] execVM "f\briefing\f_orbatNotes.sqf";
```
