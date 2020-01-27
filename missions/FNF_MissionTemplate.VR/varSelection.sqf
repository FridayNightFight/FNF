activeMode = "destroy_ez"; //Change this string to whatever game mode you want (listed below)
objectives = [];

defendingSide = west; //east/west/independent
attackingSide = east; //east/west/independent
publicVariable "defendingSide";
publicVariable "attackingSide";
//Not needed if objective is neutral

/*
=========================Modes=========================
destroy

Usage:
1. Create at least one object in the editor that can be destroyed, give the object a variable name (double-click, at the top)
2. Create a marker for the objective you created in step 1. The marker can be an icon or an area marker.
-The marker can be placed directly on the objective, or near it, just make sure the objective is in the marker area
3. Configure the objectives array at the top of this file. There are examples below, with the params listed with descriptions

Params:
-variable name of objective (object name)
-corresponding marker name (string)
-object description - used for task name (string)
-whether or not the exact objective location is visible to attackers (boolean), true = visible
-whether or not the objective can move (vehicles, units, etc.), (boolean), true = the objective is expected to move

Examples:
objectives = [[cache1,"Cache_Marker","weapons cache",false,true]]; - 1 objective, object named cache1, marker named "Cache_Marker", name for task title "weapons cache",
objective location not visible to attackers (no task marker), objective able to be moved (marker will update for attackers)

objectives = [[cache,"Cache_Marker","weapons cache",false,true], [tank,"Tank_Marker","prototype tank",true,false]]; - 2 objectives

*There can be an infinite number of objectives*

The game will end if all objectives are destroyed
====================================================================================================
destroy_ez

Quick-setup version of destroy mode with pre-configured objectives.

Usage:
1. Move 'cache1' and 'cache2' to new locations.
2. Move 'cache1Mark' so cache1 is somewhere inside the marker
3. Move 'cache2Mark' so cache2 is somewhere inside the marker

Params:
None. The mode is configured so the location of the caches is unknown to the attackers. They need to search the cache markers to find them.
====================================================================================================
uplink

Usage:
1. Choose if you want 1 or 2 terminals.
2. Move term1 and/or term2 to new locations

Params:
-number of terminals (1 or 2)
-hack time of terminals (in seconds)

Examples:
objectives = [1,120]; //1 terminal (term1) with a hack time of 2 minutes
objectives = [2,180]; //2 terminals (term1 & term2) with hack times of 3 minutes
====================================================================================================
ctf

Usage:
1. Move all the objects around the flagpole(named 'flagPole' in editor) to a new destination
2. Configure the size, shape, location of 'attackFlagTrig'. This is the area the attackers need to take the flag to in order to capture it.

Params:
None.
Default capture time is 5 mins. You can go into the file "f\modes\ctf.sqf" and change the 'captureTime' variable to a new time.
You can also change the update time of the flag marker from 10s(default) by changing the variable 'flagMarkerUpdateTime' to a new time;
====================================================================================================
rush

Usage:
1.

Params:
-data terminal name (object name)
-hack time for terminal (integer, seconds)

Examples:
objectives = [[cache1,"Cache_Marker","wepaons cache",false,true]]; - 1 objective, object named cache1, marker named "Cache_Marker", name for task title "weapons cache",
objective location not visible to attackers (no task marker), objective able to be moved (marker will update for attackers)

objectives = [[cache,"Cache_Marker","wepaons cache",false,true], [tank,"Tank_Marker","prototype tank",true,false]]; - 2 objectives

*There can be an infinite number of objectives*

The game will end if all objectives are destroyed

====================================================================================================
neutralSector

Usage:
1. Move the 'sector' sector object to wherever to want. Adjust the size to whatever to want.

Params:
-sector control time in minutes

Examples:
objectives = [10]; //10 minute control time
*/
