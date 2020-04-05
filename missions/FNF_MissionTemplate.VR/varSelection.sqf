phx_gameMode = ""; //Change this string to whatever game mode you want (listed below)

phx_defendingSide = east; //east/west/independent
phx_attackingSide = west; //east/west/independent
//Not used if mode is neutral

phx_allowFortify = true; //Allow the defending side to use ACEX Fortify
phx_fortifyPoints = 50; //Currency for fortify
phx_fortifyColor = 0; //Color of fortifications. 0 = green, 1 = tan

//Set side you want to be able to change their starting zone, if any - uses the startSelection markers alrady placed in the editor
phx_startSelectionSide = false; //east/west/independent - false to disable

/*
=========================Modes=========================
destroy - ATK/DEF

Description:
Classic "blow thing up to win" mode. Attackers need to destroy some objects that the defenders need to protect.

The game will end if all objectives are destroyed.
====================================================================================================
ctf - ATK/DEF

Description:
Classic capture the flag. The attackers need to grab the flag from the defending side's flagpole and bring it back to a capture zone and hold it there.
The defenders are able to pick the flag up and return it by moving close to the flag pole.
The capture zone is not revealed to the defenders until the flag is in possession of the attackers.

Usage:
1. Move all the objects around the flagpole(named 'flagPole' in editor) to a new destination
2. Configure the size, shape, location of 'attackFlagTrig'. This is the area the attackers need to take the flag to in order to capture it.

Params:
None.
Default capture time is 5 mins. You can go into the file "f\modes\ctf.sqf" and change the 'captureTime' variable to a new time.
You can also change the update time of the flag marker from 10s(default) by changing the variable 'flagMarkerUpdateTime' to a new time;
====================================================================================================
rush - ATK/DEF

Description:
This is a classic advancing attack/defend mode. The attackers need to hack terminal 1 to unlock terminal 2, and hack 2 to unlock 3.
Try to design the mission in a linear way so the attackers have a clear path to each terminal.

Usage:
1. Move term1, term2 and term3 to wherever you want. All three terminals are needed for this mode.
2. Configure the 'objectives' array above. Three elements are needed, each represents the hack time for the corresponding terminals.

Params:
-hack time for terminal (integer, seconds)

Examples:
objectives = [120,90,60]; term1 hack time = 120 seconds - term2 hack time = 90 seconds - term3 hack time = 60 seconds

====================================================================================================
adSector - ATK/DEF

Description:
Attack/defend sector control mode. Attackers attempt to secure all sectors to win. Sector amount is configurable from 1-3.
When a sector is captured, it is deleted, and the attackers can move on to the next one.

Usage:
1. Move 'sector1', 'sector2' and 'sector3' to wherever you want.
2. Configure 'objectives' array with the number of sectors you want.
- If 1 is chosen, then 'sector1' sector object will be used. 2 = 'sector1' and 'sector2' being used. 3 = 'sector1', 'sector2' and 'sector3' being used.

Params:
-Number of sectors to defend/attack
====================================================================================================
neutralSector - neutral

Description:
This is a classic sector control mode. The first team to reach 100 points wins.
Supports 3 sides competing.

Usage:
1. Move the 'sector' sector object to wherever to want. Adjust the size to whatever to want.

Params:
-sector control time in minutes

Examples:
objectives = [10]; //10 minute control time

====================================================================================================
connection - neutral

Description:
A Mode where there are three terminals present on the map, each side attempts to hack each terminal.
Every 20 seconds, each side is awarded 1 point for each terminal they have controlled. First side to 100 points wins.
Supports 3 sides competing.

Usage:
1. Move term1, term2 and term3 to wherever you want.

Params:
None

====================================================================================================
neutralCTF - neutral

Description:
Classic capture the flag, neutral objective, supports 3 sides competing. Opposing capture zones are not shown to the player until that side picks up the flag.
i.e., The OPFOR capture zone is not shown to BLUFOR players until an OPFOR player picks up the flag.

Usage:
1. Move the trigger 'eastFlagTrig' to wherever you want the OPFOR capture zone to be. Set the trigger size/shape to whatever you want.
2. Move the trigger 'westFlagTrig' to wherever you want the BLUFOR capture zone to be. Set the trigger size/shape to whatever you want.
3. Move the trigger 'indFlagTrig' to wherever you want the INDFOR capture zone to be. Set the trigger size/shape to whatever you want.
4. Move the flag pole to wherever you want.

Params:
-sides competing (east, west, independent)

Examples:
objectives = [east,west]; //BLUFOR and OPFOR competing for the flag
objectives = [east,west,independent] //BLUFOR, OPFOR and INDFOR competing for the flag
*/
