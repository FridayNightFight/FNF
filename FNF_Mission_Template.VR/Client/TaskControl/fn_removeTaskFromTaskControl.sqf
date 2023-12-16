/*
	Author: Mallen

	Description:
		Remove a task from task control

	Parameter(s):
	  0: TASK - The task to be removed from task control

	Returns:
		None
*/

params["_task"];

_index = fnf_taskControlStack findIf {_task isEqualTo (_x select 0)};
if (_index isNotEqualTo -1) then
{
  fnf_taskControlStack deleteAt _index;
};
