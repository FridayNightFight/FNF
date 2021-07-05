//Gives player the correct gear
_roleSelection = _this;

phx_selector_weapons = [];

_currentInRole = 0;
{
	if (side _x == playerSide) then
	{
		_friendlyRole = _x getVariable["role", "None"];
		if (_friendlyRole == _roleSelection select 0) then
		{
			_currentInRole = _currentInRole + 1;
		};
	};
} forEach allPlayers;

if (_currentInRole >= _roleSelection select 1) exitWith {phx_LoadoutChosen = false};
phx_LoadoutChosen = true;
player setVariable ["role", _roleSelection select 0, true];

removeBackpack player;
call PHX_fnc_selector_remove;
_roleSelection select 2 call PHX_fnc_initLoadout;
call PHX_fnc_setLoadout;
call PHX_fnc_selector_init;