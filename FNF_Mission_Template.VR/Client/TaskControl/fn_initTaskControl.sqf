/*
	Author: Mallen

	Description:
		Inits task control to prevent player from un-assigning or assigning tasks themselves, instead it is controlled here

	Parameter(s):
	  None

	Returns:
		None
*/

//[task, assigned bool]
fnf_taskControlStack = [];

[{
  {
    _x params ["_task", "_assigned"];

    _currentState = taskState _task;
    switch (_currentState) do {
      case "None";
      case "Created": { if (_assigned) then {_task setTaskState "Assigned"; }; };
      case "Assigned": { if (not _assigned) then {_task setTaskState "Created"; }; };
    };
  } forEach fnf_taskControlStack;
},0.1] call CBA_fnc_addPerFrameHandler;
