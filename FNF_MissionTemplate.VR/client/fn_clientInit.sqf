phx_keyDownEHId = -1;
if !(call phx_fnc_clientCanPlay) exitWith {call phx_fnc_spectatorInit};
phx_playerSide = playerSide;

player linkItem "ItemMap";

phx_LoadoutChosen = false;
phx_loadoutGUI = displayNull;

call PHX_fnc_roles;
call phx_fnc_safety;
call PHX_fnc_adminDiary;
call PHX_fnc_terminalClientSetup;

[{!(isNull findDisplay 46) && !(isNull player)}, {46 call phx_fnc_disableTyping}] call CBA_fnc_waitUntilAndExecute;

[{time > 0}, {call phx_fnc_restrictions; call phx_fnc_checkLoadout;}] call CBA_fnc_waitUntilAndExecute;

player addEventHandler ["Killed", {call phx_fnc_spectatorInit;}];

_handle = [{
	if (phx_loadoutGUI isEqualTo displayNull) then {
		call PHX_fnc_loadoutGUI;
	};
	if !(phx_LoadoutChosen) then
	{

		_i = 0;

		{
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
				_dialogControl = phx_loadoutGUI displayCtrl _i + 1000;
				if (_currentInRole >= _x select 1) then 
				{
					if !(_dialogControl isEqualTo controllNull) then {
						ctrlDelete _dialogControl;
					};
				} else {
					if (_dialogControl isEqualTo controllNull) then {
						_button = phx_loadoutGUI ctrlCreate ["RscButton", _i + 1000]; 
						_button ctrlSetPosition [0.275,0.03 + 0.08 * _i,0.45,0.05];
						_button ctrlSetText (_x select 0);
						_button buttonSetAction '_temp = ' + (str _x) + '; call PHX_fnc_selector_remove; _temp call PHX_fnc_spawnLoadout; phx_loadoutGUI closeDisplay 1;';
						_button ctrlCommit 0;
					};
				};
			};
			_i = _i + 1;

		} forEach phx_roleList;
	};
}, 0, []] call CBA_fnc_addPerFrameHandler;
