phx_keyDownEHId = -1;
if !(call phx_fnc_clientCanPlay) exitWith {call phx_fnc_spectatorInit};
phx_playerSide = playerSide;

player linkItem "ItemMap";

player setVariable ["LoadoutChosen", false];
phx_loadoutGUI = displayNull;

call PHX_fnc_roles;
call phx_fnc_safety;
call PHX_fnc_adminDiary;

[{!(isNull findDisplay 46) && !(isNull player)}, {46 call phx_fnc_disableTyping}] call CBA_fnc_waitUntilAndExecute;

[{time > 0}, {call phx_fnc_restrictions; call phx_fnc_checkLoadout;}] call CBA_fnc_waitUntilAndExecute;

player addEventHandler ["Killed", {call phx_fnc_spectatorInit;}];

_handle = [{
	if (phx_loadoutGUI isEqualTo displayNull) then {
		call PHX_fnc_loadoutGUI;
	};
	if !(player getVariable "LoadoutChosen") then
	{

		_i = 0;

		{
			_button = format["_button_%1", _x select 0];
	
			_temp = _x;
			_currentInRole = 0;
			{
				if (side _x == playerSide) then
				{
					_friendlyRole = _x getVariable["role", "None"];
					if (_temp select 0 == _friendlyRole) then
					{
						_currentInRole = _currentInRole + 1;
					};
				};
			} forEach allPlayers;
			if !(phx_loadoutGUI isEqualTo displayNull) then {
				if (_currentInRole >= _x select 1) then 
				{
					if (ctrlEnabled (_i + 1000)) then {
						ctrlEnable [_i + 1000, false];
					}
				} else {
					if !(ctrlEnabled (_i + 1000)) then {
						ctrlEnable [_i + 1000, true];
					}
				};
			};
			_i = _i + 1;

		} forEach phx_roleList;
	};
}, 0, []] call CBA_fnc_addPerFrameHandler;
