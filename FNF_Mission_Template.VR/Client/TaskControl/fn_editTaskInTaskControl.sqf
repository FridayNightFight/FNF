/*
	Author: Mallen

	Description:
		Edits an exsisting task in task control

	Parameter(s):
	  0: TASK - The task to edit in task control
    1: BOOLEAN - Whether the task should be assigned or not

	Returns:
		None
*/

params["_task", "_assigned"];

_index = fnf_taskControlStack findIf {_task isEqualTo (_x select 0)};
if (_index isNotEqualTo -1) then
{
  (fnf_taskControlStack select _index) set [1, _assigned];
};
