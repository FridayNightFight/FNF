/*
	Author: Mallen

	Description:
		Sets up the tracker for sequential objectives and handles them as they are used

	Parameter(s):
		None

	Returns:
		None
*/

fnf_seqeuntialObjectiveItemsToCheck = [];
//[_objModule, _forPlayer, _seqPlanModule, [_modules that must be complete], _objKnown]

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
  } forEach fnf_seqeuntialObjectiveItemsToCheck;

  if (count _indexsComplete isNotEqualTo 0) then
  {
    _knownObjRevealed = 0;
    _unknownObjRevealed = 0;

    _singleObjType = "";
    {
      (fnf_seqeuntialObjectiveItemsToCheck select _x) params ["_objModule", "_forPlayer", "_seqPlanModule", "_modulesThatMustBeComplete", "_objKnown"];
      if (_objKnown) then
      {
        _knownObjRevealed = _knownObjRevealed + 1;
      } else {
        _unknownObjRevealed = _unknownObjRevealed + 1;
      };

      _seqPlanModule setVariable ["fnf_sequentialObjCompleted", true, false];

      _moduleType = typeOf _objModule;

      switch (_moduleType) do
      {
        case "fnf_module_destroyObj":
        {
          [{
            params["_objModule", "_forPlayer"];
            [_objModule, _forPlayer] call FNF_ClientSide_fnc_initDestroy;
          }, [_objModule, _forPlayer], 6] call CBA_fnc_waitAndExecute;
          _singleObjType = "Destroy";
        };

        case "fnf_module_sectorCaptureObj":
        {
          [{
            params["_objModule", "_forPlayer"];
            [_objModule, _forPlayer] call FNF_ClientSide_fnc_initCaptureSector;
          }, [_objModule, _forPlayer], 6] call CBA_fnc_waitAndExecute;
          _singleObjType = "Capture Sector";
        };

        case "fnf_module_terminalObj":
        {
          [{
            params["_objModule", "_forPlayer"];
            [_objModule, _forPlayer] call FNF_ClientSide_fnc_initTerminal;
          }, [_objModule, _forPlayer], 6] call CBA_fnc_waitAndExecute;
          _singleObjType = "Terminal";
        };

        case "fnf_module_assassinObj":
        {
          [{
            params["_objModule", "_forPlayer"];
            [_objModule, _forPlayer] call FNF_ClientSide_fnc_initAssassin;
          }, [_objModule, _forPlayer], 6] call CBA_fnc_waitAndExecute;
          _singleObjType = "Assassin";
        };

        //if no type found then objective must be part of a new mod update that framework isnt equipped to handle
        default
        {
          if (fnf_debug) then
          {
            systemChat ("DANGER: FNF Obj module " + _moduleType + " is of unknown type, make sure template is up to date");
          };
        };
      };

      fnf_seqeuntialObjectiveItemsToCheck deleteAt (_x - _forEachIndex);
    } forEach _indexsComplete;



    _stringToSend = "";
    if (_knownObjRevealed isEqualTo 1 and _unknownObjRevealed isEqualTo 0) then
    {
      _stringToSend = "<t size='1.5' align='center'>Objective Now Active</t><br/><br/><t align='center'>Objective (OBJ NUM) is now active and can now be completed, please check the Tasks tab on your map!</t>";
    };
    if (_knownObjRevealed > 1 and _unknownObjRevealed isEqualTo 0) then
    {
      _stringToSend = "<t size='1.5' align='center'>Objectives Now Active</t><br/><br/><t align='center'>Multiple objectives are now active and can be completed, please check the Tasks tab on your map!</t>";
    };
    if (_knownObjRevealed isEqualTo 0 and _unknownObjRevealed isEqualTo 1) then
    {
      _stringToSend = "<t size='1.5' align='center'>New Objective Created</t><br/><br/><t align='center'>New " + _singleObjType + " objective has been created for you to complete, please check the Tasks tab on your map!</t>";
    };
    if (_knownObjRevealed isEqualTo 0 and _unknownObjRevealed > 1) then
    {
      _stringToSend = "<t size='1.5' align='center'>New Objectives Created</t><br/><br/><t align='center'>Multiple new objectives have been created for you to complete, please check the Tasks tab on your map!</t>";
    };
    if (_knownObjRevealed > 0 and _unknownObjRevealed > 0) then
    {
      _stringToSend = "<t size='1.5' align='center'>Objectives Now Active And Created</t><br/><br/><t align='center'>Multiple new objectives have been created for you to complete, in addition multiple objectives are now active and can be completed, please check the Tasks tab on your map!</t>";
    };

    [{
      params["_stringToSend"];
      [_stringToSend, "info"] call FNF_ClientSide_fnc_notificationSystem;
    }, [_stringToSend], 5] call CBA_fnc_waitAndExecute;
  };
}, 1] call CBA_fnc_addPerFrameHandler;
