
phx_iconHandle = [{
  if (ace_spectator_isset) then {
    drawIcon3D ["a3\ui_f\data\map\Markers\Military\objective_CA.paa", [1,0,0,0.8], ASLToAGL getPosASL term1, 0.6, 0.6, 45];
  };
} , 0, []] call CBA_fnc_addPerFrameHandler;

player addEventHandler ["Killed", {call phx_fnc_spectatorInit;}];

phx_keyDownEHId = -1;
if !(call phx_fnc_clientCanPlay) exitWith {
		call phx_fnc_spectatorInit;
		if (didJIP && typeOf player != "ace_spectator_virtual") then {
			player setDamage 1;

			[{phx_safetyEnabled},{
				[false,false,false] call ace_spectator_fnc_setSpectator;
				[phx_iconHandle] call CBA_fnc_removePerFrameHandler;
				if (markerColor "opforSafeMarker" == "colorOPFOR") then	{
					if (phx_playerSide == west) then
					{
						player setpos ("bluforSafeMarker" call BIS_fnc_randomPosTrigger)
					} else {
						if (phx_playerSide == east) then
						{
							player setpos ("opforSafeMarker" call BIS_fnc_randomPosTrigger)
						};
					};
				};
				call PHX_fnc_clientInit;
			}] call CBA_fnc_waitUntilAndExecute;
		};
	};
phx_playerSide = playerSide;

player linkItem "ItemMap";

phx_LoadoutChosen = false;
phx_loadoutGUI = [displayNull];

if (didJIP) then {
	if (markerColor "bluforSafeMarker" == "colorOPFOR") then	{
		if (phx_playerSide == west) then
		{
			phx_playerSide = east;
			player setpos ("opforSafeMarker" call BIS_fnc_randomPosTrigger)
		} else {
			if (phx_playerSide == east) then
			{
				phx_playerSide = west;
				player setpos ("bluforSafeMarker" call BIS_fnc_randomPosTrigger)
			};
		};
	};
};

call PHX_fnc_roles;
call phx_fnc_safety;
call PHX_fnc_adminDiary;
call PHX_fnc_terminalClientSetup;

[{!(isNull findDisplay 46) && !(isNull player)}, {46 call phx_fnc_disableTyping}] call CBA_fnc_waitUntilAndExecute;

[{time > 0}, {call phx_fnc_restrictions;}] call CBA_fnc_waitUntilAndExecute;

_handle = [{
	if ((phx_loadoutGUI select 0) isEqualTo displayNull) then {
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
			if !((phx_loadoutGUI select 0) isEqualTo displayNull) then {
				_dialogControl = (phx_loadoutGUI select 0) displayCtrl _i + 1000;
				if (_currentInRole >= _x select 1) then 
				{
					if (ctrlEnabled _dialogControl) then {
						_dialogControl ctrlEnable false;
					};
				} else {
					if !(ctrlEnabled _dialogControl) then {
						_dialogControl ctrlEnable true;
					};
				};
			};
			_i = _i + 1;

		} forEach phx_roleList;
	};
}, 0, []] call CBA_fnc_addPerFrameHandler;

//Marking
[] execVM "client\icons\QS_icons.sqf";