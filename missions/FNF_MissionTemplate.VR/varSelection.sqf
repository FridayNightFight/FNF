activeMode = ""; //Change this string to whatever game mode you want (listed below)
objectives = [];

defendingSide = west; //east/west/independent
attackingSide = east; //east/west/independent
publicVariable "defendingSide";
publicVariable "attackingSide";
//Not needed if objective is neutral

/*
=========================Modes=========================
adDestroy

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
objectives = [[cache1,"Cache_Marker","wepaons cache",false,true]]; - 1 objective, object named cache1, marker named "Cache_Marker", name for task title "weapons cache",
objective location not visible to attackers (no task marker), objective able to be moved (marker will update for attackers)

objectives = [[cache,"Cache_Marker","wepaons cache",false,true], [tank,"Tank_Marker","prototype tank",true,false]]; - 2 objectives

*There can be an infinite number of objectives*

The game will end if all objectives are destroyed
====================================================================================================
adRush

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
*/
