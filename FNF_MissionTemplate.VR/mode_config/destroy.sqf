_obj1 = [destroy_obj_1,"destroy_obj_1_mark","weapons cache"];
_obj2 = [destroy_obj_2,"destroy_obj_2_mark","weapons cache"];
_obj3 = [objNull,"",""];

/*
[OBJECT_NAME, MARKER_NAME, OBJECT_DESCRIPTION]
*/

/*
Usage:

Quick-configure:
1. Use the pre-placed objects destroy_obj_1 and/or destroy_obj_2
2. Move the objective(s) to where you want them
3. If you only want 1 objective, only move destroy_obj_1 and set the first element in the _obj2 arrray above to objNull

Custom:
1. Create at least one object in the editor that can be destroyed, give the object a variable name (double-click, at the top)
2. Create a marker for the objective you created in step 1. ***The marker HAS to be an AREA MARKER***
3. Input the object name (object), marker name (string), and objective description (string) of your objectives into the arrays at the top of this file.

There is a maximum of 3 objectives, minimum of 1
*/
