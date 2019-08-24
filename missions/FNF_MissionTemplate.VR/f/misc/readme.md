# misc

This module has a bunch of weird scripts that are used in different places. 

***

### fn__clearBody
Removes stuff from a dead body. 

Not used anywhere I don't think?

***

### fn__clearContainer
Removes stuff from a container. 

Not used anywhere I don't think?

***

### fn__hintThenClear
Displays a hint then clears it after a given time. If no time is given it clears it after 15 seconds. 

This was added because with our spectator script hints would persist forever. Anywhere a hint would normally be used this is usually used instead just to not annoy spectators.

***

### fn_clientJIP
Runs on clients when they join the mission. Handles deciding wether or not they JIPed after or before safestart. If they joined before safestart ended, spawn them normally, otherwise put them into spectate.

***

### fn_serverJIP
Server side companion to the above function. Also does some other things like handling the disabling of collision between spectator bodies and living players (part of the hacked together listen in functionality)

***

### fn_disableC...
These three functions are the reason people are able to listen to living players while in spectate. As far as I could tell TFAR doesn't have any support for this feature so I had to hack it together. It works pretty well for TvT only scenarios but in COOP or mixed scenarios spectators listening to living players will be able to kill AI by flying through them. It could also probably use some way to disable collisions with all vehicles in the mission but there haven't been any problems with that yet. 
