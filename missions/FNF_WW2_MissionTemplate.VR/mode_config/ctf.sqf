_flagCaptureTime = 720; //How long the attackers need to hold the flag in their capture zone (seconds)

_flagMarkUpdateTime = 15; //How often the flag marker updates (seconds)

/*
====================================================================================================
Capture The Flag - atk/def

Description:
Classic capture the flag mode. Attacking team needs to control the flag, bring it back to their capture zone and hold it there for _flagCaptureTime.
The flag capture countdown will not start until the flag is dropped (cannot capture the flag while in vehicle or while unit is holding the flag).
The defending team  will not know where the capture zone is until the attackers have the flag.
The flag carrier moves at 65% normal speed.

Usage:
1. Move the object 'ctf_flagPole'
2. Move the capture zone trigger 'ctf_attackTrig'. Configure the trigger size and shape if you wish.
====================================================================================================
*/
