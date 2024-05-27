/*
	Author: Mallen

	Description:
		Sets up the tracker for sequential objectives and handles them as they are used

	Parameter(s):
		None

	Returns:
		None
*/

fnf_seqeuntialObjectiveItemsToCheckServer = [];
//[_objModule, _side, _seqPlanModule, [_modules that must be complete]]

[{
	_indexsComplete = [];

	{
		_result = true;
		{
			_objComplete = _x getVariable ["fnf_objComplete", false];
			if (not _objComplete) then
			{
				_result = false;
				break;
			};
		} forEach (_x select 3);

		if (_result) then
		{
			_indexsComplete pushBack _forEachIndex;
		};
	} forEach fnf_seqeuntialObjectiveItemsToCheckServer;

	if (count _indexsComplete isNotEqualTo 0) then
	{
		{
			(fnf_seqeuntialObjectiveItemsToCheckServer select (_x - _forEachIndex)) params ["_objModule", "_side", "_seqPlanModule", "_modulesThatMustBeComplete"];

			_seqPlanModule setVariable ["fnf_sequentialObjCompleted", true, false];

			_moduleType = typeOf _objModule;

			switch (_moduleType) do
			{
				case "fnf_module_destroyObj":
				{
					[{
						params["_objModule", "_side"];
						[_objModule, _side] call FNF_ServerSide_fnc_initDestroy;
					}, [_objModule, _side], 1] call CBA_fnc_waitAndExecute;
				};

				case "fnf_module_sectorCaptureObj":
				{
					[{
						params["_objModule", "_side"];
						[_objModule, _side] call FNF_ServerSide_fnc_initCaptureSector;
					}, [_objModule, _side], 1] call CBA_fnc_waitAndExecute;
				};

				case "fnf_module_terminalObj":
				{
					[{
						params["_objModule", "_side"];
						[_objModule, _side] call FNF_ServerSide_fnc_initTerminal;
					}, [_objModule, _side], 1] call CBA_fnc_waitAndExecute;
				};

				case "fnf_module_assassinObj":
				{
					[{
						params["_objModule", "_side"];
						[_objModule, _side] call FNF_ServerSide_fnc_initAssassin;
					}, [_objModule, _side], 1] call CBA_fnc_waitAndExecute;
				};

				//if no type found then objective must be part of a new mod update that framework isnt equipped to handle
				default
				{};
			};

			fnf_seqeuntialObjectiveItemsToCheckServer deleteAt (_x - _forEachIndex);
		} forEach _indexsComplete;
	};
}, 1] call CBA_fnc_addPerFrameHandler;
