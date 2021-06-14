if (player getVariable "LoadoutChosen") exitWith {};
player setVariable ["role", "None", true];

phx_loadoutGUI = findDisplay 46 createDisplay "RscDisplayEmpty";
    			
_background = phx_loadoutGUI ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0.25,0,0.5,0.03 + 0.08 * count phx_roleList];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_i = 0;

{
	//_button = format["_button_%1", _x select 0];
	_button = phx_loadoutGUI ctrlCreate ["RscButton", _i + 1000]; 
	_button ctrlSetPosition [0.275,0.03 + 0.08 * _i,0.45,0.05];
	_button ctrlSetText (_x select 0);
	_button buttonSetAction '_temp = ' + (str _x) + '; call PHX_fnc_selector_remove; _temp call PHX_fnc_spawnLoadout; player setVariable ["LoadoutChosen", true]; phx_loadoutGUI closeDisplay 1;';
	_button ctrlCommit 0;

	_i = _i + 1;

} forEach phx_roleList;