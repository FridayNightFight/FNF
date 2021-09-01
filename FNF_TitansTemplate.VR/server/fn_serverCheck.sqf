//called by client to verify player role (NOT FOOL PROOF)
_playerRole = _this select 0;
_playerRequested = _this select 1;

//check how many players are in the role
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

//if more players in role than allowed return no, else return yes!
if (_currentInRole >= _playerRole select 1) then {
	[false] remoteExec ["PHX_fnc_serverResponse", remoteExecutedOwner];
} else {	
	_playerRequested setVariable ["role", _playerRole select 0, true];
	[true] remoteExec ["PHX_fnc_serverResponse", remoteExecutedOwner];
};