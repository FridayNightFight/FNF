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

params["_objectiveObject", "_task"];

if (alive _objectiveObject) exitWith
{
  false;
};

//if objective is dead fail or succeed task
_taskType = taskType _task;
if (_taskType == "destroy") then
{
  _task setTaskState "Succeeded";
  _desc = taskDescription _task;
  ["TaskSucceeded", ["", (_desc select 1)]] call BIS_fnc_showNotification;
} else {
  _task setTaskState "Failed";
  _desc = taskDescription _task;
  ["TaskFailed", ["", (_desc select 1)]] call BIS_fnc_showNotification;
};

true;
