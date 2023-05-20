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
  _splitString = (_desc select 1) splitString " ";
  _splitString deleteRange [0, 2];
  _item = _splitString joinString " ";
  _image = _desc select 0;
  _image = _image regexReplace ["width='300'", "size='6' align='center'"];
  ["<t size='1.5' align='center'>Objective Complete</t><br/><br/><t align='center'>" + _item + " has been destroyed</t><br/><br/>" + _image, "green", 10, 20] call FNF_ClientSide_fnc_notificationSystem;
} else {
  _task setTaskState "Failed";
  _desc = taskDescription _task;
  _splitString = (_desc select 1) splitString " ";
  _splitString deleteRange [0, 2];
  _item = _splitString joinString " ";
  _image = _desc select 0;
  _image = _image regexReplace ["width='300'", "size='6' align='center'"];
  ["<t size='1.5' align='center'>Objective Failed</t><br/><br/><t align='center'>" + _item + " has been destroyed</t><br/><br/>" + _image, "red", 10, 20] call FNF_ClientSide_fnc_notificationSystem;
};

true;