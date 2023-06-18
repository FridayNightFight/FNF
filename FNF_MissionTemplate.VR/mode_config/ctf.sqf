_flagCaptureTime = 600; //How long the attackers need to hold the flag in their capture zone (seconds)
_flagMarkUpdateTime = 15; //How often the flag marker updates (seconds)
_showCapZoneGlobal = false; //false: capture zone will only be shown to attackers at mission start - true: capture zone will be shown to all players at mission start

/*
====================================================================================================
Capture The Flag - atk/def

Description:
Classic capture the flag mode. Attacking team needs to control the flag, bring it back to their capture zone and hold it there for _flagCaptureTime.
The flag capture countdown will not start until the flag is dropped (cannot capture the flag while in vehicle or while unit is holding the flag).
The defending team will not know where the capture zone is until the attackers have the flag.

Usage:
1. Move the object 'ctf_flagPole'
2. Move the capture zone trigger 'ctf_attackTrig'. Configure the trigger size and shape if you wish.
====================================================================================================
*/
