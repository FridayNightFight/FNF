/*
	Author: Mallen

	Description:
		Adds a task to task control

	Parameter(s):
	  0: TASK - The task to add to task control
    1: BOOLEAN - Whether the task should be assigned or not

	Returns:
		None
*/

params["_task", "_assigned"];

fnf_taskControlStack pushBack [_task, _assigned];
