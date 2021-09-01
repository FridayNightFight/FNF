disableSerialization;
//if loadout is already chosen stop function
if (phx_LoadoutChosen) exitWith {};
//if loadout GUI is open, player must not have a role
player setVariable ["role", "None", true];

//remove all items from player, loadout will provide new items
removeHeadgear player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player;
removeAllAssignedItems player;

//add map due to briefing screen not showing map without
player linkItem "ItemMap";

//function and PFH to prevent inventory opening
if (isNil "phx_inventoryLockPFH") then 
{
	phx_inventoryLockPFH = [{if (!isNull findDisplay 602)then {closeDialog 602};}] call CBA_fnc_addPerFrameHandler;
} else {
	[phx_inventoryLockPFH] call CBA_fnc_removePerFrameHandler;
	phx_inventoryLockPFH = [{if (!isNull findDisplay 602)then {closeDialog 602};}] call CBA_fnc_addPerFrameHandler;
};

//create loadout display
_phx_loadoutGUI = findDisplay 46 createDisplay "RscDisplayEmpty";
phx_loadoutGUI = [_phx_loadoutGUI];

//create background based on how many roles available		
_background = (phx_loadoutGUI select 0) ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0.25,0,0.5,0.03 + 0.08 * count phx_roleList];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_i = 0;

//create one button for each role and increase IDC by one each time
{
	_button = (phx_loadoutGUI select 0) ctrlCreate ["RscButton", _i + 1000]; 
	_button ctrlSetPosition [0.275,0.03 + 0.08 * _i,0.45,0.05];
	_button ctrlSetText (_x select 0);
	_button buttonSetAction '_temp = ' + (str _x) + '; call PHX_fnc_selector_remove; _temp call PHX_fnc_spawnLoadout; (phx_loadoutGUI select 0) closeDisplay 1; [phx_inventoryLockPFH] call CBA_fnc_removePerFrameHandler;';
	_button ctrlCommit 0;

	_i = _i + 1;

} forEach phx_roleList;