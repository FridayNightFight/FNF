//Gives player the correct gear
_roleSelection = _this;

phx_LoadoutChosen = true;

phx_selector_weapons = [];

phx_LoadoutServerAccepted = false;

phx_LoadoutServerResponse = false;

["Waiting for server...",-1,-1,5,0] spawn BIS_fnc_dynamicText;
_sentPlayer = player;
[_roleSelection, _sentPlayer] remoteExec ["PHX_fnc_serverCheck", 2];

[{
	phx_LoadoutServerResponse == true
},{
	phx_LoadoutServerResponse = false;
	if (phx_LoadoutServerAccepted) then {
		removeBackpack (_this select 1);
		call PHX_fnc_selector_remove;
		(_this select 0) select 2 call PHX_fnc_initLoadout;
		call PHX_fnc_setLoadout;
		call PHX_fnc_selector_init;
		["Loadout chosen",-1,-1,1,0] spawn BIS_fnc_dynamicText;
	} else {
		["Loadout already taken, re-choose loadout",-1,-1,2,0] spawn BIS_fnc_dynamicText;
		phx_LoadoutChosen = false;
	};
},[_roleSelection,player],5,{
	["Server not responding, re-choose loadout",-1,-1,2,0] spawn BIS_fnc_dynamicText;
	phx_LoadoutChosen = false;
}] call CBA_fnc_waitUntilAndExecute;