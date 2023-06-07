if (!isServer) exitWith {};

//start syncing timer for all players, important this is set up ASAP
call FNF_ServerSide_fnc_syncTimer;

_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _initModule == 0) exitWith {};
if (count _initModule > 1) exitWith {};

//setup fortify structures
[_initModule select 0] call FNF_ServerSide_fnc_initFortify;

//start admin channel
call FNF_ServerSide_fnc_initAdmin;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules != 0) then
{
  [_objModules] call FNF_ServerSide_fnc_initObjs;
};

//if there are objectives start watching them
if (not isNil "fnf_serverObjectives") then
{
  if (count fnf_serverObjectives != 0) then
  {
    [{
      _indexesToChangeIfCompleted = [];

      _totalBlufor = 0;
      _totalOpfor = 0;
      _totalIndi = 0;
      _completedBlufor = 0;
      _completedOpfor = 0;
      _completedindi = 0;

      {
        switch (_x select 0) do {
          case "DESTROY":
          {
            _result = [(_x select 3)] call FNF_ServerSide_fnc_watchDestroy;
            if (_result) then
            {
              _indexesToChangeIfCompleted pushBack _forEachIndex;
            };
          };
          case "CAPTURESECTOR":
          {
            _result = [(_x select 2),(_x select 1)] call FNF_ServerSide_fnc_watchCaptureSector;
            if (_result) then
            {
              _indexesToChangeIfCompleted pushBack _forEachIndex;
            };
          };
          default {};
        };
        {
          fnf_serverObjectives select _x set [0, true];
        } forEach _indexesToChangeIfCompleted;

        switch (_x select 1) do {
          case west:
          {
            _totalBlufor = _totalBlufor + 1;
            if ((_x select 0) isEqualTo true) then
            {
              _completedBlufor = _completedBlufor + 1;
            };
          };
          case east:
          {
            _totalOpfor = _totalOpfor + 1;
            if ((_x select 0) isEqualTo true) then
            {
              _completedOpfor = _completedOpfor + 1;
            };
          };
          case independent:
          {
            _totalIndi = _totalIndi + 1;
            if ((_x select 0) isEqualTo true) then
            {
              _completedIndi = _completedIndi + 1;
            };
          };
          default {};
        };
      } forEach fnf_serverObjectives;

      {
        _id = owner _x;
        if (admin _id == 2 or _x == player) then
        {
          _objectiveString = "Blufor Completed " + str(_completedBlufor) + " / " + str(_totalBlufor) + "\nOpfor Completed " + str(_completedOpfor) + " / " + str(_totalOpfor) + "\nIndipendent Completed " + str(_completedIndi) + " / " + str(_totalIndi);
          _alivePlayers = allPlayers select {alive _x};
          _deadSideString = "\nBlufor alive: " + str(west countSide _alivePlayers) + "\nOpfor alive: " + str(east countSide _alivePlayers) + "\nBlufor alive: " + str(independent countSide _alivePlayers);
          (_objectiveString + _deadSideString) remoteExec ["hintSilent", _id];
        }
      } forEach allPlayers;
    },1] call CBA_fnc_addPerFrameHandler;
  };
};
