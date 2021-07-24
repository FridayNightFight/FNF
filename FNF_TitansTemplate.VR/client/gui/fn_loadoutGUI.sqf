disableSerialization;
if (phx_LoadoutChosen) exitWith {};
player setVariable ["role", "None", true];

removeHeadgear player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player;
removeAllAssignedItems player;

player linkItem "ItemMap";

if (isNil "phx_inventoryLockPFH") then 
{
	phx_inventoryLockPFH = [{if (!isNull findDisplay 602)then {closeDialog 602};}] call CBA_fnc_addPerFrameHandler;
} else {
	[phx_inventoryLockPFH] call CBA_fnc_removePerFrameHandler;
	phx_inventoryLockPFH = [{if (!isNull findDisplay 602)then {closeDialog 602};}] call CBA_fnc_addPerFrameHandler;
};


_phx_loadoutGUI = findDisplay 46 createDisplay "RscDisplayEmpty";
phx_loadoutGUI = [_phx_loadoutGUI];
    			
_background = (phx_loadoutGUI select 0) ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0.25,0,0.5,0.03 + 0.08 * count phx_roleList];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_i = 0;

{
	//_button = format["_button_%1", _x select 0];
	_button = (phx_loadoutGUI select 0) ctrlCreate ["RscButton", _i + 1000]; 
	_button ctrlSetPosition [0.275,0.03 + 0.08 * _i,0.45,0.05];
	_button ctrlSetText (_x select 0);
	_button buttonSetAction '_temp = ' + (str _x) + '; call PHX_fnc_selector_remove; _temp call PHX_fnc_spawnLoadout; (phx_loadoutGUI select 0) closeDisplay 1; [phx_inventoryLockPFH] call CBA_fnc_removePerFrameHandler;';
	_button ctrlCommit 0;

	_i = _i + 1;

} forEach phx_roleList;