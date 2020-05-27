_flagCaptureTime = 600; //How long the attackers need to hold the flag in their capture zone (seconds)

_flagMarkUpdateTime = 15; //How often the flag marker updates (seconds)

/*
====================================================================================================
Capture The Flag - atk/def

Description:
Classic capture the flag mode. Attacking team needs to control the flag, bring it back to their capture zone and hold it there for _flagCaptureTime.
The defending team  will not know where the capture zone is until the attackers have the flag.
The flag carrier moves at 65% normal speed.

Usage:
1. Move the object 'ctf_flagPole'
2. Move the capture zone trigger 'ctf_attackTrig'. Configure the trigger size and shape if you wish.
====================================================================================================
*/
