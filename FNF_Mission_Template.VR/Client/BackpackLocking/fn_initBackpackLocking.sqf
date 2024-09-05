/*
	Author: Mallen

	Description:
		Sets up Backpack locking

	Parameter(s):
		None

	Returns:
		None
*/

player setVariable ["fnf_backpackLocked", 1, true];

[{
	_playersClose = allPlayers select {(player distance2D _x) < 15};

	{
		_locked = _x getVariable ["fnf_backpackLocked", 1];
		_backpack = backpackContainer _x;
		if (_locked isEqualTo 1) then
		{
			_backpack lockInventory true;
		} else {
			_backpack lockInventory false;
		};
	} forEach _playersClose;
}, 2] call CBA_fnc_addPerFrameHandler;

_action = ["UnlockBackpack","Unlock Backpack","\A3\Ui_f\data\GUI\Cfg\KeyframeAnimation\IconKey_CA.paa",{
	player setVariable ["fnf_backpackLocked", 0, true];
	["<t size='1.5' align='center'>Backpack Unlocked</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
},{
	_value = player getVariable ["fnf_backpackLocked", 1];
	_value isNotEqualTo 2 and _value isNotEqualTo 0;
}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["LockBackpack","Lock Backpack","\A3\Ui_f\data\GUI\Cfg\KeyframeAnimation\IconKey_CA.paa",{
	player setVariable ["fnf_backpackLocked", 1, true];
	["<t size='1.5' align='center'>Backpack Locked</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
},{
	_value = player getVariable ["fnf_backpackLocked", 1];
	_value isNotEqualTo 2 and _value isNotEqualTo 1;
}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
