/*
	Author: Mallen

	Description:
    watch a destroy objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: OBJECT -  The destroy objective object to be processed
    2: TASK -  The task to be processed

	Returns:
		Boolean
*/

params["_objectiveObject"];

if (alive _objectiveObject) exitWith
{
  false;
};

true;
