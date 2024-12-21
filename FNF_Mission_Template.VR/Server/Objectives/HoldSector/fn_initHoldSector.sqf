/*
	Author: Mallen

	Description:
		init a hold sector objective on server side

	Parameter(s):
		0: INTEGER -	The index of the objective to intialise

	Returns:
		None
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

switch (_objState) do {
	//Obj has in no way been created
	case 0: {
		_syncedObjects = synchronizedObjects _module;

		_sequentialPlannersAssigned = [];
		{
			_typeOfObject = typeOf _x;

			if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
			{
				_sequentialPlannersAssigned pushBack _x;
			};
		} forEach _syncedObjects;

		//[objStateToUse, [PreRequisuteIndexs]]
		_sequentialResult = [_module, _objectiveIndex, _sequentialPlannersAssigned] call FNF_ServerSide_fnc_checkAndAddSequentialHandle;
		_sequentialResult params ["_objStateToUse", "_preRequisiteIndexs"];

		//get offending sides and if they are attacking
		_sides = [];
		_mainObjSide = sideUnknown;
		_modules = call FNF_ClientSide_fnc_findFNFModules;
		_objModules = [_modules, "sectorHoldObj"] call FNF_ClientSide_fnc_findSpecificModules;

		_zonePrefix = _module getVariable ["fnf_prefix", "FAILED"];

		{
			_checkingPrefix = _x getVariable ["fnf_prefix", "FAILED"];
			if (_zonePrefix isEqualTo _checkingPrefix) then
			{
				_syncedObjectsChecking = synchronizedObjects _x;

				_objSide = sideEmpty;

				{
					_objectType = typeOf _x;
					switch (_objectType) do
					{
						case "SideBLUFOR_F":
						{
							_objSide = west;
						};
						case "SideOPFOR_F":
						{
							_objSide = east;
						};
						case "SideResistance_F":
						{
							_objSide = independent;
						};
						default
						{
							continue;
						};
					};
				} forEach _syncedObjectsChecking;

				if (_x isEqualTo _module) then
				{
					_mainObjSide = _objSide;
				};

				_sides pushBackUnique _objSide;
			};
		} forEach _objModules;

		_sidesActiveSorted = [];
		if (west in _sides) then
		{
			_sidesActiveSorted pushBack west;
		};
		if (east in _sides) then
		{
			_sidesActiveSorted pushBack east;
		};
		if (independent in _sides) then
		{
			_sidesActiveSorted pushBack independent;
		};

		//check if zone already exists, if not create it
		_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
		if (not _result and isDedicated) then
		{
			_resultAddZone = [_zonePrefix, "", false, false] call FNF_ClientSide_fnc_addZone;
		};

		_codeOnCompletion = _module getVariable ["fnf_codeOnCompletion", ""];

		_codeOnCompletion = compile _codeOnCompletion;

		fnf_serverObjectives set [_objectiveIndex, [_objStateToUse, _module, _task, _alliedTask, _codeOnCompletion, [_zonePrefix, _sidesActiveSorted, _mainObjSide]]];
	};
	//Obj has been created but is not known
	case 1: {
		_params params ["_zonePrefix", "_sides", "_mainObjSide"];

		fnf_serverObjectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, [_zonePrefix, _sides, _mainObjSide]]];
	};
	//Obj has been created and is known
	case 2: {
		_params params ["_zonePrefix", "_sides", "_mainObjSide"];

		fnf_serverObjectives set [_objectiveIndex, [3, _module, _task, _alliedTask, _codeOnCompletion, [_zonePrefix, _sides, _mainObjSide]]];
	};
	default { };
};