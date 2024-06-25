/*
	Author: Mallen

	Description:
		watch a destroy objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: OBJECT -	The destroy objective object to be processed

	Returns:
		Boolean
*/

params["_objectiveObject", "_objectiveModule"];

if (alive _objectiveObject) exitWith
{
	false;
};

_objectiveModule setVariable ["fnf_objComplete", true, true];

true;
