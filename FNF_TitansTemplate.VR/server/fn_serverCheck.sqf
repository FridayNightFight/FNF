_playerRole = _this select 0;
_playerRequested = _this select 1;

_currentInRole = 0;
{
	if (side _x == side _playerRequested) then
	{
		_friendlyRole = _x getVariable["role", "None"];
		if (_friendlyRole == _playerRole select 0) then
		{
			_currentInRole = _currentInRole + 1;
		};
	};
} forEach allPlayers;

if (_currentInRole >= _playerRole select 1) then {
	[false] remoteExec ["PHX_fnc_serverResponse", remoteExecutedOwner];
} else {	
	_playerRequested setVariable ["role", _playerRole select 0];
	[true] remoteExec ["PHX_fnc_serverResponse", remoteExecutedOwner];
};