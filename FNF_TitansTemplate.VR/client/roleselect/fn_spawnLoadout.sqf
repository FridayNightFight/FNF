//Gives player the correct gear
_roleSelection = _this;

//loadout now chosen
phx_LoadoutChosen = true;

//set selectable weapons to none for overwriting later
phx_selector_weapons = [];

//server has not responded to call for loudout checking yet
phx_LoadoutServerAccepted = false;
phx_LoadoutServerResponse = false;

//display text to inform player
["Waiting for server...",-1,-1,5,0] spawn BIS_fnc_dynamicText;
_sentPlayer = player;
//ask server to verify role selection
[_roleSelection, _sentPlayer] remoteExec ["PHX_fnc_serverCheck", 2];

[{
	//wait for server response
	phx_LoadoutServerResponse == true
},{
	phx_LoadoutServerResponse = false;
	if (phx_LoadoutServerAccepted) then {
		//if accepted initiate loudout adding
		removeBackpack (_this select 1);
		call PHX_fnc_selector_remove;
		(_this select 0) select 2 call PHX_fnc_initLoadout;
		call PHX_fnc_setLoadout;
		call PHX_fnc_selector_init;
		//inform player loudout was chosen correctly
		["Loadout chosen",-1,-1,1,0] spawn BIS_fnc_dynamicText;
	} else {
		//if not accepted inform player and open role selection
		["Loadout already taken, re-choose loadout",-1,-1,2,0] spawn BIS_fnc_dynamicText;
		phx_LoadoutChosen = false;
	};
},[_roleSelection,player],5,{
	//if remoteExec fails or packet is lost after 5s reopen role selection
	["Server not responding, re-choose loadout",-1,-1,2,0] spawn BIS_fnc_dynamicText;
	phx_LoadoutChosen = false;
}] call CBA_fnc_waitUntilAndExecute;