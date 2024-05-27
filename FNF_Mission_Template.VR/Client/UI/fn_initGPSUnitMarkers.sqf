/*
	Author: Mallen

	Description:
		Shows the units on players side in the GPS screen

	Parameter(s):
		None

	Returns:
		None
*/

fnf_unitsToDraw = [];
fnf_linesToDraw = [];

_iconStyle = missionNamespace getVariable "diwako_dui_icon_style";
_iconNamespace = missionNamespace getVariable ("diwako_dui_main_icon_" + _iconStyle);

[{
	fnf_unitsToDraw = [];
	fnf_linesToDraw = [];

	_allGroups = groups playerSide;
	{
		_leader = leader _x;

		_leaderPos = getPos _leader;

		_playersGroup = _x isEqualTo (group player);

		{
			if (not alive _x) then {continue;};

			_dir = getDir _x;

			_pos = getPos _x;

			_colour = [playerSide] call BIS_fnc_sideColor;
			if (_playersGroup) then
			{
				_colour = _x getVariable ["diwako_dui_main_compass_color", [1, 1, 1]];
				if (_leader isNotEqualTo _x) then
				{
					if (_leader isEqualTo player) then
					{
						fnf_linesToDraw pushBack [_pos, 0, true];
					} else {
						fnf_linesToDraw pushBack [_pos, _leaderPos, false];
					};
				};
			};
			_colour = _colour + [1];

			_tex = [_x, (_this select 0 select 0), player] call diwako_dui_radar_fnc_getIcon;
			_playerIcon = false;
			if (_x isEqualTo player) then
			{
				_playerIcon = true;
			};
			fnf_unitsToDraw pushBack [_tex,_colour,_pos,_dir,_playerIcon];
		} forEach units _x;
	} forEach _allGroups;

	if (player isNotEqualTo leader player) then
	{
		fnf_linesToDraw pushBack [getPos leader player, 0, true];
	};
}, 1, [_iconNamespace]] call CBA_fnc_addPerFrameHandler;

[{
	_gps = controlNull;
	{
	if (['311',(str _x),FALSE] call BIS_fnc_inString) then {
		if (!isNull (_x displayCtrl 101)) then {
			_gps = (_x displayCtrl 101);
			};
		};
	} forEach (uiNamespace getVariable 'IGUI_displays');
	not (_gps isEqualTo controlNull);
},{
	{
		if (['311',(str _x),FALSE] call BIS_fnc_inString) then {
			if (!isNull (_x displayCtrl 101)) exitWith {
				_gps = (_x displayCtrl 101);
				_gps ctrlAddEventHandler ['Draw',{
					_map = _this select 0;

					_playerPos = getPos player;
					_playerDir = getDir player;

					{
						_x params ["_texture","_colour","_position","_angle","_playerIcon"];
						if (_playerIcon) then
						{
							_map drawIcon [_texture, _colour, _playerPos, 24, 24, _playerDir];
						} else {
							_map drawIcon [_texture, _colour, _position, 24, 24, _angle];
						}
					} forEach fnf_unitsToDraw;

					{
						_x params ["_pos1","_pos2","_playerLine"];
						if (_playerLine) then
						{
							_map drawLine [_pos1, _playerPos, [1,1,1,0.6]];
						} else {
							_map drawLine [_pos1, _pos2, [1,1,1,0.6]];
						};
					} forEach fnf_linesToDraw;
				}];
			};
		};
	} forEach (uiNamespace getVariable 'IGUI_displays');
}] call CBA_fnc_waitUntilAndExecute;
