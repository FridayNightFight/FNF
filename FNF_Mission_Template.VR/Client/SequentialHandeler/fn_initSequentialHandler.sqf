/*
	Author: Mallen

	Description:
		Sets up the tracker for sequential objectives and handles them as they are used

	Parameter(s):
		None

	Returns:
		None
*/

fnf_seqObjHandelerQueue = [];

[{
	_indexsToInit = [];
	_indexsToremoveFromHandeler = [];
	{
		_x params ["_preRequisiteIndexs", "_resultIndexs"];
		_allPreRequisitesHit = true;
		{
			_state = fnf_objectives select _x select 0;
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
	} forEach fnf_seqObjHandelerQueue;

	_count = count _indexsToInit;

	if (_count > 0) then
	{
		{
			fnf_seqObjHandelerQueue deleteAt (_x - _forEachIndex);
		} forEach _indexsToremoveFromHandeler;

		_indexsToInit = _indexsToInit arrayIntersect _indexsToInit;
		_indexsToInit sort true;

		{
			_module = fnf_objectives select _x select 1;
			_type = typeOf _module;
			switch (_type) do {
				case "fnf_module_destroyObj":
				{
					[_x] call FNF_ClientSide_fnc_initDestroy;
				};

				case "fnf_module_sectorCaptureObj":
				{
					[_x] call FNF_ClientSide_fnc_initCaptureSector;
				};

				case "fnf_module_sectorHoldObj":
				{
					[_x] call FNF_ClientSide_fnc_initHoldSector;
				};

				case "fnf_module_terminalObj":
				{
					[_x] call FNF_ClientSide_fnc_initTerminal;
				};

				case "fnf_module_assassinObj":
				{
					[_x] call FNF_ClientSide_fnc_initAssassin;
				};
			};
		} forEach _indexsToInit;

		_stringArray = ["<t size='1.5' align='center'>New Objective"];

		if (_count > 1) then
		{
			_stringArray pushBack "s"
		};

		_stringArray pushBack " Available</t><br/><br/><t align='center'>Objective";

		if (_count > 1) then
		{
			_stringArray pushBack "s"
		};

		if (_count isEqualTo 1) then
		{
			_stringArray pushBack format[" %1 is ", ((_indexsToInit select 0) + 1)];
		};
		if (_count isEqualTo 2) then
		{
			_stringArray pushBack format[" %1 and %2 are ", ((_indexsToInit select 0) + 1), ((_indexsToInit select 1) + 1)];
		};
		if (_count > 2) then
		{
			_stringArray pushBack " ";
			{
				_stringArray pushBack format["%1, ", _x];
			} forEach _indexsToInit;
			_stringArray set [-1, format["and %1 are ", ((_indexsToInit select -1) + 1)]];
		};

		_stringArray pushBack "now available and can be completed, please check the Tasks tab on your map!</t>";

		_string = _stringArray joinString "";

		[{[_this, "info", 10] call FNF_ClientSide_fnc_notificationSystem;}, _string, 3] call CBA_fnc_waitAndExecute;
	};
}, 1] call CBA_fnc_addPerFrameHandler;
