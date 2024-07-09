/*
	Author: Mallen

	Description:
		Sets up the tracker for sequential objectives and handles them as they are used

	Parameter(s):
		None

	Returns:
		None
*/

fnf_seqObjHandelerQueueServer = [];

[{
	_indexsToInit = [];
	_indexsToremoveFromHandeler = [];
	{
		_x params ["_preRequisiteIndexs", "_resultIndexs"];
		_allPreRequisitesHit = true;
		{
			_state = fnf_serverObjectives select _x select 0;
			if (_state < 4) then
			{
				_allPreRequisitesHit = false;
				break;
			};
		} forEach _preRequisiteIndexs;

		if (_allPreRequisitesHit) then
		{
			_indexsToremoveFromHandeler pushBack _forEachIndex;
			_indexsToInit append _resultIndexs;
		};
	} forEach fnf_seqObjHandelerQueueServer;

	_count = count _indexsToInit;

	if (_count > 0) then
	{
		{
			fnf_seqObjHandelerQueueServer deleteAt (_x - _forEachIndex);
		} forEach _indexsToremoveFromHandeler;

		_indexsToInit = _indexsToInit arrayIntersect _indexsToInit;
		_indexsToInit sort true;

		{
			_module = fnf_serverObjectives select _x select 1;
			_type = typeOf _module;
			switch (_type) do {
				case "fnf_module_destroyObj":
				{
					[_x] call FNF_ServerSide_fnc_initDestroy;
				};

				case "fnf_module_sectorCaptureObj":
				{
					[_x] call FNF_ServerSide_fnc_initCaptureSector;
				};

				case "fnf_module_terminalObj":
				{
					[_x] call FNF_ServerSide_fnc_initTerminal;
				};

				case "fnf_module_assassinObj":
				{
					[_x] call FNF_ServerSide_fnc_initAssassin;
				};
			};
		} forEach _indexsToInit;
	};
}, 1] call CBA_fnc_addPerFrameHandler;
